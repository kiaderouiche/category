module     mtopo5
   use precision, only: ki
   use kinematic
   use vars
   implicit none

contains

    function topo5(ncut, Q, mu2)
      integer, intent(in) :: ncut
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

      complex(ki), dimension(4) :: l1, l2, l3, l4, Q1, Q12, Q13, Q14
      complex(ki), dimension(4) :: e1, e2, e3, e4, e5
      complex(ki) :: topo5, temp1, im_
      real(ki), dimension(4) :: p1, p2, p3, p4, p5, p12, p23, p34, p45, p51 

      im_ = (0.0_ki, 1.0_ki)

      p1(:) = vec1(:)
      p2(:) = vec2(:)
      p3(:) = vec3(:)
      p4(:) = vec4(:)
      p5(:) = vec5(:)
      
      e1(:) = pol1(:)
      e2(:) = pol2(:)
      e3(:) = pol3(:)
      e4(:) = pol4(:)
      e5(:) = pol5(:)

      Q1(:)  = Q(:) + p1(:)
      Q12(:) = Q(:) + p1(:)+ p2(:)
      Q13(:) = Q(:) + p1(:)+ p2(:)+ p3(:)
      Q14(:) = Q(:) + p1(:)+ p2(:)+ p3(:) +p4(:)
      
      p12(:) = p1(:)+ p2(:)
      p23(:) = p2(:)+ p3(:)
      p34(:) = p3(:)+ p4(:)
      p45(:) = p4(:)+ p5(:)
      p51(:) = p5(:)+ p1(:)

!------------------!
!---- pentuple ----!
!------------------!

      if (ncut.eq.43210) then 


         topo5 = +2.0_ki*(0.0_ki , 1.0_ki)**6 *&
              &  zab(r1,Q,  p1)/za(r1,p1)*zab(r2,Q1 ,p2)/za(r2,p2)&
              & *zab(r3,Q12,p3)/za(r3,p3)*zab(r4,Q13,p4)/za(r4,p4)&
              & *zab(r5,Q14,p5)/za(r5,p5)


!------------------!
!---- quadruple ---!
!------------------!

      elseif (ncut.eq.3210) then
      
         l1(:) = Q1(:) 
         l2(:) = Q12(:) 
         l3(:) = Q13(:) 
         l4(:) = Q(:) 


!C4 1x2x3x45RATppppp:= 
!- 2*B(p4,p5)*IA(p1,X(p1))*IA(p2,X(p2))*IA(p3,X(p3))*IA(p4,p5)
!*AB(X(p1),l4,p1)*AB(X(p2),l1,p2)*AB(X(p3),l2,p3)*IAB(p4,l3,p4)*mu^2;

         temp1=(za(p1,r1)*za(p2,r2)*za(p3,r3)*za(p4,p5))

         topo5 =&
     & - 2.0_ki*zb(p4,p5)/temp1 &
     & *zab(r1,l4,p1)*zab(r2,l1,p2)*zab(r3,l2,p3)*mu2*1.0_ki/zab(p4,l3,p4)

 
      elseif (ncut.eq.4321) then
      
         l1(:) = Q12(:) 
         l2(:) = Q13(:) 
         l3(:) = Q14(:) 
         l4(:) = Q1(:) 


!C4 2x3x4x51RATppppp:= - 2*B(p1,p5)*IA(p1,p5)*IA(p2,X(p2))*IA(p3,X(p3))*
!IA(p4,X(p4))*AB(X(p2),l4,p2)*AB(X(p3),l1,p3)*AB(X(p4),l2,p4)*IAB(
!p5,l3,p5)*mu^2;

         temp1=(za(p1,p5)*za(p2,r2)*za(p3,r3)*za(p4,r4))

         topo5 =&
     & - 2.0_ki*zb(p1,p5)/temp1 &
     & *zab(r2,l4,p2)*zab(r3,l1,p3)*zab(r4,l2,p4)*mu2*1.0_ki/zab(p5,l3,p5)

      elseif (ncut.eq.4320) then
      
         l1(:) = Q13(:)
         l2(:) = Q14(:)
         l3(:) = Q(:)
         l4(:) = Q12(:)


!C4 3x4x5x12RATppppp:= - 2*B(p1,p2)*IA(p1,p2)*IA(p3,X(p3))*IA(p4,X(p4))*
!     IA(p5,X(p5))*AB(X(p3),l4,p3)*AB(X(p4),l1,p4)*AB(X(p5),l2,p5)*IAB(
!     p1,l3,p1)*mu^2;

         temp1=(za(p1,p2)*za(p3,r3)*za(p4,r4)*za(p5,r5))

         topo5 =&
     & - 2.0_ki*zb(p1,p2)/temp1 &
     & *zab(r3,l4,p3)*zab(r4,l1,p4)*zab(r5,l2,p5)*mu2*1.0_ki/zab(p1,l3,p1)


      elseif (ncut.eq.4310) then
      
         l1(:) = Q14(:)
         l2(:) = Q(:)
         l3(:) = Q1(:)
         l4(:) = Q13(:)


