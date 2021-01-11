program process
   use precision, only: ki
   use kinematic
   use vars
   use amp8
   use mfunctions, only: sdot
   use constants, only: two, pi
   implicit none

   integer, parameter :: num_helis = 2
   integer, parameter :: eval_helis = 1
   integer, dimension(num_helis,8) :: helis
   integer, parameter :: NEVT = 1
   integer :: n0, n1, n2, n3, n4, n5, n6, n7, n8
   integer :: h, i, j, mu, nu, ccount, ievt

   real(ki) :: omega, scale2
   real(ki), dimension(8,4) :: vecs, refs, nvecs
   real(ki), dimension(4) :: vec0
   real :: t0, t1, ttot

   complex(ki), dimension(8,4) :: pols, npols
   complex(ki), dimension(-2:0) :: amp, tot
   complex(ki) :: tmp, norm, temp, rat, totr

   logical printout, NStest

   integer :: itest, isca, verbosity
   character(len=4) :: imeth

   omega=1.1_ki
   printout=.TRUE.
   NStest=.FALSE.

   helis(1,:) = (/ -1, -1, +1, +1, +1, +1, +1, +1 /)
   helis(2,:) = (/ +1, -1, +1, -1, +1, -1, +1, +1 /)

! arguments of initsamurai: (imeth,isca,verbosity,itest)
 imeth     = 'diag' ! 1 (traditional); 2 (tree level structures)
 isca      = 2 ! 1 (QCDloop); 2 (OneLOop)
 verbosity = 0 ! 0 (nothing); 1 (coeffs); 2 (coeffs+s.i.); 3(coeffs+s.i.+tests)
 itest     = 0 ! 0 (none); 1 (powertest); 2 (nntest); 3 (lnntest)

   call initsamurai(imeth,isca,verbosity,itest)

   call random_seed

   open(unit=19,file='process.log',action='write',status='unknown')
   ttot = 0.0

   do ievt = 1, NEVT

      mass = 0.0_ki

      call init_kinematics(NStest, omega, vecs)
      scale2 = 2.0_ki * dotproduct(vecs(1,:), vecs(2,:))

      vec0 = (/ 1.0_ki/sqrt(3.0_ki),1.0_ki/sqrt(3.0_ki),&
     & 1.0_ki/sqrt(3.0_ki), 1.0_ki /)

      refs(1,:) = vecs(7,:)
      refs(2,:) = vecs(8,:)
      refs(3,:) = vecs(1,:)
      refs(4,:) = vecs(2,:)
      refs(5,:) = vecs(3,:)
      refs(6,:) = vecs(4,:)
      refs(7,:) = vecs(5,:)
      refs(8,:) = vecs(6,:)

!      refs(1,:) = vec0
!      refs(2,:) = vec0
!      refs(3,:) = vec0
!      refs(4,:) = vec0
!      refs(5,:) = vec0
!      refs(6,:) = vec0

      write(19,'(A3,4(1x,F17.10))') "k1:", vecs(1,:)
      write(19,'(A3,4(1x,F17.10))') "k2:", vecs(2,:)
      write(19,'(A3,4(1x,F17.10))') "k3:", vecs(3,:)
      write(19,'(A3,4(1x,F17.10))') "k4:", vecs(4,:)
      write(19,'(A3,4(1x,F17.10))') "k5:", vecs(5,:)
      write(19,'(A3,4(1x,F17.10))') "k6:", vecs(6,:)
      write(19,'(A3,4(1x,F17.10))') "k7:", vecs(7,:)
      write(19,'(A3,4(1x,F17.10))') "k8:", vecs(8,:)

      do h = 1, eval_helis

         write(19,'(A26,8(1x,I2))') "--------- HELICITY:", helis(h,:)

         do i=1,8
            pols(i,:) = epsi(helis(h,i), vecs(i,:), refs(i,:))
         end do

         if (printout) then
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k1):", pols(1,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k2):", pols(2,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k3):", pols(3,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k4):", pols(4,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k5):", pols(5,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k6):", pols(6,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k7):", pols(7,:)
            write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k8):", pols(8,:)
   
            do i = 1, 8
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


   amp(:)=0.0_ki
   tot(:)=0.0_ki
   rat=0.0_ki
   open(unit=8,file='dl8.f90',status='OLD')
   n0=1
   do n0 = 1,5040
   read(8,*) n1,n2,n3,n4,n5,n6,n7,n8
   if (n2.gt.n8) cycle
   nvecs(1,:)= vecs(n1,:)
   nvecs(2,:)= vecs(n2,:)
   nvecs(3,:)= vecs(n3,:)
   nvecs(4,:)= vecs(n4,:)
   nvecs(5,:)= vecs(n5,:)
   nvecs(6,:)= vecs(n6,:)
   nvecs(7,:)= vecs(n7,:)
   nvecs(8,:)= vecs(n8,:)
   npols(1,:)=pols(n1,:)
   npols(2,:)=pols(n2,:)
   npols(3,:)=pols(n3,:)
   npols(4,:)=pols(n4,:)
   npols(5,:)=pols(n5,:)
   npols(6,:)=pols(n6,:)
   npols(7,:)=pols(n7,:)
   npols(8,:)=pols(n8,:)
   call amplitude(nvecs, npols, scale2, tot, totr)
   amp(:)=amp(:)+tot(:)
   rat=rat+totr
   end do
   close(8)

   amp(:) = amp(:)*64.0_ki*pi**2*dotproduct(vecs(1,:), vecs(2,:))**2

   write(19,'(A6,3(1x,A23))') "", "real", "imag", "abs" 
   write(19,'(A6,3(1x,G23.14))') "DOUBLE:", amp(-2), abs(amp(-2))
   write(19,'(A6,3(1x,G23.14))') "SINGLE:", amp(-1), abs(amp(-1))
   write(19,'(A6,3(1x,G23.14))') "FINITE:", amp(0), abs(amp(0))
   write(19,'(A8,2(1x,G23.14))') "RATIONAL:", rat

     end do
   end do

   close(unit=19)

   call exitsamurai

