module     uussbb_d45h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d45h1l1.f9
   ! 0
   ! generator: haggies (1.1)
   use precision, only: ki
   use uussbb_config
   use uussbb_model
   use uussbb_kinematics
   use uussbb_util, only: cond
   use uussbb_color
   use uussbb_abbrevh1l1
   implicit none
   
   private :: brack_1
   private :: brack_2
   private :: brack_3
   private :: brack_4
   private :: brack_5

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      real(ki) :: brack
      
      brack = (1.0_ki)/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c1/NC-c2))
   end  function brack_2
   pure function brack_3(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      complex(ki) :: t4
      complex(ki) :: t5
      complex(ki) :: t6
      complex(ki) :: t7
      complex(ki) :: t8
      complex(ki) :: t9
      complex(ki) :: t10
      complex(ki) :: t11
      complex(ki) :: t12
      complex(ki) :: t13
      
      t1 = dotproduct(Q, k1)
      t2 = dotproduct(Q, k4)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, spvak5k3)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak1k3)
      t7 = dotproduct(Q, spvak6k3)
      t8 = dotproduct(Q, spvak1k2)
      t9 = dotproduct(Q, Q)
      t10 = dotproduct(Q, spvak4k5)
      t11 = dotproduct(Q, spvak4k6)
      t12 = dotproduct(Q, spvak4k3)
      t13 = t4*abb45n25
      brack = (((4.0_ki)*(t2*abb45n22+t3*abb45n6+t2*t4*abb45n25+t3*t5*abb45n27-(&
      &t3*t6*abb45n9+t3*t5*t6+t1*t4*abb45n25+t1*abb45n22))+(2.0_ki)*(abb45n16+ab&
      &b45n4+t11*abb45n33+t12*abb45n36+t4*abb45n15+t5*abb45n21+t6*abb45n8+t7*abb&
      &45n1+t11*t4*abb45n31+t11*t7*abb45n37+t12*t4*abb45n10+t5*t6*abb45n46-(t5*t&
      &6*abb45n45+t4*t9*abb45n25+t4*t5*abb45n3+t11*t9*abb45n29+t11*t8*abb45n14+t&
      &11*t5*abb45n38+t11*t4*abb45n41+t10*t4*abb45n37+abb45n13*es61+t9*abb45n23+&
      &t8*abb45n11+t6*abb45n7+t5*abb45n26+t5*abb45n2+t11*abb45n39+t10*abb45n32+a&
      &bb45n5))+(4.0_ki)*(-(abb45n22+t13))*es56+(4.0_ki)*(t13+abb45n13+abb45n24)&
      &*es234+(2.0_ki)*(t13+abb45n12+abb45n28+abb45n30+abb45n35+t11*abb45n29-((2&
      &.0_ki)*t3*abb45n20+abb45n40+abb45n34+abb45n18))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak4k2)
      brack = (((4.0_ki)*(t1*t2*t3+t1*t2*abb45n44)+(2.0_ki)*(t1*abb45n42+t1*abb4&
      &5n7+t1*t3*abb45n45-(t1*t3*abb45n46+t1*abb45n8+t1*abb45n43))+(2.0_ki)*(abb&
      &45n17+(2.0_ki)*t2*abb45n20-abb45n19)*mu2)*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram45(Q, mu2, epspow, res)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer, intent(in) :: epspow
      complex(ki), dimension(1:numcs), intent(inout) :: res

      complex(ki), dimension(1:numcs) :: acc
      complex(ki) :: prefactor
      complex(ki), dimension(numcs) :: cf1
      ! res is set to zero in the calling routines,
      ! therefore we sum to whatever is there already.
      
      acc = 0.0_ki
      prefactor = brack_1(Q, mu2)
      cf1 = brack_2(Q, mu2)
      acc(:) = acc(:) + cf1(:) * ((cond(epspow.eq.0,brack_3,Q,mu2)+cond(epspow.e&
      &q.1,brack_4,Q,mu2)))
      ! d45: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram45
end module uussbb_d45h1l1