!C4 4x5x1x23RATppppp:= - 2*B(p2,p3)*IA(p1,X(p1))*IA(p2,p3)*IA(p4,X(p4))*
!     IA(p5,X(p5))*AB(X(p1),l2,p1)*AB(X(p4),l4,p4)*AB(X(p5),l1,p5)*IAB(
!     p2,l3,p2)*mu^2;

         temp1=(za(p1,r1)*za(p2,p3)*za(p4,r4)*za(p5,r5))

         topo5 =&
     & - 2.0_ki*zb(p2,p3)/temp1 &
     & *zab(r1,l2,p1)*zab(r4,l4,p4)*zab(r5,l1,p5)*mu2*1.0_ki/zab(p2,l3,p2)

      elseif (ncut.eq.4210) then
      
         l1(:) = Q(:)
         l2(:) = Q1(:)
         l3(:) = Q12(:)
         l4(:) = Q14(:)


!C4 5x1x2x34RATppppp:= - 2*B(p3,p4)*IA(p1,X(p1))*IA(p2,X(p2))*IA(p3,p4)*
!     IA(p5,X(p5))*AB(X(p1),l1,p1)*AB(X(p2),l2,p2)*AB(X(p5),l4,p5)*IAB(
!     p3,l3,p3)*mu^2;

         temp1=(za(p1,r1)*za(p2,r2)*za(p3,p4)*za(p5,r5))

         topo5 =&
     & - 2.0_ki*zb(p3,p4)/temp1 &
     & *zab(r1,l1,p1)*zab(r2,l2,p2)*zab(r5,l4,p5)*mu2*1.0_ki/zab(p3,l3,p3)


!------------------!
!----- triple -----!
!------------------!

      elseif (ncut.eq.310) then

         l1(:) = Q1(:)
         l2(:) = Q13(:)
         l3(:) = Q(:)

!C31x23x45RATppppp:=
!2/(za(r1,p1))/(za(p3,p2))/(za(p5,p4))/(zab(p2,l1,p2))/(zab(p4,l2,p4))
!*zb(p3,p2)*zb(p5,p4)*zab(r1,l3,p1)*I*mu**4;

         topo5 =2.0_ki/(za(r1,p1)*za(p3,p2)*za(p5,p4)*zab(p2,l1,p2)*zab(p4,l2,p4))&
              &*zb(p3,p2)*zb(p5,p4)*zab(r1,l3,p1)*im_*mu2**2*im_



      elseif (ncut.eq.210) then

         l1(:) = Q1(:)
         l2(:) = Q12(:)
         l3(:) = Q(:)

!C31x2x345RATppppp:=
!2/(za(r1,p1))/(za(r2,p2))/(za(p4,p3))/(za(p5,p4))/(zab(p3,l2,p3))/(zab(p5,l3,p5))
!*zab(r1,l3,p1)*zab(r2,l1,p2)*zbb(p3,l2,p4 + p3,p5)*I*mu**2;

         topo5 =2.0_ki/(za(r1,p1)*za(r2,p2)*za(p4,p3)*za(p5,p4)*zab(p3,l2,p3)*zab(p5,l3,p5))&
              &*zab(r1,l3,p1)*zab(r2,l1,p2)*zbb(p3,l2,p34,p5)*im_*mu2*im_*(-1.0_ki)



      elseif (ncut.eq.421) then

         l1(:) = Q12(:)
         l2(:) = Q14(:)
         l3(:) = Q1(:)

!C32x34x51RATppppp:=
!2/(za(p5,p1))/(za(r2,p2))/(za(p4,p3))/(zab(p3,l1,p3))/(zab(p5,l2,p5))
!*zb(p4,p3)*zb(p5,p1)*zab(r2,l3,p2)*I*mu**4

         topo5 =2.0_ki/(za(p5,p1)*za(r2,p2)*za(p4,p3)*zab(p3,l1,p3)*zab(p5,l2,p5))&
              &*zb(p4,p3)*zb(p5,p1)*zab(r2,l3,p2)*im_*mu2**2*im_



      elseif (ncut.eq.321) then

         l1(:) = Q12(:)
         l2(:) = Q13(:)
         l3(:) = Q1(:)

