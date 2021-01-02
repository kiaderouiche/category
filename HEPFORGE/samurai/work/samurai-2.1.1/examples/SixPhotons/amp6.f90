module     amp6
   use precision, only: ki
   use mtopo6
   use msamurai
   use vars
   implicit none

contains

   subroutine amplitude(vecs,pols,scale2,tot,totr)
      implicit none
      real(ki), dimension(6,4), intent(in) :: vecs
      complex(ki), dimension(6,4), intent(in) :: pols
      complex(ki), intent(out) :: totr
      real(ki), intent(in) :: scale2
      complex(ki), dimension(-2:0), intent(out) :: tot
      real(ki), dimension(4) :: vec0
      real(ki), dimension(6,4) :: Vi
      real(ki), dimension(6) :: msq
      logical :: ok

      totr=0.0_ki
      tot(:) = 0.0_ki
      vec0(:) = 0.0_ki

      call initvars(vecs,pols)
      Vi(1,:) = vec0
      Vi(2,:) = vec1 + Vi(1,:)
      Vi(3,:) = vec2 + Vi(2,:)
      Vi(4,:) = vec3 + Vi(3,:)
      Vi(5,:) = vec4 + Vi(4,:)
      Vi(6,:) = vec5 + Vi(5,:)
      msq(:)=mass*mass

      call samurai(topo6,tot,totr,Vi,msq,6,6,2,scale2,ok)

!      call samurai(topo6,tot,totr,Vi,msq,6,6,3,scale2,ok)
!      tot(0) = tot(0) - totr

   end subroutine amplitude
end module amp6

