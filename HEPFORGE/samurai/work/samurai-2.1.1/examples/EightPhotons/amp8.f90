module     amp8
   use precision, only: ki
   use mtopo8
   use msamurai
   use vars
   implicit none

contains

   subroutine amplitude(vecs,pols,scale2,tot,totr)
      implicit none
      real(ki), dimension(8,4), intent(in) :: vecs
      complex(ki), dimension(8,4), intent(in) :: pols
      complex(ki), intent(out) :: totr
      real(ki), intent(in) :: scale2
      complex(ki), dimension(-2:0), intent(out) :: tot
      real(ki), dimension(4) :: vec0
      real(ki), dimension(8,4) :: Vi
      real(ki), dimension(8) :: msq
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
      Vi(7,:) = vec6 + Vi(6,:)
      Vi(8,:) = vec7 + Vi(7,:)
      msq(:)=mass*mass

      call samurai(topo8,tot,totr,Vi,msq,8,8,2,scale2,ok)

!      call samurai(topo8,tot,totr,Vi,msq,8,8,4,scale2,ok)
!      tot(0) = tot(0) - totr

   end subroutine amplitude
end module amp8