!C32x3x451RATppppp:= 
!- 2/(za(p5,p1))/(za(r2,p2))/(za(r3,p3))/(za(p5,p4))/(zab(p1,l3,p1))/(zab(p4,l2,p4))
!*zab(r2,l3,p2)*zab(r3,l1,p3)*zbb(p4,l2,p5 + p4,p1)*I*mu**2;

         topo5 = -2.0_ki/(za(p5,p1))/(za(r2,p2)*za(r3,p3)*za(p5,p4)*zab(p1,l3,p1)*zab(p4,l2,p4))&
              &*zab(r2,l3,p2)*zab(r3,l1,p3)*zbb(p4,l2,p45,p1)*im_*mu2*im_*(-1.0_ki)


      elseif (ncut.eq.320) then

         l1(:) = Q13(:)
         l2(:) = Q(:)
         l3(:) = Q12(:)

!C33x45x12RATppppp:=
!2/(za(p2,p1))/(za(r3,p3))/(za(p5,p4))/(zab(p1,l2,p1))/(zab(p4,l1,p4))
!*zb(p2,p1)*zb(p5,p4)*zab(r3,l3,p3)*I*mu**4;

         topo5 = 2.0_ki/(za(p2,p1)*za(r3,p3)*za(p5,p4)*zab(p1,l2,p1)*zab(p4,l1,p4))&
              &*zb(p2,p1)*zb(p5,p4)*zab(r3,l3,p3)*im_*mu2**2*im_


      elseif (ncut.eq.432) then

         l1(:) = Q13(:)
         l2(:) = Q14(:)
         l3(:) = Q12(:)

!C33x4x512RATppppp:= 
!- 2/(za(p2,p1))/(za(p5,p1))/(za(r3,p3))/(za(r4,p4))/(zab(p2,l3,p2))/(zab(p5,l2,p5))
!*zab(r3,l3,p3)*zab(r4,l1,p4)*zbb(p5,l2,p5 + p1,p2)*I*mu**2;

         topo5 = - 2.0_ki/(za(p2,p1)*za(p5,p1)*za(r3,p3)*za(r4,p4)*zab(p2,l3,p2)*zab(p5,l2,p5))&
              &*zab(r3,l3,p3)*zab(r4,l1,p4)*zbb(p5,l2,p51,p2)*im_*mu2*im_*(-1.0_ki)


      elseif (ncut.eq.431) then

         l1(:) = Q14(:)
         l2(:) = Q1(:)
         l3(:) = Q13(:)

!C34x51x23RATppppp:=
!2/(za(p5,p1))/(za(p3,p2))/(za(r4,p4))/(zab(p2,l2,p2))/(zab(p5,l1,p5))
!*zb(p3,p2)*zb(p5,p1)*zab(r4,l3,p4)*I*mu**4;

         topo5 = 2.0_ki/(za(p5,p1)*za(p3,p2)*za(r4,p4)*zab(p2,l2,p2)*zab(p5,l1,p5))&
              &*zb(p3,p2)*zb(p5,p1)*zab(r4,l3,p4)*im_*mu2**2*im_


      elseif (ncut.eq.430) then

         l1(:) = Q14(:)
         l2(:) = Q(:)
         l3(:) = Q13(:)

!C34x5x123RATppppp:=
!2/(za(p2,p1))/(za(p3,p2))/(za(r4,p4))/(za(r5,p5))/(zab(p1,l2,p1))/(zab(p3,l3,p3))
!*zab(r4,l3,p4)*zab(r5,l1,p5)*zbb(p1,l2,p2 + p1,p3)*I*mu**2;

         topo5 = 2.0_ki/(za(p2,p1)*za(p3,p2)*za(r4,p4)*za(r5,p5)*zab(p1,l2,p1)*zab(p3,l3,p3))&
              &*zab(r4,l3,p4)*zab(r5,l1,p5)*zbb(p1,l2,p12,p3)*im_*mu2*im_*(-1.0_ki)


      elseif (ncut.eq.420) then

         l1(:) = Q(:)
         l2(:) = Q12(:)
         l3(:) = Q14(:)

!C35x12x34RATppppp:=
!2/(za(p2,p1))/(za(p4,p3))/(za(r5,p5))/(zab(p1,l1,p1))/(zab(p3,l2,p3))
!*zb(p2,p1)*zb(p4,p3)*zab(r5,l3,p5)*I*mu**4;

         topo5 = 2.0_ki/(za(p2,p1)*za(p4,p3)*za(r5,p5)*zab(p1,l1,p1)*zab(p3,l2,p3))&
              &*zb(p2,p1)*zb(p4,p3)*zab(r5,l3,p5)*im_*mu2**2*im_

      elseif (ncut.eq.410) then

         l1(:) = Q(:)
         l2(:) = Q1(:)
         l3(:) = Q14(:)

