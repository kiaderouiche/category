#include <Godunov.H>
#include <MOL.H>
#include <incflo.H>

using namespace amrex;

void incflo::init_advection ()
{
    m_iconserv_velocity.resize(AMREX_SPACEDIM, 0);
    m_iconserv_velocity_d.resize(AMREX_SPACEDIM, 0);

    m_iconserv_density.resize(1, 1);
    m_iconserv_density_d.resize(1, 1);

    m_iconserv_tracer.resize(m_ntrac, 1);
    m_iconserv_tracer_d.resize(m_ntrac, 1);
}

void
incflo::compute_convective_term (Vector<MultiFab*> const& conv_u,
                                 Vector<MultiFab*> const& conv_r,
                                 Vector<MultiFab*> const& conv_t,
                                 Vector<MultiFab const*> const& vel,
                                 Vector<MultiFab const*> const& density,
                                 Vector<MultiFab const*> const& tracer,
                                 AMREX_D_DECL(Vector<MultiFab*> const& u_mac,
                                              Vector<MultiFab*> const& v_mac,
                                              Vector<MultiFab*> const& w_mac),
                                 Vector<MultiFab const*> const& vel_forces,
                                 Vector<MultiFab const*> const& tra_forces,
                                 Real time)
{
    int ngmac = nghost_mac();

    Real l_dt = m_dt;

    for (int lev = 0; lev <= finest_level; ++lev) {

#ifdef AMREX_USE_EB
        const EBFArrayBoxFactory* ebfact = &EBFactory(lev);
#endif

        // Predict normal velocity to faces -- note that the {u_mac, v_mac, w_mac}
        //    returned from this call are on face CENTROIDS
        if (m_use_godunov) {
            godunov::predict_godunov(lev, time, AMREX_D_DECL(*u_mac[lev], *v_mac[lev], *w_mac[lev]), *vel[lev], *vel_forces[lev],
                                     get_velocity_bcrec(), get_velocity_bcrec_device_ptr(), 
                                     Geom(), l_dt, m_godunov_ppm, m_godunov_use_forces_in_trans);
        } else {

            mol::predict_vels_on_faces(lev, AMREX_D_DECL(*u_mac[lev], *v_mac[lev], *w_mac[lev]), *vel[lev],
                                       get_velocity_bcrec(), get_velocity_bcrec_device_ptr(), 
#ifdef AMREX_USE_EB
                                       ebfact,
#endif
                                       Geom()); 
        }
    }

    apply_MAC_projection(AMREX_D_DECL(u_mac, v_mac, w_mac), density, time);

    for (int lev = 0; lev <= finest_level; ++lev)
    {
        if (ngmac > 0) {
            AMREX_D_TERM(u_mac[lev]->FillBoundary(geom[lev].periodicity());,
                         v_mac[lev]->FillBoundary(geom[lev].periodicity());,
                         w_mac[lev]->FillBoundary(geom[lev].periodicity()););
        }

        MFItInfo mfi_info;
        // if (Gpu::notInLaunchRegion()) mfi_info.EnableTiling(IntVect(1024,16,16)).SetDynamic(true);
        if (Gpu::notInLaunchRegion()) mfi_info.EnableTiling(IntVect(AMREX_D_DECL(1024,1024,1024))).SetDynamic(true);
#ifdef _OPENMP
#pragma omp parallel if (Gpu::notInLaunchRegion())
#endif
        for (MFIter mfi(*density[lev],mfi_info); mfi.isValid(); ++mfi)
        {
            Box const& bx = mfi.tilebox();
            compute_convective_term(bx, lev, mfi,
                                    conv_u[lev]->array(mfi),
                                    conv_r[lev]->array(mfi),
                                    (m_ntrac>0) ? conv_t[lev]->array(mfi) : Array4<Real>{},
                                    vel[lev]->const_array(mfi),
                                    density[lev]->array(mfi),
                                    (m_ntrac>0) ? tracer[lev]->const_array(mfi) : Array4<Real const>{},
                                    AMREX_D_DECL(u_mac[lev]->const_array(mfi),
                                                 v_mac[lev]->const_array(mfi),
                                                 w_mac[lev]->const_array(mfi)),
                                    (!vel_forces.empty()) ? vel_forces[lev]->const_array(mfi)
                                                          : Array4<Real const>{},
                                    (!tra_forces.empty()) ? tra_forces[lev]->const_array(mfi)
                                                          : Array4<Real const>{});
        }
    }
}

