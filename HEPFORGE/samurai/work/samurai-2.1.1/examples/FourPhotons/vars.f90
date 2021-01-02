module vars
   use precision, only: ki
   use kinematic, only: dotproduct, zab
   implicit none
   real(ki), dimension(4) :: vec1
   real(ki), dimension(4) :: vec2
   real(ki), dimension(4) :: vec3
   real(ki), dimension(4) :: vec4
   complex(ki), dimension(4) :: pol1
   complex(ki), dimension(4) :: pol2
   complex(ki), dimension(4) :: pol3
   complex(ki), dimension(4) :: pol4
   real(ki) :: mass

contains

   subroutine initvars(vecs,pols)
      implicit none
      real(ki), dimension(4,4), intent(in) :: vecs
      complex(ki), dimension(4,4), intent(in) :: pols
      vec1 = vecs(1,:)
      pol1 = pols(1,:)
      vec2 = vecs(2,:)
      pol2 = pols(2,:)
      vec3 = vecs(3,:)
      pol3 = pols(3,:)
      vec4 = vecs(4,:)
      pol4 = pols(4,:)
   end subroutine initvars

end module vars
