module     mtopo6
   use precision, only: ki
   use vars
   use kinematic, only: zab
   implicit none

contains

      function topo6(ncut,Q, mu2)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: topo6
      complex(ki) :: zab12, zab21
      complex(ki) :: zab23, zab32
      complex(ki) :: zab34, zab43
      complex(ki) :: zab45, zab54
      complex(ki) :: zab56, zab65
      complex(ki) :: zab16, zab61
      complex(ki) :: im, cone
      complex(ki), dimension(4) :: Q1, Q12, Q13, Q14, Q15
      integer, intent(in) :: ncut

      Q1(:)  = Q(:)   + vec1(:)
      Q12(:) = Q1(:)  + vec2(:)
      Q13(:) = Q12(:) + vec3(:)
      Q14(:) = Q13(:) + vec4(:)
      Q15(:) = Q14(:) + vec5(:)

      zab12=zab(pol1,Q1 ,pol2)
      zab23=zab(pol2,Q12,pol3)
      zab34=zab(pol3,Q13,pol4)
      zab45=zab(pol4,Q14,pol5)
      zab56=zab(pol5,Q15,pol6)
      zab61=zab(pol6,Q  ,pol1)

      zab21=zab(pol2,Q1 ,pol1)
      zab32=zab(pol3,Q12,pol2)
      zab43=zab(pol4,Q13,pol3)
      zab54=zab(pol5,Q14,pol4)
      zab65=zab(pol6,Q15,pol5)
      zab16=zab(pol1,Q  ,pol6)

      topo6=-zab12*zab23*zab34*zab45*zab56*zab61&
     &      -zab65*zab54*zab43*zab32*zab21*zab16


    end  function topo6
 end module mtopo6

