module vars
   use precision, only: ki
   implicit none

   real(ki), dimension(4) :: vec1
   real(ki), dimension(4) :: vec2
   real(ki), dimension(4) :: vec3
   real(ki), dimension(4) :: vec4
   real(ki), dimension(4) :: vec5
   real(ki), dimension(4) :: vec6
   complex(ki), dimension(4) :: pol1
   complex(ki), dimension(4) :: pol2
   complex(ki), dimension(4) :: pol3
   complex(ki), dimension(4) :: pol4
   complex(ki), dimension(4) :: pol5
   complex(ki), dimension(4) :: pol6
   real(ki) :: mass

contains

   subroutine initvars(vecs,pols)
      implicit none
      real(ki), dimension(6,4), intent(in) :: vecs
      complex(ki), dimension(6,4), intent(in) :: pols
      vec1 = vecs(1,:)
      vec2 = vecs(2,:)
      vec3 = vecs(3,:)
      vec4 = vecs(4,:)
      vec5 = vecs(5,:)
      vec6 = vecs(6,:)
      pol1 = pols(1,:)
      pol2 = pols(2,:)
      pol3 = pols(3,:)
      pol4 = pols(4,:)
      pol5 = pols(5,:)
      pol6 = pols(6,:)
   end subroutine initvars

end module vars
