***********************************************************************
*** NuCross calculates the integrated neutrino cross section for the
*** specified neutrino, target, energy and interaction type
***
*** Input:  E      Neutrino energy (GeV)
***         nu     Neutrino type
***                1 = nu_e
***                2 = nu_e-bar
***                3 = nu_mu
***                4 = nu_mu-bar
***                5 = nu_tau
***                6 = nu_tau-bar
***         targ   Target ('p' for proton, 'n' for neutron, 
***                'N' for isoscalar)
***         int    Interaction type ('CC'=charged current, 
***                'NC'=neutral current)
***         how    1: integrate dsdxdy
***                2: integrate dsdlxdly, i.e. in log-log-space instead
*** Output: NuCross   Cross section in cm^2
*** Author: Joakim Edsjo, edsjo@physto.se
***********************************************************************

      real*8 function NuCross(E,nu,targ,int,how)
      implicit none

      include 'nupar.h'

      real*8 E
      integer nu,how
      character*1 targ
      character*2 int

      real*8 dsdy,dsdly
      external dsdy,dsdly

      real*8 alist,blist,rlist,elist,epsrel,result,epsabs,abserr
      integer ier,iord,last,limit,neval
      dimension alist(5000),blist(5000),elist(5000),iord(5000),
     &  rlist(5000)

c...Transfer to common blocks
      Enu=E
      nutype=nu
      target=targ
      interaction=int

      epsabs=1.d-50
      epsrel=1.d-5
      limit=5000

      if (how.eq.1) then
        call dqagse(dsdy,0.d0,1.d0,epsabs,epsrel,limit,result,
     &    abserr,neval,
     &    ier,alist,blist,rlist,elist,iord,last)
      else
        call dqagse(dsdly,log(1d-6),log(1.d0),
     &    epsabs,epsrel,limit,result,
     &    abserr,neval,
     &    ier,alist,blist,rlist,elist,iord,last)
      endif        

      NuCross=result

      return
      end
