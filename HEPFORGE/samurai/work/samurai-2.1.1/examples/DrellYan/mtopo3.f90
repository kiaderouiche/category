module     mtopo3
   use precision, only: ki
   use kinematic
   use vars
   implicit none

contains

   function topo0(ncut, Q, mu2)
      implicit none
      integer, intent(in) :: ncut
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

      complex(ki) :: topo0
      complex(ki) :: QQ, k3Q, k4Q, z43, z12
      real(ki) :: k34

      QQ = dotproduct(Q, Q) - mu2
      k3Q = dotproduct(vec3, Q)
      k4Q = dotproduct(vec4, Q)
      k34 = dotproduct(vec3, vec4)

      z43=zab(vec4,Q,vec3)
      z12=zab(vec1,Q,vec2)

      topo0= - 4.0_ki*z43*z12 + (2.0_ki*QQ+4.0_ki*(k3Q-k4Q-k34))*&
      &  2.0_ki*za(vec4,vec1)*zb(vec2,vec3)

      topo0 = topo0 / (2.0_ki*za(vec4,vec1)*zb(vec2,vec3))

    end  function topo0


   pure function topo1(ncut, Q, mu2)
      implicit none
      integer, intent(in) :: ncut
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

      complex(ki) :: topo1
      complex(ki) :: QQ, k3Q, k4Q, z43, z12
      real(ki) :: k34

      QQ = dotproduct(Q, Q) - mu2
      k3Q = dotproduct(vec3, Q)
      k4Q = dotproduct(vec4, Q)
      k34 = dotproduct(vec3, vec4)

      z43=zab(vec4,Q,vec3)
      z12=zab(vec1,Q,vec2)

      topo1= + 4.0_ki*z43*z12 - 2.0_ki*QQ*&
      &  2.0_ki*za(vec4,vec1)*zb(vec2,vec3)

      topo1 = topo1 / (2.0_ki*za(vec4,vec1)*zb(vec2,vec3))

    end  function topo1


 end module mtopo3

