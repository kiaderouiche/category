program process
   use precision, only: ki
   use kinematic
   use vars
   use amp4
   use rambo
   implicit none

   integer, parameter :: num_helis = 3
   integer, parameter :: eval_helis = 3
   integer, parameter :: NEVT = 1
   integer, dimension(num_helis,4) :: helis
   integer :: n0, n1, n2, n3, n4
   real(ki) :: scale2
   real(ki), dimension(4,4) :: vecs, refs, nvecs
   real(ki), dimension(4) :: myref
   complex(ki), dimension(4,4) :: pols, npols
   complex(ki), dimension(-2:0) :: amp, tempamp
   complex(ki), dimension(0:2) :: D0st,D0tu,D0us,C0u,C0s,C0t,B0u,B0s,B0t
   real :: t0, t1, ttot
   complex(ki) :: temp, ex4, tmp, norm
   real(ki) :: ss, tt, uu, m2, sqrts
   real(ki) :: weight
   integer :: h, i, j, mu, nu, ccount, ievt
   logical printout
   integer :: isca, itest, verbosity
   character(len=4) :: imeth

   printout=.FALSE.

   helis(1,:) = (/ +1, +1, +1, +1 /)
   helis(2,:) = (/ +1, +1, -1, +1 /)
   helis(3,:) = (/ +1, +1, -1, -1 /)

! arguments of initsamurai: (imeth,isca,verbosity,itest)
 imeth     = 'diag' ! 1 (traditional); 2 (tree level structures)
 isca      = 2 ! 1 (QCDloop); 2 (OneLOop)
 verbosity = 1 ! 0 (nothing); 1 (coeffs); 2 (coeffs+s.i.); 3(coeffs+s.i.+tests)
 itest     = 0 ! 0 (none); 1 (powertest); 2 (nntest); 3 (lnntest)

   call initsamurai(imeth,isca,verbosity,itest)

   call random_seed

   ccount = 0

   open(unit=19,file='process.log',action='write',status='unknown')
   ttot = 0.0

!--- value of sqrts
   sqrts= 14.0_ki
