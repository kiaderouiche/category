module     amp5
   use precision, only: ki
   use mtopo5
   use msamurai
   implicit none
contains
   function amplitude(vecs, pols, refs, scale2)
      implicit none
      real(ki),    dimension(5,4), intent(in) :: vecs
      complex(ki), dimension(5,4), intent(in) :: pols
      real(ki), intent(in) :: scale2
      complex(ki), dimension(-2:0) :: amplitude, tot
      real(ki), dimension(5,4) :: Vi, refs
      real(ki), dimension(5) :: msq
      real(ki), dimension(4) :: vec0
      complex(ki) :: totr
      logical :: ok

      amplitude(:) = 0.0_ki
      tot(:) = 0.0_ki
      vec0(:) = 0.0_ki

      call initvars(vecs, pols, refs)
      Vi(1,:) = vec0
      Vi(2,:) = vec1 + Vi(1,:)
      Vi(3,:) = vec2 + Vi(2,:)
      Vi(4,:) = vec3 + Vi(3,:)
      Vi(5,:) = vec4 + Vi(4,:)
      msq(:)=mass*mass

      call samurai(topo5,tot,totr,Vi,msq,5,5,2,scale2,ok)
      amplitude(:) = tot(:)

!      call samurai(topo5,tot,totr,Vi,msq,5,5,4,scale2,ok)
!      amplitude(:) = tot(:)

   end function amplitude
end module amp5

