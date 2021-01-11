module vars
   use precision, only: ki
   implicit none
   real(ki), dimension(4) :: vec1, vec2, vec3, vec4
   real(ki) :: mass

contains


   subroutine initvars(vecs)
      implicit none
      real(ki), dimension(4,4), intent(in) :: vecs

      vec1 = vecs(1,:)
      vec2 = vecs(2,:)
      vec3 = vecs(3,:)
      vec4 = vecs(4,:)

   end subroutine initvars

end module vars