void
incflo::compute_convective_term (Box const& bx, int lev, MFIter const& mfi,
                                 Array4<Real> const& dvdt, // velocity
                                 Array4<Real> const& drdt, // density
                                 Array4<Real> const& dtdt, // tracer
                                 Array4<Real const> const& vel,
                                 Array4<Real const> const& rho,
                                 Array4<Real const> const& tra,
                                 AMREX_D_DECL(Array4<Real const> const& umac,
                                              Array4<Real const> const& vmac,
                                              Array4<Real const> const& wmac),
                                 Array4<Real const> const& fvel,
                                 Array4<Real const> const& ftra)
{
#ifdef AMREX_USE_EB
    AMREX_ALWAYS_ASSERT(!m_use_godunov);

    auto const& fact = EBFactory(lev);
    EBCellFlagFab const& flagfab = fact.getMultiEBCellFlagFab()[mfi];
    Array4<EBCellFlag const> const& flag = flagfab.const_array();
    if (flagfab.getType(bx) == FabType::covered)
    {
        amrex::ParallelFor(bx, [=] AMREX_GPU_DEVICE (int i, int j, int k) noexcept
        {
            AMREX_D_TERM(dvdt(i,j,k,0) = 0.0;,
                         dvdt(i,j,k,1) = 0.0;,
                         dvdt(i,j,k,2) = 0.0;);
            drdt(i,j,k) = 0.0;
        });
        if (m_advect_tracer) {
            amrex::ParallelFor(bx, m_ntrac, [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
            {
                dtdt(i,j,k,n) = 0.0;
            });
        }
        return;
    }

    bool regular = (flagfab.getType(amrex::grow(bx,2)) == FabType::regular);

    Array4<Real const> AMREX_D_DECL(fcx, fcy, fcz), ccc, vfrac, AMREX_D_DECL(apx, apy, apz);
    if (!regular) {
        AMREX_D_TERM(fcx = fact.getFaceCent()[0]->const_array(mfi);,
                     fcy = fact.getFaceCent()[1]->const_array(mfi);,
                     fcz = fact.getFaceCent()[2]->const_array(mfi););
        ccc = fact.getCentroid().const_array(mfi);
        vfrac = fact.getVolFrac().const_array(mfi);
        AMREX_D_TERM(apx = fact.getAreaFrac()[0]->const_array(mfi);,
                     apy = fact.getAreaFrac()[1]->const_array(mfi);,
                     apz = fact.getAreaFrac()[2]->const_array(mfi););
    }
#endif

    Box rhotrac_box = amrex::grow(bx,2);
    if (m_use_godunov) rhotrac_box.grow(1);
#ifdef AMREX_USE_EB
    if (!regular) rhotrac_box.grow(2);
#endif

    FArrayBox rhotracfab;
    Elixir eli_rt;
    Array4<Real> rhotrac;
    if (m_advect_tracer) {
        rhotracfab.resize(rhotrac_box, m_ntrac);
        if (!m_use_godunov) {
            eli_rt = rhotracfab.elixir();
        }
        rhotrac = rhotracfab.array();
        amrex::ParallelFor(rhotrac_box, m_ntrac,
        [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
        {
            rhotrac(i,j,k,n) = rho(i,j,k) * tra(i,j,k,n);
        });
    }

    int nmaxcomp = AMREX_SPACEDIM;
    if (m_advect_tracer) nmaxcomp = std::max(nmaxcomp,m_ntrac);

    if (m_use_godunov)
    {
#if (AMREX_SPACEDIM == 3)
        FArrayBox tmpfab(amrex::grow(bx,1), nmaxcomp*14+1);
#else
        FArrayBox tmpfab(amrex::grow(bx,1), nmaxcomp*10+1);
#endif
//        Elixir eli = tmpfab.elixir();

        godunov::compute_godunov_advection(lev, bx, AMREX_SPACEDIM,
                                           dvdt, vel,
                                           AMREX_D_DECL(umac, vmac, wmac), fvel, 
                                           geom, m_dt, 
                                           get_velocity_bcrec_device_ptr(),
                                           get_velocity_iconserv_device_ptr(),
                                           tmpfab.dataPtr(),m_godunov_ppm, true);
        if (!m_constant_density) {
            godunov::compute_godunov_advection(lev, bx, 1,
                                               drdt, rho,
                                               AMREX_D_DECL(umac, vmac, wmac), {},
                                               geom, m_dt, 
                                               get_density_bcrec_device_ptr(),
                                               get_density_iconserv_device_ptr(),
                                               tmpfab.dataPtr(),m_godunov_ppm);
        }
        if (m_advect_tracer) {
            godunov::compute_godunov_advection(lev, bx, m_ntrac,
                                               dtdt, rhotrac,
                                               AMREX_D_DECL(umac, vmac, wmac), ftra,
                                               geom, m_dt, 
                                               get_tracer_bcrec_device_ptr(),
                                               get_tracer_iconserv_device_ptr(),
                                               tmpfab.dataPtr(),m_godunov_ppm);
        }
        Gpu::streamSynchronize();
    }
    else
    {
        Box tmpbox = amrex::surroundingNodes(bx);
        int tmpcomp = nmaxcomp*AMREX_SPACEDIM;
#ifdef AMREX_USE_EB
        Box gbx = bx;
        if (!regular) {
            gbx.grow(2);
            tmpbox.grow(3);
            tmpcomp += nmaxcomp;
        }
#endif

        FArrayBox tmpfab(tmpbox, tmpcomp);
        Elixir eli = tmpfab.elixir();

        AMREX_D_TERM(Array4<Real> fx = tmpfab.array(0);,
                     Array4<Real> fy = tmpfab.array(nmaxcomp);,
                     Array4<Real> fz = tmpfab.array(nmaxcomp*2););

#ifdef AMREX_USE_EB 
        if (!regular)
        {
            Array4<Real> scratch = tmpfab.array(0);
            Array4<Real> dUdt_tmp = tmpfab.array(nmaxcomp*AMREX_SPACEDIM);

            // velocity
            mol::compute_convective_fluxes_eb(lev, gbx, AMREX_SPACEDIM,
                                              AMREX_D_DECL(fx, fy, fz), vel, 
                                              AMREX_D_DECL(umac, vmac, wmac),
                                              get_velocity_bcrec().data(),
                                              get_velocity_bcrec_device_ptr(),
                                              flag, AMREX_D_DECL(fcx, fcy, fcz), ccc, Geom());
            mol::compute_convective_rate_eb(lev, gbx, AMREX_SPACEDIM, dUdt_tmp, AMREX_D_DECL(fx, fy, fz),
                                            flag, vfrac, AMREX_D_DECL(apx, apy, apz), Geom());
            redistribute_eb(lev, bx, AMREX_SPACEDIM, dvdt, dUdt_tmp, scratch, flag, vfrac);

            // density
            if (!m_constant_density) {
                mol::compute_convective_fluxes_eb(lev, gbx, 1,
                                                  AMREX_D_DECL(fx, fy, fz), rho, 
                                                  AMREX_D_DECL(umac, vmac, wmac),
                                                  get_density_bcrec().data(),
                                                  get_density_bcrec_device_ptr(),
                                                  flag, AMREX_D_DECL(fcx, fcy, fcz), ccc, Geom());
                mol::compute_convective_rate_eb(lev, gbx, 1, dUdt_tmp, AMREX_D_DECL(fx, fy, fz),
                                                flag, vfrac, AMREX_D_DECL(apx, apy, apz), Geom());
                redistribute_eb(lev, bx, 1, drdt, dUdt_tmp, scratch, flag, vfrac);
            }

            if (m_advect_tracer) {
                mol::compute_convective_fluxes_eb(lev, gbx, m_ntrac,
                                                  AMREX_D_DECL(fx, fy, fz), rhotrac, 
                                                  AMREX_D_DECL(umac, vmac, wmac),
                                                  get_tracer_bcrec().data(),
                                                  get_tracer_bcrec_device_ptr(),
                                                  flag, AMREX_D_DECL(fcx, fcy, fcz), ccc, Geom());
                mol::compute_convective_rate_eb(lev, gbx, m_ntrac, dUdt_tmp, AMREX_D_DECL(fx, fy, fz),
                                                flag, vfrac, AMREX_D_DECL(apx, apy, apz), Geom());
                redistribute_eb(lev, bx, m_ntrac, dtdt, dUdt_tmp, scratch, flag, vfrac);
            }
        }
        else
#endif
        {
            // velocity
            mol::compute_convective_fluxes(lev, bx, AMREX_SPACEDIM, AMREX_D_DECL(fx, fy, fz), vel,
                                           AMREX_D_DECL(umac, vmac, wmac),
                                           get_velocity_bcrec().data(),
                                           get_velocity_bcrec_device_ptr(), Geom());
            mol::compute_convective_rate(lev, bx, AMREX_SPACEDIM, dvdt, AMREX_D_DECL(fx, fy, fz), Geom());

            // density
            if (!m_constant_density) {
                mol::compute_convective_fluxes(lev, bx, 1, AMREX_D_DECL(fx, fy, fz), rho,
                                               AMREX_D_DECL(umac, vmac, wmac),
                                               get_density_bcrec().data(),
                                               get_density_bcrec_device_ptr(), Geom());
                mol::compute_convective_rate(lev, bx, 1, drdt, AMREX_D_DECL(fx, fy, fz), Geom());
            }

            // tracer
            if (m_advect_tracer) {
                mol::compute_convective_fluxes(lev, bx, m_ntrac, AMREX_D_DECL(fx, fy, fz), rhotrac,
                                               AMREX_D_DECL(umac, vmac, wmac),
                                               get_tracer_bcrec().data(),
                                               get_tracer_bcrec_device_ptr(), Geom());
                mol::compute_convective_rate(lev, bx, m_ntrac, dtdt, AMREX_D_DECL(fx, fy, fz), Geom());
            }
        }
    }
}

void 
mol::compute_convective_rate (int lev, Box const& bx, int ncomp,
                              Array4<Real> const& dUdt,
                              AMREX_D_DECL(Array4<Real const> const& fx,
                                           Array4<Real const> const& fy,
                                           Array4<Real const> const& fz),
                              Vector<Geometry> geom)
{
    const auto dxinv = geom[lev].InvCellSizeArray();
    amrex::ParallelFor(bx, ncomp,
    [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
    {
#if (AMREX_SPACEDIM == 3)
        dUdt(i,j,k,n) = dxinv[0] * (fx(i,j,k,n) - fx(i+1,j,k,n))
            +           dxinv[1] * (fy(i,j,k,n) - fy(i,j+1,k,n))
            +           dxinv[2] * (fz(i,j,k,n) - fz(i,j,k+1,n));
#else
        dUdt(i,j,k,n) = dxinv[0] * (fx(i,j,k,n) - fx(i+1,j,k,n))
            +           dxinv[1] * (fy(i,j,k,n) - fy(i,j+1,k,n));
#endif
    });
}

#ifdef AMREX_USE_EB
void 
mol::compute_convective_rate_eb (int lev, Box const& bx, int ncomp,
                                 Array4<Real> const& dUdt,
                                 AMREX_D_DECL(Array4<Real const> const& fx,
                                              Array4<Real const> const& fy,
                                              Array4<Real const> const& fz),
                                 Array4<EBCellFlag const> const& flag,
                                 Array4<Real const> const& vfrac,
                                 AMREX_D_DECL(Array4<Real const> const& apx,
                                              Array4<Real const> const& apy,
                                              Array4<Real const> const& apz),
                                 Vector<Geometry> geom)
{
    const auto dxinv = geom[lev].InvCellSizeArray();
    const Box dbox   = geom[lev].growPeriodicDomain(2);
    amrex::ParallelFor(bx, ncomp,
    [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
    {
#if (AMREX_SPACEDIM == 3)
        if (!dbox.contains(IntVect(AMREX_D_DECL(i,j,k))) or flag(i,j,k).isCovered()) {
            dUdt(i,j,k,n) = 0.0;
        } else if (flag(i,j,k).isRegular()) {
            dUdt(i,j,k,n) = dxinv[0] * (fx(i,j,k,n) - fx(i+1,j,k,n))
                +           dxinv[1] * (fy(i,j,k,n) - fy(i,j+1,k,n))
                +           dxinv[2] * (fz(i,j,k,n) - fz(i,j,k+1,n));
        } else {
            dUdt(i,j,k,n) = (1.0/vfrac(i,j,k)) *
                ( dxinv[0] * (apx(i,j,k)*fx(i,j,k,n) - apx(i+1,j,k)*fx(i+1,j,k,n))
                + dxinv[1] * (apy(i,j,k)*fy(i,j,k,n) - apy(i,j+1,k)*fy(i,j+1,k,n))
                + dxinv[2] * (apz(i,j,k)*fz(i,j,k,n) - apz(i,j,k+1)*fz(i,j,k+1,n)) );
        }
#else
        if (!dbox.contains(IntVect(AMREX_D_DECL(i,j,k))) or flag(i,j,k).isCovered()) {
            dUdt(i,j,k,n) = 0.0;
        } else if (flag(i,j,k).isRegular()) {
            dUdt(i,j,k,n) = dxinv[0] * (fx(i,j,k,n) - fx(i+1,j,k,n))
                +           dxinv[1] * (fy(i,j,k,n) - fy(i,j+1,k,n));
        } else {
            dUdt(i,j,k,n) = (1.0/vfrac(i,j,k)) *
                ( dxinv[0] * (apx(i,j,k)*fx(i,j,k,n) - apx(i+1,j,k)*fx(i+1,j,k,n))
                + dxinv[1] * (apy(i,j,k)*fy(i,j,k,n) - apy(i,j+1,k)*fy(i,j+1,k,n)) );
        }
#endif
    });
}

void incflo::redistribute_eb (int lev, Box const& bx, int ncomp,
                              Array4<Real> const& dUdt,
                              Array4<Real const> const& dUdt_in,
                              Array4<Real> const& scratch,
                              Array4<EBCellFlag const> const& flag,
                              Array4<Real const> const& vfrac)
{
    const Box dbox = Geom(lev).growPeriodicDomain(2);

    Array4<Real> tmp(scratch, 0);
    Array4<Real> delm(scratch, ncomp);
    Array4<Real> wgt(scratch, 2*ncomp);

    Box const& bxg1 = amrex::grow(bx,1);
    Box const& bxg2 = amrex::grow(bx,2);

    // xxxxx TODO: more weight options
    amrex::ParallelFor(bxg2,
    [=] AMREX_GPU_DEVICE (int i, int j, int k) noexcept
    {
        wgt(i,j,k) = (dbox.contains(IntVect(AMREX_D_DECL(i,j,k)))) ? 1.0 : 0.0;
    });

    amrex::ParallelFor(bxg1, ncomp,
    [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
    {
        if (flag(i,j,k).isSingleValued()) {
            Real vtot = 0.0;
            Real divnc = 0.0;
            for (int kk = -1; kk <= 1; ++kk) {
            for (int jj = -1; jj <= 1; ++jj) {
            for (int ii = -1; ii <= 1; ++ii) {
                if ((ii != 0 or jj != 0 or kk != 0) and
                    flag(i,j,k).isConnected(ii,jj,kk) and
                    dbox.contains(IntVect(AMREX_D_DECL(i+ii,j+jj,k+kk))))
                {
                    Real vf = vfrac(i+ii,j+jj,k+kk);
                    vtot += vf;
                    divnc += vf * dUdt_in(i+ii,j+jj,k+kk,n);
                }
            }}}
            divnc /= (vtot + 1.e-80);
            Real optmp = (1.0-vfrac(i,j,k))*(divnc-dUdt_in(i,j,k,n));
            tmp(i,j,k,n) = optmp;
            delm(i,j,k,n) = -vfrac(i,j,k)*optmp;
        } else {
            tmp(i,j,k,n) = 0.0;
        }
    });

    amrex::ParallelFor(bxg1 & dbox, ncomp,
    [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
    {
        if (flag(i,j,k).isSingleValued()) {
            Real wtot = 0.0;
            for (int kk = -1; kk <= 1; ++kk) {
            for (int jj = -1; jj <= 1; ++jj) {
            for (int ii = -1; ii <= 1; ++ii) {
                if ((ii != 0 or jj != 0 or kk != 0) and
                    flag(i,j,k).isConnected(ii,jj,kk))
                {
                    wtot += vfrac(i+ii,j+jj,k+kk) * wgt(i+ii,j+jj,k+kk);
                }
            }}}
            wtot = 1.0/(wtot+1.e-80);

            Real dtmp = delm(i,j,k,n) * wtot;
            for (int kk = -1; kk <= 1; ++kk) {
            for (int jj = -1; jj <= 1; ++jj) {
            for (int ii = -1; ii <= 1; ++ii) {
                if ((ii != 0 or jj != 0 or kk != 0) and
                    bx.contains(IntVect(AMREX_D_DECL(i+ii,j+jj,k+kk))) and
                    flag(i,j,k).isConnected(ii,jj,kk))
                {
                    Gpu::Atomic::Add(&tmp(i+ii,j+jj,k+kk,n), dtmp*wgt(i+ii,j+jj,k+kk));
                }
            }}}
        }
    });

    amrex::ParallelFor(bx, ncomp,
    [=] AMREX_GPU_DEVICE (int i, int j, int k, int n) noexcept
    {
        dUdt(i,j,k,n) = dUdt_in(i,j,k,n) + tmp(i,j,k,n);
    });
}
#endif
