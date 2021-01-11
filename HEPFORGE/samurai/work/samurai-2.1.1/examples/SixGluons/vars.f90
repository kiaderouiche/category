module vars
   use precision, only: ki
   use kinematic
   implicit none
   save
   real(ki),    dimension(4) :: vec1, vec2, vec3, vec4, vec5, vec6
   real(ki),    dimension(4) ::   r1,   r2,   r3,   r4,   r5,   r6
   complex(ki), dimension(4) :: pol1, pol2, pol3, pol4, pol5, pol6
   real(ki) :: mass

contains

   subroutine initvars(vecs, pols, refs)
      implicit none
      real(ki),    dimension(6,4), intent(in) :: vecs,refs
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
        r1 = refs(1,:)
        r2 = refs(2,:)
        r3 = refs(3,:)
        r4 = refs(4,:)
        r5 = refs(5,:)
        r6 = refs(6,:)
   end subroutine initvars

   function penta(L1,L2,L3,L4,L5,mu2,p1,p2,p3,p4,p5,p6,r1,r2,r3,r4,r5,r6)
      implicit none
      complex(ki), dimension(4), intent(in) :: L1,L2,L3,L4,L5
      complex(ki), intent(in) :: mu2
      real(ki), dimension(4), intent(in) :: p1,p2,p3,p4,p5,p6
      real(ki), dimension(4), intent(in) :: r1,r2,r3,r4,r5,r6
      real(ki), dimension(4) :: p12
      complex(ki), dimension(4) :: L51
      complex(ki) :: penta

      L51(:) = L5(:) + p1(:)

      penta = +2.0_ki*(-1.0_ki) &
              & *(mu2)*zb(p1,p2)/za(p1,p2)& 
              &/(dotproduct(L51,L51)-mu2)&
              & *zab(r3,L2,p3)/za(r3,p3)*zab(r4,L3,p4)/za(r4,p4)&
              & *zab(r5,L4,p5)/za(r5,p5)*zab(r6,L5,p6)/za(r6,p6)
   end  function penta

   function box1(L1,L2,L3,L4,mu2,p1,p2,p3,p4,p5,p6,r1,r2,r3,r4,r5,r6)
      implicit none
      complex(ki), dimension(4), intent(in) :: L1,L2,L3,L4
      complex(ki), intent(in) :: mu2
      real(ki), dimension(4), intent(in) :: p1,p2,p3,p4,p5,p6
      real(ki), dimension(4), intent(in) :: r1,r2,r3,r4,r5,r6
      real(ki), dimension(4) :: p12
      complex(ki), dimension(4) :: L41, L42
      complex(ki) :: box1

         p12(:) = p1(:)+ p2(:)

      L41(:) = L4(:) + p1(:)
      L42(:) = L4(:) + p1(:)+ p2(:)

      box1 = +2.0_ki &
              & *(mu2)*zbb(p1, L4, p12, p3)/za(p1,p2)/za(p2,p3)&
              & /(dotproduct(L41,L41)-mu2)/(dotproduct(L42,L42)-mu2)&
              & *zab(r4,L1,p4)/za(r4,p4)&
              & *zab(r5,L3,p5)/za(r5,p5)*zab(r6,L3,p6)/za(r6,p6)
   end  function box1


   function box2h(L1,L2,L3,L4,mu2,p1,p2,p3,p4,p5,p6,r1,r2,r3,r4,r5,r6)
      implicit none
      complex(ki), dimension(4), intent(in) :: L1,L2,L3,L4
      complex(ki), intent(in) :: mu2
      real(ki), dimension(4), intent(in) :: p1,p2,p3,p4,p5,p6
      real(ki), dimension(4), intent(in) :: r1,r2,r3,r4,r5,r6
      real(ki), dimension(4) :: p12
      complex(ki), dimension(4) :: L41, L13
      complex(ki) :: box2h

         p12(:) = p1(:)+ p2(:)

      L41(:) = L4(:) + p1(:)
      L13(:) = L1(:) + p3(:)

      box2h = +2.0_ki &
              & *(mu2)*zb(p1,p2)/za(p1,p2)/(dotproduct(L41,L41)-mu2)&
              & *(mu2)*zb(p3,p4)/za(p3,p4)/(dotproduct(L13,L13)-mu2)&
              & *zab(r5,L2,p5)/za(r5,p5)*zab(r6,L3,p6)/za(r6,p6)
   end  function box2h


   function box2e(L1,L2,L3,L4,mu2,p1,p2,p3,p4,p5,p6,r1,r2,r3,r4,r5,r6)
      implicit none
      complex(ki), dimension(4), intent(in) :: L1,L2,L3,L4
      complex(ki), intent(in) :: mu2
      real(ki), dimension(4), intent(in) :: p1,p2,p3,p4,p5,p6
      real(ki), dimension(4), intent(in) :: r1,r2,r3,r4,r5,r6
      real(ki), dimension(4) :: p12
      complex(ki), dimension(4) :: L41, L24
      complex(ki) :: box2e

         p12(:) = p1(:)+ p2(:)

      L41(:) = L4(:) + p1(:)
      L24(:) = L2(:) + p4(:)

      box2e = +2.0_ki &
              & *(mu2)*zb(p1,p2)/za(p1,p2)/(dotproduct(L41,L41)-mu2)&
              & *zab(r3,L1,p3)/za(r3,p3)&
              & *(mu2)*zb(p4,p5)/za(p4,p5)/(dotproduct(L24,L24)-mu2)&
              & *zab(r6,L3,p6)/za(r6,p6)
   end  function box2e

end module vars

