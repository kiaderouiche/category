module vars
   use precision, only: ki
   implicit none
   real(ki), dimension(4) :: vec1
   real(ki), dimension(4) :: vec2
   real(ki), dimension(4) :: vec3
   real(ki), dimension(4) :: vec4
   real(ki), dimension(4) :: vec5
   real(ki), dimension(4) :: vec6
!   real(ki), dimension(4) :: vec7
!   real(ki), dimension(4) :: vec8

contains

   subroutine initvars(vecs)
      implicit none
      real(ki), dimension(6,4), intent(in) :: vecs
      vec1 = vecs(1,:)
      vec2 = vecs(2,:)
      vec3 = vecs(3,:)
      vec4 = vecs(4,:)
      vec5 = vecs(5,:)
      vec6 = vecs(6,:)
!      vec7 = vecs(7,:)
!      vec8 = vecs(8,:)
   end subroutine initvars

end module vars
