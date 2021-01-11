module vars
   use precision, only: ki
   implicit none
   real(ki), dimension(4) :: vec1, vec2, vec3, vec4, vec5
   complex(ki), dimension(4) :: pol5
   real(ki) :: mass

contains

   subroutine initvars(vecs,polariz)
      implicit none
      real(ki), dimension(5,4), intent(in) :: vecs
      complex(ki), dimension(4), intent(in) :: polariz

      vec1 = vecs(1,:)
      vec2 = vecs(2,:)
      vec3 = vecs(3,:)
      vec4 = vecs(4,:)
      vec5 = vecs(5,:)
      pol5 = polariz(:)

   end subroutine initvars

end module vars
