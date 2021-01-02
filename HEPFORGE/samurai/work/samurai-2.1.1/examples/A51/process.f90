program process
   use precision, only: ki
   use kinematic
   use vars
   use amp4
   use mabdk
   implicit none

   integer, parameter :: num_helis = 2
   integer, parameter :: eval_helis = 2
   integer, parameter :: NEVT = 10
   integer, dimension(num_helis) :: helis
   integer :: h, i, j, mu, nu, ccount, ievt
   integer :: isca, verbosity, itest
   character(len=4) :: imeth

   real(ki) :: omega, scale2
   real(ki), dimension(5,4) :: vecs
   real(ki), dimension(4) :: ref5
   complex(ki), dimension(4) :: polariz
   complex(ki), dimension(-2:0) :: amp, ampBDK
   real :: t0, t1, ttot
   logical fixed, printout

   fixed = .FALSE.
   printout = .FALSE.
   mass =  0.0_ki
   omega = 14.0_ki


   helis(1) = +1
   helis(2) = -1


! arguments of initsamurai: (imeth,isca,verbosity,itest)
   imeth     = 'diag' ! diag (diagrams); tree (tree level structures)
   isca      = 2 ! 1 (QCDloop); 2 (OneLOop)
   verbosity = 3 ! 0 (nothing); 1 (coeffs); 2 (coeffs+s.i.); 3(coeffs+s.i.+tests)
   itest     = 2 ! 0 (none); 1 (powertest); 2 (nntest); 3 (lnntest)

   call initsamurai(imeth,isca,verbosity,itest)

   ! Don't forget to set lambda^2 if you use LoopTools
   ! call setlambda(0.0d0)

   call random_seed

   ccount = 0

   open(unit=19,file='process.log',action='write',status='unknown')
   ttot = 0.0
   do ievt = 1, NEVT


      call init_kinematics(omega, vecs, fixed)

      scale2 = 1.0_ki

      ref5(:) = vecs(2,:)

      write(19,'(A3,4(1x,F17.10))') "k1:", vecs(1,:)
      write(19,'(A3,4(1x,F17.10))') "k2:", vecs(2,:)
      write(19,'(A3,4(1x,F17.10))') "k3:", vecs(3,:)
      write(19,'(A3,4(1x,F17.10))') "k4:", vecs(4,:)
      write(19,'(A3,4(1x,F17.10))') "k5:", vecs(5,:)


      do h = 1, eval_helis

         write(19,*)
         write(19,'(A26,1(1x,I2))') "--------- HELICITY:", helis(h)

         polariz(:) = epsi(helis(h), vecs(5,:), ref5(:))

         if (printout) then
               write(19,"(A8,4(/9x,F23.15,1x,F23.15))") "eps(k5):", polariz(:)
               write(19,'(A1,I1,A2,I1,A6,A3,2(1x,F23.15))') &
               & "e5.e5~ + 1", " = ", &
               & dotproduct(polariz(:), conjg(polariz(:))) + 1.0_ki
               write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
               & "e5.e5 = ", &
               & dotproduct(polariz(:), polariz(:))
               write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
               & "e5.k5 = ", &
               & dotproduct(polariz(:), vecs(5,:))
               write(19,'(A1,I1,A2,I1,A9,2(1x,F23.15))') &
               & "e5.k2 = ", &
               & dotproduct(polariz(:), vecs(2,:))
         endif


   amp = amplitude(vecs, polariz, scale2)
   
         write(19,'(A6,3(1x,A23))'), "", "real", "imag", "abs" 
         write(19,'(A6,3(1x,G23.14))'), "FINITE:", amp(0), abs(amp(0))
         write(19,'(A6,3(1x,G23.14))'), "SINGLE:", amp(-1), abs(amp(-1))
         write(19,'(A6,3(1x,G23.14))'), "DOUBLE:", amp(-2), abs(amp(-2))

   ampBDK = ABDK(helis(h), vecs, scale2)

         write(19,'(A6,3(1x,A23))'), "", "real", "imag", "abs" 
         write(19,'(A6,3(1x,G23.14))'), "BDKFIN:", ampBDK(0), abs(ampBDK(0))
         write(19,'(A6,3(1x,G23.14))'), "BDKSIN:", ampBDK(-1), abs(ampBDK(-1))
         write(19,'(A6,3(1x,G23.14))'), "BDKDOU:", ampBDK(-2), abs(ampBDK(-2))

   enddo
  enddo

   close(unit=19)

!   print*, "amplitude calls:", ccount
!   print*, "total time [s]:", ttot
!   print*, "average time [ms]:", 1.0E+03 * ttot / real(ccount)

   call exitsamurai


contains

 subroutine init_kinematics(omega, vecs, fixed)
   use rambo
   implicit none
   real(ki), intent(in) :: omega
   real(ki), dimension(5,4), intent(out) :: vecs
   logical, intent(in) :: fixed
   real(ki) :: weight

   if (fixed) then

       vecs(1,1)=   0.0000000000000000_ki
       vecs(1,2)=   0.0000000000000000_ki
       vecs(1,3)= -0.50000000000000000_ki
       vecs(1,4)= -0.50000000000000000_ki
       vecs(2,1)=   0.0000000000000000_ki
       vecs(2,2)=   0.0000000000000000_ki
       vecs(2,3)=  0.50000000000000000_ki
       vecs(2,4)= -0.50000000000000000_ki
       vecs(3,1)=  0.12094552053254569_ki
       vecs(3,2)= -5.27835316947797839E-2_ki
       vecs(3,3)=  0.10044217449344708_ki
       vecs(3,4)=  0.16583892960349908_ki
       vecs(4,1)= -0.35902305439565219_ki
       vecs(4,2)= -0.25338329176660834_ki
       vecs(4,3)= -7.18752863982512896E-2_ki
       vecs(4,4)=  0.44527149350581230_ki
       vecs(5,1)=  0.23807753386310632_ki
       vecs(5,2)=  0.30616682346138813_ki
       vecs(5,3)= -2.85668880951958741E-2_ki
       vecs(5,4)=  0.38888957689068865_ki

    else

     weight =  ramb(omega**2,&
   & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

    vecs(:,:)=vecs(:,(/2,3,4,1/))
    vecs(1,:)=-vecs(1,:)
    vecs(2,:)=-vecs(2,:)

    endif

  end  subroutine init_kinematics

end program