!--- value of the internal mass.lt.sqrts
   mass = 0.0_ki

   do ievt = 1, nevt

     weight =  ramb(sqrts**2,&
   & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

    vecs(:,:)=vecs(:,(/2,3,4,1/))
    vecs(1,:)=-vecs(1,:)
    vecs(2,:)=-vecs(2,:)

    scale2 = sqrts !2.0_ki*dotproduct(vecs(1,:),vecs(2,:))

    refs(1,:) = vecs(4,:)
    refs(2,:) = vecs(3,:)
    refs(3,:) = vecs(2,:)
    refs(4,:) = vecs(1,:)

    myref= (/ -1.0_ki/Sqrt(3.0_ki),&
   &          +1.0_ki/Sqrt(3.0_ki),&
   &          -1.0_ki/Sqrt(3.0_ki),&
   &          +1.0_ki/)


    refs(1,:) = myref(:)
    refs(2,:) = myref(:)
    refs(3,:) = myref(:)
    refs(4,:) = myref(:)

    write(19,*)
    write(19,*)
    write(19,*)
    write(19,*) "Event: ",ievt
    write(19,*)
    write(19,'(A3,4(1x,F23.16))') "k1:", vecs(1,:)
    write(19,'(A3,4(1x,F23.16))') "k2:", vecs(2,:)
    write(19,'(A3,4(1x,F23.16))') "k3:", vecs(3,:)
    write(19,'(A3,4(1x,F23.16))') "k4:", vecs(4,:)

   do h = 1, eval_helis

    write(19,'(A26,4(1x,I2))') "--------- HELICITY:", helis(h,:)

    do i=1,4
       pols(i,:) = epsi(helis(h,i), vecs(i,:), refs(i,:))
    end do

    if (printout) then
      write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k1):", pols(1,:)
      write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k2):", pols(2,:)
      write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k3):", pols(3,:)
      write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k4):", pols(4,:)

      do i = 1, 4
         write(19,'(A1,I1,A2,I1,A6,A3,2(1x,F23.15))') &
         & "e", i, ".e", i, "~ + 1", " = ", &
         & dotproduct(pols(i,:), conjg(pols(i,:))) + 1.0_ki
         write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
         & "e", i, ".e", i, " = ", &
         & dotproduct(pols(i,:), pols(i,:))
         write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
         & "e", i, ".k", i, " = ", &
         & dotproduct(pols(i,:), vecs(i,:))
         write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
         & "e", i, ".r", i, " = ", &
         & dotproduct(pols(i,:), refs(i,:))
         write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
         & "k", i, ".k", i, " = ", &
         & dotproduct(vecs(i,:), vecs(i,:))

      enddo
    endif

   open(unit=7,file='dl4.f90',status='OLD')
   amp(:)=0.0_ki
   tempamp(:)=0.0_ki
   do n0 = 1,3
   read(7,*) n1,n2,n3,n4
   nvecs(1,:)= vecs(n1,:)
   nvecs(2,:)= vecs(n2,:)
   nvecs(3,:)= vecs(n3,:)
   nvecs(4,:)= vecs(n4,:)
   npols(1,:)=pols(n1,:)
   npols(2,:)=pols(n2,:)
   npols(3,:)=pols(n3,:)
   npols(4,:)=pols(n4,:)
   tempamp = amplitude(nvecs, npols, scale2)
   amp(:)=amp(:)+tempamp(:)
   end do
   close(7)

   write(19,'(A6,3(1x,A23))'), "", "real", "imag", "abs" 
   write(19,'(A6,3(1x,G23.14))'), "DOUBLE:", amp(-2), abs(amp(-2))
   write(19,'(A6,3(1x,G23.14))'), "SINGLE:", amp(-1), abs(amp(-1))
   write(19,'(A6,3(1x,G23.14))'), "FINITE:", amp(0), abs(amp(0))


    ss=2.0_ki*dotproduct(vecs(1,:),vecs(2,:))
    tt=2.0_ki*dotproduct(vecs(1,:),vecs(3,:))
    uu=2.0_ki*dotproduct(vecs(2,:),vecs(3,:))
    call avh_olo_onshell(1.d-10)
    call avh_olo_mu_set(sqrt(scale2))
    m2=mass**2
    call avh_olo_d0m(D0st,0.0d0,0.0d0,0.0d0,0.0d0,ss,tt,m2,m2,m2,m2)
    call avh_olo_d0m(D0tu,0.0d0,0.0d0,0.0d0,0.0d0,tt,uu,m2,m2,m2,m2)
    call avh_olo_d0m(D0us,0.0d0,0.0d0,0.0d0,0.0d0,uu,ss,m2,m2,m2,m2)
    call avh_olo_c0m(c0u,0.0d0,0.0d0,uu,m2,m2,m2)
    call avh_olo_c0m(c0s,0.0d0,0.0d0,ss,m2,m2,m2)
    call avh_olo_c0m(c0t,0.0d0,0.0d0,tt,m2,m2,m2)
    call avh_olo_b0m(b0u,uu,m2,m2)
    call avh_olo_b0m(b0s,ss,m2,m2)
    call avh_olo_b0m(b0t,tt,m2,m2)

    if (h.eq.1) then

     ex4 = -4.0_ki+8.0_ki*m2**2*( D0st(0)+D0tu(0)+D0us(0))

    elseif (h.eq.2) then

     ex4 = +4.0_ki-8.0_ki*m2**2*( D0st(0)+D0tu(0)+D0us(0))&
    &      -4.0_ki*m2*ss*tt*uu*( D0st(0)/uu**2+D0tu(0)/ss**2+D0us(0)/tt**2)&
    &      +8.0_ki*m2*(1.0_ki/ss+1.0_ki/tt+1.0_ki/uu)&
    &                *(tt*C0t(0)+uu*C0u(0)+ss*C0s(0))

    elseif (h.eq.3) then

     ex4 = -4.0_ki +4.0_ki*(ss+2.0_ki*uu)/ss*b0u(0)&
    &      +4.0_ki*(ss+2.0_ki*tt)/ss*b0t(0)&
    &      -4.0_ki*(tt**2+uu**2-4.0_ki*m2*ss)/ss/ss*(tt*c0t(0)+uu*c0u(0))&
    &      +4.0_ki*m2*(ss-2.0_ki*m2)*(d0st(0)+d0us(0))&
    &      -2.0_ki*(4.0_ki*m2**2-(2.0_ki*ss*m2+tt*uu)*(tt*tt+uu*uu)/ss/ss&
    &               +4.0_ki*m2*tt*uu/ss)*d0tu(0)

    endif

    write(19,'(A6,3(1x,G23.14))'), "GOUFIN",ex4,abs(ex4)
    write(19,*), "RATIO",abs(amp(0))/abs(ex4)
    write(19,*)

!--- closing helicity cycle
   end do

!--- closing events cycle
   end do

   close(unit=19)

!   print*, "amplitude calls:", ccount
!   print*, "total time [s]:", ttot
!   print*, "average time [ms]:", 1.0E+03 * ttot / real(ccount)

   stop
end program
