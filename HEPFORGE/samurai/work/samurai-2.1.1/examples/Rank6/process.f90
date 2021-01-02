program process
   use precision, only: ki
   use kinematic
   use vars
   use rambo
   use mxnum
   use msamurai
   implicit none

!  chose here the number of events = nevt
   integer, parameter :: nevt = 1

   integer :: j, ievt, rank, istop, nleg

   real(ki), dimension(6,4) :: vecs
   real(ki), dimension(0:5) :: msq
   real(ki), dimension(0:5,4) :: Vi

   real(ki) :: scale2, xmass, weight
   complex(ki), dimension(-2:0) ::  tot
   complex(ki) :: totr
   logical :: ok

   integer :: isca, itest, verbosity
   character(len=4) :: imeth

! arguments of initsamurai: (imeth,isca,verbosity,itest)
   imeth     = 'diag' ! 1 (traditional); 2 (tree level structures)
   isca      = 2 ! 1 (QCDloop); 2 (OneLOop)
   verbosity = 1 ! 0 (nothing); 1 (coeffs); 2 (coeffs+s.i.); 3(coeffs+s.i.+tests)
   itest     = 0 ! 0 (none); 1 (powertest); 2 (nntest); 3 (lnntest)
   call initsamurai(imeth,isca,verbosity,itest)
   

   call random_seed

   do ievt = 1, nevt
    weight =  ramb(50.0E+00_ki**2,&
  & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

   vecs(:,:)=vecs(:,(/2,3,4,1/))


  vecs(1,:)= - (/  0.0_ki,    0.0_ki, -56.62510948058161_ki, -56.62510948058161_ki /)
  vecs(2,:)= - (/  0.0_ki,    0.0_ki,  56.62510948058161_ki, -56.62510948058161_ki /)
  vecs(3,:)= (/  33.500000000000000_ki,  15.900000000000000_ki,&
 &         25.000000000000000_ki,  44.72203036535797_ki /)
  vecs(4,:)= (/ -12.500000000000000_ki,  15.30000000000000_ki,&
 &          0.300000000000000_ki,  19.75930160709128_ki /)
  vecs(5,:)= (/ -10.000000000000000_ki, -18.00000000000000_ki,&
 &         -3.300000000000000_ki,  20.85401639972502_ki /)
  vecs(6,:)= (/ -11.000000000000000_ki, -13.20000000000000_ki,&
 &        -22.000000000000000_ki,  27.91487058898894_ki /)


   Vi(1,:)=-vecs(1,:)
   Vi(2,:)=-vecs(2,:)+Vi(1,:)
   Vi(3,:)=+vecs(3,:)+Vi(2,:)
   Vi(4,:)=+vecs(4,:)+Vi(3,:)
   Vi(5,:)=+vecs(5,:)+Vi(4,:)
!   Vi(6,:)=+vecs(6,:)+Vi(5,:)
!   Vi(7,:)=+vecs(7,:)+Vi(6,:)
!   Vi(0,:)=+vecs(6,:)+Vi(5,:)
   Vi(0,:)=(/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /)

   xmass=5.0_ki
   print*, 'Internal Momenta and Masses:'
   do j=0,5
      msq(j)=xmass*xmass
      print*,j, Vi(j,:)
   enddo

   nleg=6
!--- check the rank of the numerator function in xnum
!--- please note that each power of mu2 has rank 2
   rank=6
   istop=1
   scale2=1.0_ki
   call samurai(xnum,tot,totr,Vi,msq,nleg,rank,istop,scale2,ok)

   if (ok) then
      print*, '   finite part', tot( 0)
      print*, '   single pole', tot(-1)
      print*, '   double pole', tot(-2)
   else
      print*,'Bad Point -- External Momenta:'
      do j=1,nleg
         print*,j, vecs(j,:)
      enddo
   endif
      
      
!--- remove the following comment to print also the rational part alone
!   print*, 'rational alone', totr

   enddo

   call exitsamurai

   stop
end program
