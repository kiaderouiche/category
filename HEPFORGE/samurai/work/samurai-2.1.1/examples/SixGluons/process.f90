program process
   use precision, only: ki
   use kinematic
   use vars
   use amp6
   implicit none

   integer, parameter :: num_helis = 1
   integer, parameter :: eval_helis = 1
   integer, parameter :: nevt = 3
   integer :: h, i, j, mu, ccount, ievt 
   integer, dimension(num_helis,6) :: helis
    
   real(ki) :: omega, scale2
   real(ki),    dimension(6,4) :: vecs, refs
   real(ki), dimension(4) :: myRef0
   real :: t0, t1, ttot

   complex(ki), dimension(6,4) :: pols, cnjpols
   complex(ki) :: R6_pppppp
   complex(ki), dimension(-2:0) :: amp
   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)

   logical printout, fixed
   integer :: isca, itest, verbosity
   character(len=4) :: imeth

   printout=.TRUE.
   fixed=.TRUE.

   helis(1,:) = (/ +1, +1, +1, +1, +1, +1 /)


!--- arguments of initsamurai: (imeth,isca,verbosity,itest)
 imeth     = 'tree' ! 1 (traditional); 2 (tree level structures)
 isca      = 2 ! 1 (QCDloop); 2 (OneLOop)
 verbosity = 2 ! 0 (nothing); 1 (coeffs); 2 (coeffs+s.i.); 3(coeffs+s.i.+tests)
 itest     = 0 ! 0 (none); 1 (powertest); 2 (nntest); 3 (lnntest)

   call initsamurai(imeth,isca,verbosity,itest)

   call random_seed

   ccount = 0

   open(unit=19,file='process.log',action='write',status='unknown')

   ttot = 0.0

   do ievt = 1, NEVT

      mass = 0.0_ki
      omega=14.0_ki
      amp(:) = 0.0_ki
      vecs(:,:) = 0.0_ki
      refs(:,:) = 0.0_ki

      call init_kinematics(omega, vecs, fixed)

      scale2 = 2.0_ki * dotproduct(vecs(1,:), vecs(2,:))

      myRef0(:) = (/ -1.0_ki/sqrt(3.0_ki),&
      &          +1.0_ki/sqrt(3.0_ki),&
      &          -1.0_ki/sqrt(3.0_ki),&
      &          +1.0_ki /)


         do j=1,6

         refs(j,:) = &
     &(/ 1.0_ki/sqrt(3.0_ki), +1.0_ki/sqrt(3.0_ki),& 
     &  -1.0_ki/sqrt(3.0_ki), 1.0_ki/)

         enddo

