module     mtopo6
   use precision, only: ki
   use vars
   implicit none

contains

    function topo6(ncut, Q, mu2)
      integer, intent(in) :: ncut
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

      complex(ki), dimension(4) :: Q1, Q12, Q13, Q14, Q15
      complex(ki), dimension(4) :: L1,  L2,  L3,  L4, L5
      complex(ki), dimension(4) :: e1,  e2,  e3,  e4, e5, e6
      complex(ki) :: topo6, im_

      real(ki), dimension(4) :: p1,p2,p3,p4,p5,p6 , p12,p23,p34,p45,p51 

      im_ = (0.0_ki, 1.0_ki)

      p1(:) = vec1(:)
      p2(:) = vec2(:)
      p3(:) = vec3(:)
      p4(:) = vec4(:)
      p5(:) = vec5(:)
      p6(:) = vec6(:)
      
      e1(:) = pol1(:)
      e2(:) = pol2(:)
      e3(:) = pol3(:)
      e4(:) = pol4(:)
      e5(:) = pol5(:)
      e6(:) = pol6(:)


         Q1(:)  = Q(:) + p1(:)
         Q12(:) = Q(:) + p1(:)+ p2(:)
         Q13(:) = Q(:) + p1(:)+ p2(:)+ p3(:)
         Q14(:) = Q(:) + p1(:)+ p2(:)+ p3(:) +p4(:)
         Q15(:) = Q(:) + p1(:)+ p2(:)+ p3(:) +p4(:) +p5(:)
      
         p12(:) = p1(:)+ p2(:)
         p23(:) = p2(:)+ p3(:)
         p34(:) = p3(:)+ p4(:)
         p45(:) = p4(:)+ p5(:)
         p51(:) = p5(:)+ p1(:)

!------------------!
!---- quintuple ---!
!------------------!

      if (ncut.eq.43210) then 
         topo6 = penta(Q,Q1,Q12,Q13,Q14, mu2, p5,p6,p1,p2,p3,p4,&
              &                               r5,r6,r1,r2,r3,r4)


      elseif (ncut.eq.53210) then
         topo6 = penta(Q15,Q,Q1,Q12,Q13, mu2, p4,p5,p6,p1,p2,p3,&
              &                               r4,r5,r6,r1,r2,r3)


      elseif (ncut.eq.54210) then
         topo6 = penta(Q14,Q15,Q,Q1,Q12, mu2, p3,p4,p5,p6,p1,p2,&
              &                               r3,r4,r5,r6,r1,r2)


      elseif (ncut.eq.54310) then
         topo6 = penta(Q13,Q14,Q15,Q,Q1, mu2, p2,p3,p4,p5,p6,p1,&
              &                               r2,r3,r4,r5,r6,r1)


      elseif (ncut.eq.54320) then
         topo6 = penta(Q12,Q13,Q14,Q15,Q, mu2, p1,p2,p3,p4,p5,p6,&
              &                                r1,r2,r3,r4,r5,r6)


      elseif (ncut.eq.54321) then
         topo6 = penta(Q1,Q12,Q13,Q14,Q15, mu2, p6,p1,p2,p3,p4,p5,&
              &                                 r6,r1,r2,r3,r4,r5)


!------------------!
!---- quadruple ---!
!------------------!

      elseif (ncut.eq.3210) then
          topo6 = box1(Q,Q1,Q12,Q13, mu2, p4,p5,p6,p1,p2,p3,&
               &                          r4,r5,r6,r1,r2,r3)


      elseif (ncut.eq.4321) then
          topo6 = box1(Q1,Q12,Q13,Q14, mu2, p5,p6,p1,p2,p3,p4,&
               &                            r5,r6,r1,r2,r3,r4)


      elseif (ncut.eq.5432) then
          topo6 = box1(Q12,Q13,Q14,Q15, mu2, p6,p1,p2,p3,p4,p5,&
               &                             r6,r1,r2,r3,r4,r5)


      elseif (ncut.eq.5430) then
          topo6 = box1(Q13,Q14,Q15,Q, mu2, p1,p2,p3,p4,p5,p6,&
               &                           r1,r2,r3,r4,r5,r6)


      elseif (ncut.eq.5410) then
          topo6 = box1(Q14,Q15,Q,Q1, mu2, p2,p3,p4,p5,p6,p1,&
               &                          r2,r3,r4,r5,r6,r1)


      elseif (ncut.eq.5210) then
          topo6 = box1(Q15,Q,Q1,Q12, mu2, p3,p4,p5,p6,p1,p2,&
               &                          r3,r4,r5,r6,r1,r2)




      elseif (ncut.eq.5420) then
          topo6 = box2h(Q12,Q14,Q15,Q, mu2, p1,p2,p3,p4,p5,p6,&
               &                            r1,r2,r3,r4,r5,r6)


      elseif (ncut.eq.5310) then
          topo6 = box2h(Q13,Q15,Q,Q1, mu2, p2,p3,p4,p5,p6,p1,&
               &                           r2,r3,r4,r5,r6,r1)


      elseif (ncut.eq.4210) then
          topo6 = box2h(Q14,Q,Q1,Q12, mu2, p3,p4,p5,p6,p1,p2,&
               &                           r3,r4,r5,r6,r1,r2)


      elseif (ncut.eq.5321) then
          topo6 = box2h(Q15,Q1,Q12,Q13, mu2, p4,p5,p6,p1,p2,p3,&
               &                             r4,r5,r6,r1,r2,r3)


      elseif (ncut.eq.4320) then
          topo6 = box2h(Q,Q12,Q13,Q14, mu2, p5,p6,p1,p2,p3,p4,&
               &                            r5,r6,r1,r2,r3,r4)


      elseif (ncut.eq.5431) then
          topo6 = box2h(Q1,Q13,Q14,Q15, mu2, p6,p1,p2,p3,p4,p5,&
               &                             r6,r1,r2,r3,r4,r5)



      elseif (ncut.eq.5320) then
          topo6 = box2e(Q12,Q13,Q15,Q, mu2, p1,p2,p3,p4,p5,p6,&
               &                            r1,r2,r3,r4,r5,r6)


      elseif (ncut.eq.4310) then
          topo6 = box2e(Q13,Q14,Q,Q1, mu2, p2,p3,p4,p5,p6,p1,&
               &                           r2,r3,r4,r5,r6,r1)


      elseif (ncut.eq.5421) then
          topo6 = box2e(Q14,Q15,Q1,Q12, mu2, p3,p4,p5,p6,p1,p2,&
               &                             r3,r4,r5,r6,r1,r2)

      else

         topo6 = 0.0_ki
         
      endif

   end  function topo6
end module mtopo6
