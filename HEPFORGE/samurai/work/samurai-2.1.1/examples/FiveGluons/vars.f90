module vars
   use precision, only: ki
   implicit none
   save
   real(ki),    dimension(4) :: vec1, vec2, vec3, vec4, vec5
   real(ki),    dimension(4) ::   r1,   r2,   r3,   r4,   r5
   complex(ki), dimension(4) :: pol1, pol2, pol3, pol4, pol5
   real(ki) :: mass
contains

   subroutine initvars(vecs,pols,refs)
      implicit none
      real(ki),    dimension(5,4), intent(in) :: vecs
      real(ki),    dimension(5,4), intent(in) :: refs
      complex(ki), dimension(5,4), intent(in) :: pols
      vec1 = vecs(1,:)
      vec2 = vecs(2,:)
      vec3 = vecs(3,:)
      vec4 = vecs(4,:)
      vec5 = vecs(5,:)
      pol1 = pols(1,:)
      pol2 = pols(2,:)
      pol3 = pols(3,:)
      pol4 = pols(4,:)
      pol5 = pols(5,:)
      r1 = refs(1,:)
      r2 = refs(2,:)
      r3 = refs(3,:)
      r4 = refs(4,:)
      r5 = refs(5,:)
   end subroutine initvars
end module vars

