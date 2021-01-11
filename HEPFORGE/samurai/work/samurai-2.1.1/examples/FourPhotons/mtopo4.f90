module     mtopo4
   use precision, only: ki
   use kinematic
   use vars
   implicit none

   integer :: count4
contains

  function topo4(ncut,Q, mu2)
      implicit none
      integer, intent(in) :: ncut
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

      real(ki) :: nu2
      complex(ki) :: topo4
      complex(ki) :: zab12, zab21
      complex(ki) :: zab13, zab31
      complex(ki) :: zab14, zab41
      complex(ki) :: zab23, zab32
      complex(ki) :: zab24, zab42
      complex(ki) :: zab34, zab43,temp
      complex(ki), dimension(4) :: Q2, Q23, Q234

      count4 = count4 + 1

      Q2(:) = Q(:) + vec2(:)
      Q23(:) = Q(:) + vec2(:) + vec3(:)
      Q234(:) = Q(:) + vec2(:) + vec3(:) + vec4(:)

      zab12=zab(pol1,Q,pol2)
      zab14=zab(pol1,Q234,pol4)
      zab23=zab(pol2,Q2,pol3)
      zab34=zab(pol3,Q23,pol4)

      zab21=zab(pol2,Q,pol1)
      zab41=zab(pol4,Q234,pol1)
      zab32=zab(pol3,Q2,pol2)
      zab43=zab(pol4,Q23,pol3)

      topo4 = - ( mass**4 -mass**2*mu2 + mu2**2 )*(&
     &+za(pol2,pol3)*zb(pol3,pol4)*za(pol4,pol1)*zb(pol1,pol2)&
     &+zb(pol2,pol3)*za(pol3,pol4)*zb(pol4,pol1)*za(pol1,pol2))

      topo4= topo4 - ( mass**2 -  mu2 ) *(&

     & +za(pol2,pol3)*zb(pol3,pol4)*zab(pol4,Q234,pol1)*zab(pol1,Q,pol2)&
     & +zb(pol2,pol3)*za(pol3,pol4)*zba(pol4,Q234,pol1)*zba(pol1,Q,pol2)&

     & +za(pol2,pol3)*zba(pol3,Q23,pol4)*zb(pol4,pol1)*zab(pol1,Q,pol2)&
     & +zb(pol2,pol3)*zab(pol3,Q23,pol4)*za(pol4,pol1)*zba(pol1,Q,pol2)&

     & +za(pol2,pol3)*zba(pol3,Q23,pol4)*zba(pol4,Q234,pol1)*zb(pol1,pol2)&
     & +zb(pol2,pol3)*zab(pol3,Q23,pol4)*zab(pol4,Q234,pol1)*za(pol1,pol2)&

     & +zab(pol2,Q2,pol3)*za(pol3,pol4)*zb(pol4,pol1)*zab(pol1,Q,pol2)&
     & +zba(pol2,Q2,pol3)*zb(pol3,pol4)*za(pol4,pol1)*zba(pol1,Q,pol2)&

     & +zab(pol2,Q2,pol3)*za(pol3,pol4)*zba(pol4,Q234,pol1)*zb(pol1,pol2)&
     & +zba(pol2,Q2,pol3)*zb(pol3,pol4)*zab(pol4,Q234,pol1)*za(pol1,pol2)&

     & +zab(pol2,Q2,pol3)*zab(pol3,Q23,pol4)*za(pol4,pol1)*zb(pol1,pol2)&
     & +zba(pol2,Q2,pol3)*zba(pol3,Q23,pol4)*zb(pol4,pol1)*za(pol1,pol2))


      topo4= topo4 - zab21*zab14*zab32*zab43 - zab12*zab41*zab23*zab34


    end  function topo4
 end module mtopo4


  
