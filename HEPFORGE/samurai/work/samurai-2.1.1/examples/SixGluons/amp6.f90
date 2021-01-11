module     amp6
   use precision, only: ki
   use mtopo6
   use msamurai
   implicit none

contains

   function amplitude(vecs,pols,refs,scale2)
      implicit none
      real(ki),    dimension(6,4), intent(in) :: vecs,refs
      complex(ki), dimension(6,4), intent(in) :: pols

      real(ki), intent(in) :: scale2
      real(ki), dimension(6,4) :: Vi
      real(ki), dimension(6) :: msq
      real(ki), dimension(4) :: vec0
      complex(ki), dimension(-2:0) :: amplitude, tot
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
      Vi(6,:) = vec5 + Vi(5,:)
      msq(:)=mass*mass


      call samurai(topo6,tot,totr,Vi,msq,6,6,4,scale2,ok)
      amplitude(:) = tot(:)

   end function amplitude
end module amp6

