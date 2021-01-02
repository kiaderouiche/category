module     mtopo4
   use precision, only: ki
   use kinematic
   use vars
   implicit none

contains

   function topo4(ncut, Q, mu2)
      implicit none
      integer, intent(in) :: ncut
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(4), intent(in) :: Q

      complex(ki) :: topo4, topolo, Q2, dQ, dQ2, dQ25, dQ251
      complex(ki), dimension(4) :: Qp2, Qp25, Qp251

      Qp2(:)= Q(:)+vec2(:)
      Qp25(:)= Qp2(:)+vec5(:)
      Qp251(:)= Qp25(:)+vec1(:)
      Q2= dotproduct(Q,Q)
      dQ= Q2-mu2
      dQ2= dotproduct(Qp2,Qp2)-mu2
      dQ25= dotproduct(Qp25,Qp25)-mu2
      dQ251= dotproduct(Qp251,Qp251)-mu2

      topolo=  - 1.0_ki/(dotproduct(vec2,vec5))*dotproduct(vec2,pol5)*za(&
     & vec1,vec3)*zb(vec2,vec4) + 1.0_ki/2.0_ki/(dotproduct(vec2,vec5))*za(vec1&
     & ,vec3)*za(vec5,pol5)*zb(vec2,pol5)*zb(vec5,vec4) + 1.0_ki/(&
     & dotproduct(vec5,vec1))*dotproduct(vec1,pol5)*za(vec1,vec3)*zb(&
     & vec2,vec4) - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*za(vec1,pol5)*za(vec5&
     & ,vec3)*zb(vec2,vec4)*zb(vec5,pol5)

      topo4= zab(vec1,Q,vec2)*zab(pol5,Q,vec4)*za(vec2,vec3)*zb(vec2,&
     & pol5) - 4.0_ki*zab(vec1,Q,vec4)*zab(vec3,Q,vec2)*dotproduct(vec2,&
     & pol5) - 4.0_ki*zab(vec1,Q,vec4)*zab(vec3,Q,vec2)*dotproduct(pol5,Q)&
     &  - 4.0_ki*zab(vec1,Q,vec4)*dotproduct(vec2,pol5)*za(vec1,vec3)*zb(&
     & vec2,vec1) - 4.0_ki*zab(vec1,Q,vec4)*dotproduct(pol5,Q)*za(vec1,vec3&
     & )*zb(vec2,vec1) + zab(vec1,Q,vec5)*zab(pol5,Q,vec4)*za(vec5,vec3&
     & )*zb(vec2,pol5) - zab(vec3,Q,vec2)*zab(pol5,Q,vec4)*za(vec2,vec1&
     & )*zb(vec2,pol5) + 4.0_ki*zab(vec3,Q,vec2)*dotproduct(vec2,pol5)*za(&
     & vec5,vec1)*zb(vec5,vec4) + 4.0_ki*zab(vec3,Q,vec2)*dotproduct(pol5,Q&
     & )*za(vec5,vec1)*zb(vec5,vec4) + zab(vec3,Q,vec5)*zab(pol5,Q,vec4&
     & )*za(vec5,vec1)*zb(vec2,pol5) - 4.0_ki*zab(vec3,Q,vec5)*dotproduct(&
     & vec2,pol5)*za(vec5,vec1)*zb(vec2,vec4) - 4.0_ki*zab(vec3,Q,vec5)*&
     & dotproduct(pol5,Q)*za(vec5,vec1)*zb(vec2,vec4) + 2.0_ki*zab(vec3,Q,&
     & pol5)*zab(vec5,Q,vec4)*za(vec1,pol5)*zb(vec2,vec5) - zab(vec3,Q,&
     & pol5)*za(vec1,pol5)*zb(vec2,vec4)*mu2 + zab(vec3,Q,pol5)*za(vec1&
     & ,pol5)*zb(vec2,vec4)*Q2
      topo4 = topo4 + 4.0_ki*zab(vec5,Q,vec4)*dotproduct(vec1,pol5)*za(&
     & vec1,vec3)*zb(vec2,vec5) - 4.0_ki*zab(vec5,Q,vec4)*dotproduct(vec2,&
     & pol5)*za(vec1,vec3)*zb(vec2,vec5) - 4.0_ki*zab(vec5,Q,vec4)*&
     & dotproduct(pol5,Q)*za(vec1,vec3)*zb(vec2,vec5) - 2.0_ki*zab(vec5,Q,&
     & vec4)*za(vec1,pol5)*za(vec2,vec3)*zb(vec2,vec5)*zb(vec2,pol5) - &
     & 2.0_ki*zab(vec5,Q,vec4)*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec5)*&
     & zb(vec5,pol5) + 2.0_ki*zab(pol5,Q,vec4)*dotproduct(vec1,Q)*za(vec1,&
     & vec3)*zb(vec2,pol5) + 2.0_ki*zab(pol5,Q,vec4)*dotproduct(vec2,vec1)*&
     & za(vec1,vec3)*zb(vec2,pol5) - 2.0_ki*zab(pol5,Q,vec4)*dotproduct(&
     & vec5,vec1)*za(vec1,vec3)*zb(vec2,pol5) - zab(pol5,Q,vec4)*za(&
     & vec1,vec3)*zb(vec2,pol5)*mu2 + zab(pol5,Q,vec4)*za(vec1,vec3)*&
     & zb(vec2,pol5)*Q2 - zab(pol5,Q,vec4)*za(vec2,vec1)*za(vec5,vec3)*&
     & zb(vec2,vec5)*zb(vec2,pol5) - zab(pol5,Q,vec4)*za(vec2,vec3)*za(&
     & vec5,vec1)*zb(vec2,vec5)*zb(vec2,pol5) + 2.0_ki*dotproduct(vec1,pol5&
     & )*za(vec1,vec3)*zb(vec2,vec4)*dQ - 2.0_ki*dotproduct(vec1,pol5)*za(&
     & vec1,vec3)*zb(vec2,vec4)*mu2
      topo4 = topo4 + 2.0_ki*dotproduct(vec1,pol5)*za(vec1,vec3)*zb(vec2,&
     & vec4)*Q2 + 4.0_ki*dotproduct(vec2,pol5)*za(vec1,vec3)*zb(vec2,vec4)*&
     & dQ + 4.0_ki*dotproduct(pol5,Q)*za(vec1,vec3)*zb(vec2,vec4)*dQ + za(&
     & vec1,pol5)*za(vec2,vec3)*zb(vec2,vec4)*zb(vec2,pol5)*mu2 - za(&
     & vec1,pol5)*za(vec2,vec3)*zb(vec2,vec4)*zb(vec2,pol5)*Q2 + za(&
     & vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*dQ + za(&
     & vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*mu2 - za(&
     & vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*Q2 - 2.0_ki/(&
     & dotproduct(vec2,vec5))*zab(vec1,Q,vec4)*zab(vec3,Q,vec2)*&
     & dotproduct(vec2,pol5)*dQ2 + 1.0_ki/(dotproduct(vec2,vec5))*zab(vec1,Q&
     & ,vec4)*zab(vec3,Q,vec5)*za(vec5,pol5)*zb(vec2,pol5)*dQ2 - 2.0_ki/(&
     & dotproduct(vec2,vec5))*zab(vec1,Q,vec4)*dotproduct(vec2,pol5)*&
     & za(vec1,vec3)*zb(vec2,vec1)*dQ2 + 1.0_ki/(dotproduct(vec2,vec5))*zab(&
     & vec1,Q,vec4)*za(vec1,vec3)*za(vec5,pol5)*zb(vec2,pol5)*zb(vec5,&
     & vec1)*dQ2 - 1.0_ki/(dotproduct(vec2,vec5))*zab(vec2,Q,vec4)*za(vec1,&
     & vec3)*za(vec5,pol5)*zb(vec2,vec5)*zb(vec2,pol5)*dQ2
      topo4 = topo4 + 2.0_ki/(dotproduct(vec2,vec5))*zab(vec3,Q,vec2)*&
     & dotproduct(vec2,pol5)*za(vec5,vec1)*zb(vec5,vec4)*dQ2 + 1.0_ki/(&
     & dotproduct(vec2,vec5))*zab(vec3,Q,vec2)*za(vec2,vec1)*za(vec5,&
     & pol5)*zb(vec2,pol5)*zb(vec5,vec4)*dQ2 - 2.0_ki/(dotproduct(vec2,vec5&
     & ))*zab(vec3,Q,vec5)*dotproduct(vec2,pol5)*za(vec5,vec1)*zb(vec2,&
     & vec4)*dQ2 - 1.0_ki/(dotproduct(vec2,vec5))*zab(vec3,Q,vec5)*za(vec2,&
     & vec1)*za(vec5,pol5)*zb(vec2,vec4)*zb(vec2,pol5)*dQ2 - 2.0_ki/(&
     & dotproduct(vec2,vec5))*zab(vec5,Q,vec2)*dotproduct(vec2,pol5)*&
     & za(vec1,vec3)*zb(vec5,vec4)*dQ251 - 2.0_ki/(dotproduct(vec2,vec5))*&
     & zab(vec5,Q,vec2)*dotproduct(pol5,Q)*za(vec1,vec3)*zb(vec5,vec4)*&
     & dQ251 - 2.0_ki/(dotproduct(vec2,vec5))*zab(vec5,Q,vec4)*dotproduct(&
     & vec2,pol5)*za(vec1,vec3)*zb(vec2,vec5)*dQ2 + 1.0_ki/(dotproduct(vec2,&
     & vec5))*zab(vec5,Q,pol5)*za(vec1,vec3)*za(vec2,pol5)*zb(vec2,vec4&
     & )*zb(vec2,vec5)*dQ251 + 1.0_ki/(dotproduct(vec2,vec5))*zab(vec5,Q,&
     & pol5)*za(vec1,vec3)*za(vec5,pol5)*zb(vec2,vec5)*zb(vec5,vec4)*&
     & dQ251
      topo4 = topo4 - 1.0_ki/2.0_ki/(dotproduct(vec2,vec5))*zab(pol5,Q,vec2)*&
     & za(vec1,vec3)*za(vec2,vec5)*zb(vec2,pol5)*zb(vec5,vec4)*dQ251 - &
     & 1.0_ki/2.0_ki/(dotproduct(vec2,vec5))*zab(pol5,Q,vec5)*za(vec1,vec3)*za(&
     & vec2,vec5)*zb(vec2,vec4)*zb(vec2,pol5)*dQ251 - 4.0_ki/(dotproduct(&
     & vec2,vec5))*dotproduct(vec2,Q)*dotproduct(vec2,pol5)*za(vec1,&
     & vec3)*zb(vec2,vec4)*dQ251 - 4.0_ki/(dotproduct(vec2,vec5))*&
     & dotproduct(vec2,Q)*dotproduct(pol5,Q)*za(vec1,vec3)*zb(vec2,vec4&
     & )*dQ251 + 2.0_ki/(dotproduct(vec2,vec5))*dotproduct(vec2,pol5)*za(&
     & vec1,vec3)*zb(vec2,vec4)*mu2*dQ251 - 2.0_ki/(dotproduct(vec2,vec5))*&
     & dotproduct(vec2,pol5)*za(vec1,vec3)*zb(vec2,vec4)*Q2*dQ251 - 1.0_ki/(&
     & dotproduct(vec2,vec5))*za(vec1,vec3)*za(vec5,pol5)*zb(vec2,pol5)&
     & *zb(vec5,vec4)*mu2*dQ251 + 1.0_ki/(dotproduct(vec2,vec5))*za(vec1,&
     & vec3)*za(vec5,pol5)*zb(vec2,pol5)*zb(vec5,vec4)*Q2*dQ251 + 1.0_ki/2.0_ki&
     & /(dotproduct(vec2,vec5))/(dotproduct(vec2,vec5))*zab(vec2,Q,vec5&
     & )*za(vec1,vec3)*za(vec5,pol5)*zb(vec2,vec4)*zb(vec2,pol5)*dQ2*&
     & dQ251
      topo4 = topo4 - 1.0_ki/(dotproduct(vec2,vec5))/(dotproduct(vec2,vec5&
     & ))*zab(vec5,Q,vec2)*dotproduct(vec2,pol5)*za(vec1,vec3)*zb(vec5,&
     & vec4)*dQ2*dQ251 - 2.0_ki/(dotproduct(vec2,vec5))/(dotproduct(vec2,&
     & vec5))*dotproduct(vec2,Q)*dotproduct(vec2,pol5)*za(vec1,vec3)*&
     & zb(vec2,vec4)*dQ2*dQ251 + 1.0_ki/(dotproduct(vec2,vec5))/(dotproduct(&
     & vec2,vec5))*dotproduct(vec5,Q)*za(vec1,vec3)*za(vec5,pol5)*zb(&
     & vec2,pol5)*zb(vec5,vec4)*dQ2*dQ251 - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1&
     & ))*zab(vec1,Q,vec2)*za(vec1,vec3)*za(vec2,pol5)*zb(vec1,pol5)*&
     & zb(vec2,vec4)*dQ - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*zab(vec1,Q,vec2&
     & )*za(vec2,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*dQ + 2.0_ki&
     & /(dotproduct(vec5,vec1))*zab(vec1,Q,vec4)*zab(vec3,Q,vec2)*&
     & dotproduct(vec1,pol5)*dQ25 + 2.0_ki/(dotproduct(vec5,vec1))*zab(vec1&
     & ,Q,vec4)*dotproduct(vec1,pol5)*za(vec1,vec3)*zb(vec2,vec1)*dQ25&
     &  - 1.0_ki/(dotproduct(vec5,vec1))*zab(vec1,Q,vec4)*za(vec1,pol5)*za(&
     & vec5,vec3)*zb(vec2,vec1)*zb(vec5,pol5)*dQ25 + 1.0_ki/(dotproduct(vec5&
     & ,vec1))*zab(vec1,Q,vec5)*dotproduct(vec1,pol5)*za(vec5,vec3)*zb(&
     & vec2,vec4)*dQ
      topo4 = topo4 + 2.0_ki/(dotproduct(vec5,vec1))*zab(vec1,Q,vec5)*&
     & dotproduct(vec2,pol5)*za(vec5,vec3)*zb(vec2,vec4)*dQ + 2.0_ki/(&
     & dotproduct(vec5,vec1))*zab(vec1,Q,vec5)*dotproduct(pol5,Q)*za(&
     & vec5,vec3)*zb(vec2,vec4)*dQ - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*zab(&
     & vec1,Q,vec5)*za(vec1,vec3)*za(vec5,pol5)*zb(vec1,pol5)*zb(vec2,&
     & vec4)*dQ - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*zab(vec2,Q,vec1)*za(&
     & vec1,vec3)*za(vec1,pol5)*zb(vec2,vec4)*zb(vec2,pol5)*dQ - 1.0_ki/2.0_ki&
     & /(dotproduct(vec5,vec1))*zab(vec2,Q,vec5)*za(vec1,pol5)*za(vec5,&
     & vec3)*zb(vec2,vec4)*zb(vec2,pol5)*dQ + 1.0_ki/2.0_ki/(dotproduct(vec5,&
     & vec1))*zab(vec2,Q,pol5)*za(vec1,vec3)*za(vec1,pol5)*zb(vec2,vec1&
     & )*zb(vec2,vec4)*dQ + 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*zab(vec2,Q,&
     & pol5)*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec2,vec5)*dQ&
     &  + 1.0_ki/(dotproduct(vec5,vec1))*zab(vec3,Q,vec1)*za(vec1,pol5)*za(&
     & vec5,vec1)*zb(vec2,vec4)*zb(vec5,pol5)*dQ25 - 1.0_ki/(dotproduct(vec5&
     & ,vec1))*zab(vec3,Q,vec2)*zab(vec5,Q,vec4)*za(vec1,pol5)*zb(vec5,&
     & pol5)*dQ25
      topo4 = topo4 - 2.0_ki/(dotproduct(vec5,vec1))*zab(vec3,Q,vec2)*&
     & dotproduct(vec1,pol5)*za(vec5,vec1)*zb(vec5,vec4)*dQ25 - 1.0_ki/(&
     & dotproduct(vec5,vec1))*zab(vec3,Q,vec2)*za(vec1,pol5)*za(vec5,&
     & vec1)*zb(vec1,vec4)*zb(vec5,pol5)*dQ25 + 2.0_ki/(dotproduct(vec5,&
     & vec1))*zab(vec3,Q,vec5)*dotproduct(vec1,pol5)*za(vec5,vec1)*zb(&
     & vec2,vec4)*dQ25 - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*zab(vec5,Q,vec1)&
     & *za(vec1,vec3)*za(vec1,pol5)*zb(vec2,vec4)*zb(vec5,pol5)*dQ + 2.0_ki&
     & /(dotproduct(vec5,vec1))*zab(vec5,Q,vec4)*dotproduct(vec1,pol5)*&
     & za(vec1,vec3)*zb(vec2,vec5)*dQ25 - 1.0_ki/(dotproduct(vec5,vec1))*&
     & zab(vec5,Q,vec4)*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec5)*zb(&
     & vec5,pol5)*dQ25 + 1.0_ki/(dotproduct(vec5,vec1))*zab(vec5,Q,pol5)*za(&
     & vec1,vec3)*za(vec1,pol5)*zb(vec2,vec4)*zb(vec5,vec1)*dQ + 1.0_ki/2.0_ki&
     & /(dotproduct(vec5,vec1))*zab(pol5,Q,vec2)*za(vec1,vec3)*za(vec2,&
     & vec1)*zb(vec1,pol5)*zb(vec2,vec4)*dQ + 1.0_ki/2.0_ki/(dotproduct(vec5,&
     & vec1))*zab(pol5,Q,vec2)*za(vec2,vec1)*za(vec5,vec3)*zb(vec2,vec4&
     & )*zb(vec5,pol5)*dQ
      topo4 = topo4 - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*zab(pol5,Q,vec5)*&
     & za(vec1,vec3)*za(vec5,vec1)*zb(vec1,pol5)*zb(vec2,vec4)*dQ - 1.0_ki/&
     & 2.0_ki/(dotproduct(vec5,vec1))*zab(pol5,Q,vec5)*za(vec5,vec1)*za(&
     & vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*dQ + 4.0_ki/(dotproduct(vec5,&
     & vec1))*dotproduct(vec1,Q)*dotproduct(vec1,pol5)*za(vec1,vec3)*&
     & zb(vec2,vec4)*dQ + 4.0_ki/(dotproduct(vec5,vec1))*dotproduct(vec1,Q)&
     & *dotproduct(vec2,pol5)*za(vec1,vec3)*zb(vec2,vec4)*dQ + 4.0_ki/(&
     & dotproduct(vec5,vec1))*dotproduct(vec1,Q)*dotproduct(pol5,Q)*za(&
     & vec1,vec3)*zb(vec2,vec4)*dQ - 1.0_ki/(dotproduct(vec5,vec1))*&
     & dotproduct(vec1,Q)*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(&
     & vec5,pol5)*dQ + 4.0_ki/(dotproduct(vec5,vec1))*dotproduct(vec1,pol5)&
     & *dotproduct(vec2,vec1)*za(vec1,vec3)*zb(vec2,vec4)*dQ - 2.0_ki/(&
     & dotproduct(vec5,vec1))*dotproduct(vec1,pol5)*za(vec1,vec3)*zb(&
     & vec2,vec4)*dQ*dQ25 - 2.0_ki/(dotproduct(vec5,vec1))*dotproduct(vec1,&
     & pol5)*za(vec1,vec3)*zb(vec2,vec4)*mu2*dQ + 2.0_ki/(dotproduct(vec5,&
     & vec1))*dotproduct(vec1,pol5)*za(vec1,vec3)*zb(vec2,vec4)*Q2*dQ
      topo4 = topo4 - 1.0_ki/(dotproduct(vec5,vec1))*dotproduct(vec1,pol5)&
     & *za(vec2,vec1)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec2,vec5)*dQ + 4.0_ki&
     & /(dotproduct(vec5,vec1))*dotproduct(vec2,vec1)*dotproduct(vec2,&
     & pol5)*za(vec1,vec3)*zb(vec2,vec4)*dQ + 4.0_ki/(dotproduct(vec5,vec1)&
     & )*dotproduct(vec2,vec1)*dotproduct(pol5,Q)*za(vec1,vec3)*zb(vec2&
     & ,vec4)*dQ - 1.0_ki/(dotproduct(vec5,vec1))*dotproduct(vec2,vec1)*za(&
     & vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*dQ - 1.0_ki/(&
     & dotproduct(vec5,vec1))*dotproduct(vec2,vec5)*za(vec1,pol5)*za(&
     & vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*dQ - 2.0_ki/(dotproduct(vec5,&
     & vec1))*dotproduct(vec2,pol5)*za(vec2,vec1)*za(vec5,vec3)*zb(vec2&
     & ,vec4)*zb(vec2,vec5)*dQ - 1.0_ki/(dotproduct(vec5,vec1))*dotproduct(&
     & vec5,Q)*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*&
     & dQ - 2.0_ki/(dotproduct(vec5,vec1))*dotproduct(pol5,Q)*za(vec2,vec1)&
     & *za(vec5,vec3)*zb(vec2,vec4)*zb(vec2,vec5)*dQ + 1.0_ki/2.0_ki/(&
     & dotproduct(vec5,vec1))*za(vec1,vec3)*za(vec1,pol5)*za(vec2,vec5)&
     & *zb(vec2,vec1)*zb(vec2,vec4)*zb(vec5,pol5)*dQ
      topo4 = topo4 - 1.0_ki/(dotproduct(vec5,vec1))*za(vec1,vec3)*za(vec1&
     & ,pol5)*za(vec2,vec5)*zb(vec2,vec4)*zb(vec2,pol5)*zb(vec5,vec1)*&
     & dQ + 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*za(vec1,vec3)*za(vec2,vec1)*&
     & za(vec5,pol5)*zb(vec1,pol5)*zb(vec2,vec4)*zb(vec2,vec5)*dQ + 1.0_ki/&
     & 2.0_ki/(dotproduct(vec5,vec1))*za(vec1,vec3)*za(vec2,pol5)*za(vec5,&
     & vec1)*zb(vec1,pol5)*zb(vec2,vec4)*zb(vec2,vec5)*dQ + 1.0_ki/(&
     & dotproduct(vec5,vec1))*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)&
     & *zb(vec5,pol5)*dQ*dQ25 + 1.0_ki/(dotproduct(vec5,vec1))*za(vec1,pol5)&
     & *za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*mu2*dQ - 1.0_ki/(&
     & dotproduct(vec5,vec1))*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)&
     & *zb(vec5,pol5)*Q2*dQ + 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))*za(vec2,&
     & pol5)*za(vec5,vec1)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec2,vec5)*&
     & zb(vec5,pol5)*dQ - 1.0_ki/(dotproduct(vec5,vec1))/(dotproduct(vec5,&
     & vec1))*zab(vec1,Q,vec5)*dotproduct(vec1,pol5)*za(vec5,vec3)*zb(&
     & vec2,vec4)*dQ*dQ25 + 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))/(dotproduct(&
     & vec5,vec1))*zab(vec5,Q,vec1)*za(vec1,vec3)*za(vec1,pol5)*zb(vec2&
     & ,vec4)*zb(vec5,pol5)*dQ*dQ25
      topo4 = topo4 - 2.0_ki/(dotproduct(vec5,vec1))/(dotproduct(vec5,&
     & vec1))*dotproduct(vec1,Q)*dotproduct(vec1,pol5)*za(vec1,vec3)*&
     & zb(vec2,vec4)*dQ*dQ25 - 2.0_ki/(dotproduct(vec5,vec1))/(dotproduct(&
     & vec5,vec1))*dotproduct(vec1,pol5)*dotproduct(vec2,vec1)*za(vec1,&
     & vec3)*zb(vec2,vec4)*dQ*dQ25 + 1.0_ki/(dotproduct(vec5,vec1))/(&
     & dotproduct(vec5,vec1))*dotproduct(vec1,pol5)*za(vec2,vec1)*za(&
     & vec5,vec3)*zb(vec2,vec4)*zb(vec2,vec5)*dQ*dQ25 + 1.0_ki/(dotproduct(&
     & vec5,vec1))/(dotproduct(vec5,vec1))*dotproduct(vec2,vec5)*za(&
     & vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*dQ*dQ25 + &
     & 1.0_ki/(dotproduct(vec5,vec1))/(dotproduct(vec5,vec1))*dotproduct(&
     & vec5,Q)*za(vec1,pol5)*za(vec5,vec3)*zb(vec2,vec4)*zb(vec5,pol5)*&
     & dQ*dQ25 - 1.0_ki/2.0_ki/(dotproduct(vec5,vec1))/(dotproduct(vec5,vec1))*&
     & za(vec1,vec3)*za(vec1,pol5)*za(vec2,vec5)*zb(vec2,vec1)*zb(vec2,&
     & vec4)*zb(vec5,pol5)*dQ*dQ25

      topo4= topo4/topolo/2.0_ki

    end  function topo4
 end module mtopo4