!         refs(1,:) = vecs(5,:)
!         refs(2,:) = vecs(1,:)
!         refs(3,:) = vecs(2,:)
!         refs(4,:) = vecs(3,:)
!         refs(5,:) = vecs(4,:)

         pols(:,:) = 0.0_ki
         cnjpols(:,:) = 0.0_ki

         do h = 1, eval_helis
           do j=1,6
              pols(j,:) = epsi(helis(h,j), vecs(j,:), refs(j,:))
              cnjpols(j,:) = epso(helis(h,j), vecs(j,:), refs(j,:))
           end do

      write(19,*)
      write(19,*)
      write(19,'(A26,6(1x,I2))') "--------- HELICITY:", helis(h,:)
      write(19,*)
      write(19,'(A3,4(1x,F17.10))') "k1:", vecs(1,:)
      write(19,'(A3,4(1x,F17.10))') "k2:", vecs(2,:)
      write(19,'(A3,4(1x,F17.10))') "k3:", vecs(3,:)
      write(19,'(A3,4(1x,F17.10))') "k4:", vecs(4,:)
      write(19,'(A3,4(1x,F17.10))') "k5:", vecs(5,:)
      write(19,'(A3,4(1x,F17.10))') "k6:", vecs(6,:)
      write(19,*) "sum_i k_i:", &
     &  vecs(1,:)+vecs(2,:)+vecs(3,:)+vecs(4,:)+vecs(5,:)+vecs(6,:)

      write(19,*) 
      write(19,*) "k1.k1:", dotproduct(vecs(1,:),vecs(1,:))
      write(19,*) "k2.k2:", dotproduct(vecs(2,:),vecs(2,:))
      write(19,*) "k3.k3:", dotproduct(vecs(3,:),vecs(3,:))
      write(19,*) "k4.k4:", dotproduct(vecs(4,:),vecs(4,:))
      write(19,*) "k5.k5:", dotproduct(vecs(5,:),vecs(5,:))
      write(19,*) "k6.k6:", dotproduct(vecs(6,:),vecs(6,:))

      if (printout) then

      write(19,*) 
      write(19,*) "e1:", pols(1,:)
      write(19,*) "e2:", pols(2,:)
      write(19,*) "e3:", pols(3,:)
      write(19,*) "e4:", pols(4,:)
      write(19,*) "e5:", pols(5,:)

      write(19,*) 
      write(19,*) "(e1*):", cnjpols(1,:)
      write(19,*) "(e2*):", cnjpols(2,:)
      write(19,*) "(e3*):", cnjpols(3,:)
      write(19,*) "(e4*):", cnjpols(4,:)
      write(19,*) "(e5*):", cnjpols(5,:)
 
      write(19,*) 
      write(19,*) "e1.e1:", dotproduct(pols(1,:),pols(1,:))
      write(19,*) "e2.e2:", dotproduct(pols(2,:),pols(2,:))
      write(19,*) "e3.e3:", dotproduct(pols(3,:),pols(3,:))
      write(19,*) "e4.e4:", dotproduct(pols(4,:),pols(4,:))
      write(19,*) "e5.e5:", dotproduct(pols(5,:),pols(5,:))
      write(19,*) "e6.e6:", dotproduct(pols(6,:),pols(6,:))
   
      write(19,*) 
      write(19,*) "e1.k1:", dotproduct(pols(1,:),vecs(1,:))
      write(19,*) "e2.k2:", dotproduct(pols(2,:),vecs(2,:))
      write(19,*) "e3.k3:", dotproduct(pols(3,:),vecs(3,:))
      write(19,*) "e4.k4:", dotproduct(pols(4,:),vecs(4,:))
      write(19,*) "e5.k5:", dotproduct(pols(5,:),vecs(5,:))
      write(19,*) "e6.k6:", dotproduct(pols(6,:),vecs(6,:))

      write(19,*) 
      write(19,*) "e1.r1:", dotproduct(pols(1,:),refs(1,:))
      write(19,*) "e2.r2:", dotproduct(pols(2,:),refs(2,:))
      write(19,*) "e3.r3:", dotproduct(pols(3,:),refs(3,:))
      write(19,*) "e4.r4:", dotproduct(pols(4,:),refs(4,:))
      write(19,*) "e5.r5:", dotproduct(pols(5,:),refs(5,:))
      write(19,*) "e6.r6:", dotproduct(pols(6,:),refs(6,:))

      write(19,*) 
      write(19,*) "e1.(e1*):", dotproduct(pols(1,:),cnjpols(1,:))
      write(19,*) "e2.(e2*):", dotproduct(pols(2,:),cnjpols(2,:))
      write(19,*) "e3.(e3*):", dotproduct(pols(3,:),cnjpols(3,:))
      write(19,*) "e4.(e4*):", dotproduct(pols(4,:),cnjpols(4,:))
      write(19,*) "e5.(e5*):", dotproduct(pols(5,:),cnjpols(5,:))
      write(19,*) "e6.(e6*):", dotproduct(pols(6,:),cnjpols(6,:))

      endif   

      call cpu_time(t0)
      amp = amplitude(vecs, pols, refs, scale2)
      call cpu_time(t1)
      ttot = ttot + t1 - t0
      ccount = ccount + 1

      write(19,*), 
      write(19,*), "FINITE:", amp(0), abs(amp(0))
      write(19,*), "SINGLE:", amp(-1), abs(amp(-1))
      write(19,*), "DOUBLE:", amp(-2), abs(amp(-2))

      write(19,*), 

      if (fixed) then
      R6_pppppp = (-216.1940428450549950_ki,329.9510681241593676_ki)
      write(19,*), "R6_pppppp =", R6_pppppp, abs(R6_pppppp)
      write(19,*), "ratio vs S =", abs(amp(0))/abs(R6_pppppp)
      endif

!--- closing helicity cycle
      end do

!--- closing events cycle
   end do

   close(unit=19)


   print*, "amplitude calls:", ccount
   print*, "total time [s]:", ttot
   print*, "average time [ms]:", 1.0E+03 * ttot / real(ccount)


contains

 subroutine init_kinematics(omega, vecs, fixed)
   use rambo
   implicit none
   real(ki), dimension(6,4), intent(out) :: vecs
   real(ki) :: weight, omega
   logical fixed

   if (fixed) then

   vecs(1,:) = (/               0.07_ki,                0.06_ki,                0.1_ki, 0.1360147050873544_ki/)
   vecs(2,:) = (/                0.1_ki,                0.05_ki,               0.02_ki, 0.1135781669160055_ki/)
   vecs(3,:) = (/               0.06_ki,                0.01_ki,               0.02_ki, 0.0640312423743285_ki/)
   vecs(4,:) = (/               0.02_ki,                0.08_ki,               0.04_ki, 0.0916515138991168_ki/)
   vecs(5,:) = (/-0.2039268972194630_ki, -0.2039268972194630_ki,-0.2039268972194630_ki,-0.3532117470139864_ki/)
   vecs(6,:) = (/-0.0460731027805370_ki,  0.0039268972194630_ki, 0.0239268972194630_ki,-0.0520638812628188_ki/)

   else

     weight =  ramb(omega**2,&
   & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

    vecs(:,:)= vecs(:,(/2,3,4,1/))
    vecs(1,:)=-vecs(1,:)
    vecs(2,:)=-vecs(2,:)

   endif   

end  subroutine init_kinematics

end program
