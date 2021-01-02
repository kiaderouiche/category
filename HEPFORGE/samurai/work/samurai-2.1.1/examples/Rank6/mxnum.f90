module     mxnum
   use precision, only: ki
   use kinematic
   implicit none

contains

     function xnum(ncut,Q, mu2)
      implicit none

!--- input variables
      integer, intent(in) :: ncut
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

!--- our function
      complex(ki) :: xnum

!--- local variables
      real(ki), dimension(4) :: Pvec

!--- the following function has rank 6
      Pvec = (/ 81.0_ki, 5.0_ki, 4.0_ki, 3.0_ki /)
      xnum = dotproduct(Q,Pvec)**6

     end function xnum
 end module mxnum