!   print*, "amplitude calls:", ccount
!   print*, "total time [s]:", ttot
!   print*, "average time [ms]:", 1.0E+03 * ttot / real(ccount)


contains

   subroutine init_kinematics(NStest, omega, vecs)
   use rambo
   implicit none
   real(ki), intent(in) :: omega
   real(ki), dimension(8,4), intent(out) :: vecs
   real(ki) :: weight, etot, e3, e4, e5, e6, e7, e8
   logical :: NStest

   if (NStest) then

  vecs(3,:)= (/  33.500000000000000_ki,   5.90000000000000_ki,&
 &               25.000000000000000_ki,   0.0_ki /)
  vecs(4,:)= (/   1.500000000000000_ki,  24.30000000000000_ki,&
 &                0.300000000000000_ki,   0.0_ki /)
  vecs(5,:)= (/ -19.100000000000000_ki, -35.10000000000000_ki,&
 &               -3.300000000000000_ki,   0.0_ki /)
  vecs(6,:)= (/  28.200000000000000_ki,  -6.60000000000000_ki,&
 &                8.200000000000000_ki,   0.0_ki /)
  vecs(7,:)= (/ -12.200000000000000_ki,  -8.60000000000000_ki,&
 &                8.200000000000000_ki,   0.0_ki /)
  vecs(8,:)= (/ -31.900000000000000_ki,  20.10000000000000_ki,&
 &              -38.400000000000000_ki,   0.0_ki /)

  e3 = sqrt(-sdot(vecs(3,:),vecs(3,:)))
  e4 = sqrt(-sdot(vecs(4,:),vecs(4,:)))
  e5 = sqrt(-sdot(vecs(5,:),vecs(5,:)))
  e6 = sqrt(-sdot(vecs(6,:),vecs(6,:)))
  e7 = sqrt(-sdot(vecs(7,:),vecs(7,:)))
  e8 = sqrt(-sdot(vecs(8,:),vecs(8,:)))

  etot = e3 + e4 + e5 + e6 + e7 + e8
  etot = etot/two

  vecs(1,:)= (/  0.0_ki,    0.0_ki, -etot, -etot /)
  vecs(2,:)= (/  0.0_ki,    0.0_ki,  etot, -etot /)

  vecs(3,:)= (/  33.500000000000000_ki,   5.90000000000000_ki,&
 &               25.000000000000000_ki,   e3 /)
  vecs(4,:)= (/   1.500000000000000_ki,  24.30000000000000_ki,&
 &                0.300000000000000_ki,   e4 /)
  vecs(5,:)= (/ -19.100000000000000_ki, -35.10000000000000_ki,&
 &               -3.300000000000000_ki,   e5 /)
  vecs(6,:)= (/  28.200000000000000_ki,  -6.60000000000000_ki,&
 &                8.200000000000000_ki,   e6 /)
  vecs(7,:)= (/ -12.200000000000000_ki,  -8.60000000000000_ki,&
 &                8.200000000000000_ki,   e7 /)
  vecs(8,:)= (/ -31.900000000000000_ki,  20.10000000000000_ki,&
 &              -38.400000000000000_ki,   e8 /)

   else

     weight =  ramb(omega**2,&
   & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

    vecs(:,:)=vecs(:,(/2,3,4,1/))
    vecs(1,:)=-vecs(1,:)
    vecs(2,:)=-vecs(2,:)

   endif


end  subroutine init_kinematics

end program


