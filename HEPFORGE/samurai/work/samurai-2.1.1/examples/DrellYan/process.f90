program process
   use precision, only: ki
   use kinematic
   use vars
   use amp3
   implicit none

   integer, parameter :: nevt = 5
   integer :: h, i, j, mu, nu, ccount, ievt
   real(ki) :: omega, scale2

   real(ki), dimension(4,4) :: vecs
   real :: t0, t1, ttot

   complex(ki), dimension(3) :: amp

   integer :: isca, itest, verbosity
   character(len=4) :: imeth

   omega = 14.0_ki
    mass =  0.0_ki

! arguments of initsamurai: (imeth,isca,verbosity,itest)
 imeth     = 'diag' ! 1 (traditional); 2 (tree level structures)
 isca      = 2 ! 1 (QCDloop); 2 (OneLOop)
 verbosity = 2 ! 0 (nothing); 1 (coeffs); 2 (coeffs+s.i.); 3(coeffs+s.i.+tests)
 itest     = 0 ! 0 (none); 1 (powertest); 2 (nntest); 3 (lnntest)

   call initsamurai(imeth,isca,verbosity,itest)

   call random_seed

   ccount = 0

   open(unit=19,file='process.log',action='write',status='unknown')

   do ievt = 1, nevt

   call init_kinematics(omega, vecs)
   scale2 = 2.0_ki * dotproduct(vecs(1,:), vecs(2,:))

   write(19,'(A3,4(1x,F17.10))') "k1:", vecs(1,:)
   write(19,'(A3,4(1x,F17.10))') "k2:", vecs(2,:)
   write(19,'(A3,4(1x,F17.10))') "k3:", vecs(3,:)
   write(19,'(A3,4(1x,F17.10))') "k4:", vecs(4,:)

   amp = amplitude(vecs, scale2)

   write(19,'(A6,3(1x,A23))'), "", "real", "imag", "abs" 
   write(19,'(A6,3(1x,G23.14))'), "FINITE:", amp(3), abs(amp(3))
   write(19,'(A6,3(1x,G23.14))'), "SINGLE:", amp(2), abs(amp(2))
   write(19,'(A6,3(1x,G23.14))'), "DOUBLE:", amp(1), abs(amp(1))
   write(19,*)
   write(19,*)

   end do

   close(unit=19)


contains

 subroutine init_kinematics(omega, vecs)
   use rambo
   implicit none
   real(ki), intent(in) :: omega
   real(ki), dimension(4,4), intent(out) :: vecs
   real(ki) :: weight

     weight =  ramb(omega**2,&
   & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

    vecs(:,:)=vecs(:,(/2,3,4,1/))
    vecs(1,:)=-vecs(1,:)
    vecs(2,:)=-vecs(2,:)

end  subroutine init_kinematics

end program
