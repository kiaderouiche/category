program test
   use precision, only: ki
   use uussbb_kinematics
   use uussbb_model, only: parse
   use uussbb_matrix, only: samplitude, initgolem
   use uussbb_color, only: numcs, CA
   use msamurai
   use rambo
   implicit none

   integer :: ievt, ierr
   real(ki), dimension(6, 4) :: vecs
   real(ki) :: weight, omega
   double precision :: scale2
   double precision, dimension(0:3) :: amp
   logical NStest

   omega=14.0_ki
   NStest=.TRUE.

   open(unit=19,status='unknown',action='write',file='uussbb_debug.py')
   write(19,'(A7)') "evts=[]"

   open(unit=101,status='old',action='read',file='param.dat',iostat=ierr)
   if(ierr .eq. 0) then
      call parse(101)
      close(unit=101)
   else
      print*, "No file 'param.dat' found. Using defaults"
   end if

   call initgolem()

   call random_seed

   do ievt = 1, 1

      call init_kinematics(omega, vecs, NStest)

!      scale2 = 2.0_ki * dotproduct(vecs(1,:), vecs(2,:))

      scale2 = 1.0_ki

      call init_mandelstam(vecs)
      call init_sp(vecs)
      call inspect_kinematics(19)

      write(19,'(A26)') "evt=ContractedGolemEvent()"
      write(19,'(A16)') "evts.append(evt)"
      call samplitude(vecs, scale2, amp)

      write(19,'(A1,1x,A15,1x,G23.16)') "#", "SAMURAI LO:", amp(0)
      write(19,'(A1,1x,A24,1x,G23.16)') "#", "SAMURAI NLO, double pole:", amp(3)/amp(0)
      write(19,'(A1,1x,A24,1x,G23.16)') "#", "SAMURAI NLO, single pole:", amp(2)/amp(0)
      write(19,'(A1,1x,A24,1x,G23.16)') "#", "SAMURAI NLO, finite part:", amp(1)/amp(0)

   if (NStest) then

      write(19,*)
      write(19,'(A1,1x,A15,1x,G23.16)') "#", "GOLEM95 LO:", amp(0)
      write(19,'(A1,1x,A43)') "#", "GOLEM95 NLO, double pole: -8.000000000048633"
      write(19,'(A1,1x,A43)') "#", "GOLEM95 NLO, single pole:  46.40675046335535"
      write(19,'(A1,1x,A43)') "#", "GOLEM95 NLO, finite part: -233.8908276457752"

   endif

   end do

   close(19)

   call exitsamurai

contains

   subroutine init_kinematics(omega, vecs, NStest)
   use rambo
   implicit none
   real(ki), intent(in) :: omega
   real(ki), dimension(6,4), intent(out) :: vecs
   real(ki) :: weight
   logical, intent(in) :: NStest


   if (NStest) then

  vecs(1,:)= (/  0.0_ki,    0.0_ki, -56.62510948058161_ki, -56.62510948058161_ki /)
  vecs(2,:)= (/  0.0_ki,    0.0_ki,  56.62510948058161_ki, -56.62510948058161_ki /)
  vecs(3,:)= (/  33.500000000000000_ki,  15.900000000000000_ki,&
 &         25.000000000000000_ki,  44.72203036535797_ki /)
  vecs(4,:)= (/ -12.500000000000000_ki,  15.30000000000000_ki,&
 &          0.300000000000000_ki,  19.75930160709128_ki /)
  vecs(5,:)= (/ -10.000000000000000_ki, -18.00000000000000_ki,&
 &         -3.300000000000000_ki,  20.85401639972502_ki /)
  vecs(6,:)= (/ -11.000000000000000_ki, -13.20000000000000_ki,&
 &        -22.000000000000000_ki,  27.91487058898894_ki /)

    vecs(:,:)=vecs(:,(/4,1,2,3/))
    vecs(1,:)=-vecs(1,:)
    vecs(2,:)=-vecs(2,:)

   else

     weight =  ramb(omega**2,&
   & (/ 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki, 0.0_ki /), vecs)

!    vecs(:,:)=vecs(:,(/2,3,4,1/))
!    vecs(1,:)=-vecs(1,:)
!    vecs(2,:)=-vecs(2,:)

   endif

end  subroutine init_kinematics


end program test
