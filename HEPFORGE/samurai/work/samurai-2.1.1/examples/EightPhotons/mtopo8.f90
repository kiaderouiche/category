module     mtopo8
   use precision, only: ki
   use vars
   use kinematic, only: zab
   implicit none

contains

      function topo8(ncut,Q, mu2)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: topo8
      complex(ki) :: zab12, zab21
      complex(ki) :: zab23, zab32
      complex(ki) :: zab34, zab43
      complex(ki) :: zab45, zab54
      complex(ki) :: zab56, zab65
      complex(ki) :: zab67, zab76
      complex(ki) :: zab78, zab87
      complex(ki) :: zab81, zab18
      complex(ki) :: im, cone
      complex(ki), dimension(4) :: Q1, Q12, Q13, Q14, Q15, Q16, Q17
      integer, intent(in) :: ncut

      Q1(:)  = Q(:) + vec1(:)
      Q12(:) = Q(:) + vec1(:) + vec2(:)
      Q13(:) = Q(:) + vec1(:) + vec2(:) + vec3(:)
      Q14(:) = Q(:) + vec1(:) + vec2(:) + vec3(:) + vec4(:)
      Q15(:) = Q(:) + vec1(:) + vec2(:) + vec3(:) + vec4(:) + vec5(:)
      Q16(:) = Q(:) + vec1(:) + vec2(:) + vec3(:) + vec4(:) + vec5(:) + vec6(:)
      Q17(:) = Q(:) + vec1(:) + vec2(:) + vec3(:) + vec4(:) + vec5(:) + vec6(:) + vec7(:)

      zab12=zab(pol1,Q1 ,pol2)
      zab23=zab(pol2,Q12,pol3)
      zab34=zab(pol3,Q13,pol4)
      zab45=zab(pol4,Q14,pol5)
      zab56=zab(pol5,Q15,pol6)
      zab67=zab(pol6,Q16,pol7)
      zab78=zab(pol7,Q17,pol8)
      zab81=zab(pol8,Q  ,pol1)

      zab21=zab(pol2,Q1 ,pol1)
      zab32=zab(pol3,Q12,pol2)
      zab43=zab(pol4,Q13,pol3)
      zab54=zab(pol5,Q14,pol4)
      zab65=zab(pol6,Q15,pol5)
      zab76=zab(pol7,Q16,pol6)
      zab87=zab(pol8,Q17,pol7)
      zab18=zab(pol1,Q  ,pol8)

      topo8=-zab12*zab23*zab34*zab45*zab56*zab67*zab78*zab81&
     &      -zab87*zab76*zab65*zab54*zab43*zab32*zab21*zab18


    end  function topo8
 end module mtopo8