!C35x1x234RATppppp:=
!2/(za(r1,p1))/(za(p3,p2))/(za(p4,p3))/(za(r5,p5))/(zab(p2,l2,p2))/(zab(p4,l3,p4))
!*zab(r1,l1,p1)*zab(r5,l3,p5)*zbb(p2,l2,p3 + p2,p4)*I*mu**2;


         topo5 = 2.0_ki/(za(r1,p1)*za(p3,p2)*za(p4,p3)*za(r5,p5)*zab(p2,l2,p2)*zab(p4,l3,p4))&
              &*zab(r1,l1,p1)*zab(r5,l3,p5)*zbb(p2,l2,p23,p4)*im_*mu2*im_*(-1.0_ki)



!------------------!
!----- double -----!
!------------------!


      elseif (ncut.eq.20) then

         l2(:) = Q12(:)
         l1(:) = Q(:)

!C212x345RATppppp:=
!2/(za(p2,p1))/(za(p4,p3))/(za(p5,p4))/(zab(p1,l1,p1))/(zab(p3,l2,p3))/(zab(p5,l1,p5))
!*zb(p2,p1)*zbb(p3,l2,p4 + p3,p5)*mu^4;

         topo5 = &
              &2.0_ki/(za(p2,p1)*za(p4,p3)*za(p5,p4)*zab(p1,l1,p1)*zab(p3,l2,p3)*zab(p5,l1,p5))&
              &*zb(p2,p1)*zbb(p3,l2,p34,p5)*mu2**2*(-1.0_ki) 


      elseif (ncut.eq.31) then

         l2(:) = Q13(:)
         l1(:) = Q1(:)

!C223x451RATppppp:= 
!- 2/(za(p5,p1))/(za(p3,p2))/(za(p5,p4))/(zab(p1,l1,p1))/(zab(p2,l1,p2))/(zab(p4,l2,p4))
!*zb(p3,p2)*zbb(p4,l2,p5 + p4,p1)*mu^4;

         topo5 = &
              &- 2.0_ki/(za(p5,p1)*za(p3,p2)*za(p5,p4)*zab(p1,l1,p1)*zab(p2,l1,p2)*zab(p4,l2,p4))&
              &*zb(p3,p2)*zbb(p4,l2,p45,p1)*mu2**2*(-1.0_ki) 


      elseif (ncut.eq.42) then

         l2(:) = Q14(:)
         l1(:) = Q12(:)

!C234x512RATppppp:= 
!- 2/(za(p2,p1))/(za(p5,p1))/(za(p4,p3))/(zab(p2,l1,p2))/(zab(p3,l1,p3))/(zab(p5,l2,p5))
!*zb(p4,p3)*zbb(p5,l2,p5 + p1,p2)*mu^4;

         topo5 = &
              &- 2.0_ki/(za(p2,p1)*za(p5,p1)*za(p4,p3)*zab(p2,l1,p2)*zab(p3,l1,p3)*zab(p5,l2,p5))&
              &*zb(p4,p3)*zbb(p5,l2,p51,p2)*mu2**2*(-1.0_ki) 

      elseif (ncut.eq.30) then

         l2(:) = Q(:)
         l1(:) = Q13(:)

!C245x123RATppppp:=
!2/(za(p2,p1))/(za(p3,p2))/(za(p5,p4))/(zab(p1,l2,p1))/(zab(p3,l1,p3))/(zab(p4,l1,p4))
!*zb(p5,p4)*zbb(p1,l2,p2 + p1,p3)*mu^4;

         topo5 = &
              &2.0_ki/(za(p2,p1)*za(p3,p2)*za(p5,p4)*zab(p1,l2,p1)*zab(p3,l1,p3)*zab(p4,l1,p4))&
              &*zb(p5,p4)*zbb(p1,l2,p12,p3)*mu2**2*(-1.0_ki) 

      elseif (ncut.eq.41) then

         l2(:) = Q1(:)
         l1(:) = Q14(:)

!C251x234RATppppp:=
!2/(za(p5,p1))/(za(p3,p2))/(za(p4,p3))/(zab(p2,l2,p2))/(zab(p4,l1,p4))/(zab(p5,l1,p5))
!*zb(p5,p1)*zbb(p2,l2,p3 + p2,p4)*mu^4;

         topo5 = &
              &2.0_ki/(za(p5,p1)*za(p3,p2)*za(p4,p3)*zab(p2,l2,p2)*zab(p4,l1,p4)*zab(p5,l1,p5))&
              &*zb(p5,p1)*zbb(p2,l2,p23,p4)*mu2**2*(-1.0_ki) 

      else

         topo5 = 0.0_ki
         
      endif

   end  function topo5
end module mtopo5
