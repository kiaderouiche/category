module     uussbb_d19h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d19h0l1.f9
   ! 0
   ! generator: haggies (1.1)
   use precision, only: ki
   use uussbb_config
   use uussbb_model
   use uussbb_kinematics
   use uussbb_util, only: cond
   use uussbb_color
   use uussbb_abbrevh0l1
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
      complex(ki) :: brack
      
      brack = (-1.0_ki)*abb19n1/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*NC*(c5-c3))
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
      complex(ki) :: t14
      complex(ki) :: t15
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak6k5)
      t4 = dotproduct(Q, k1)
      t5 = dotproduct(Q, k2)
      t6 = dotproduct(Q, Q)
      t7 = dotproduct(Q, k3)
      t8 = dotproduct(Q, k4)
      t9 = dotproduct(Q, k5)
      t10 = dotproduct(Q, k6)
      t11 = t2*abb19n36
      t12 = t1*abb19n46
      t13 = t3*abb19n19
      t14 = (7.0_ki)*t11
      t15 = (7.0_ki/2.0_ki)*t11
      brack = (((5.0_ki/2.0_ki)*(-(abb19n6+abb19n22))+(3.0_ki/2.0_ki)*(abb19n27+&
      &abb19n9)+(9.0_ki/2.0_ki)*((2.0_ki)*t1*t2*t3-t1*t2*abb19n49)+(6.0_ki)*(t4*&
      &abb19n3+t5*abb19n3+t1*abb19n46*es45)+(5.0_ki)*(t4*abb19n11+t4*abb19n30+t5&
      &*abb19n11+t5*abb19n30+t6*abb19n10)+(3.0_ki)*(t1*abb19n47+t2*abb19n14+t2*a&
      &bb19n2+t6*abb19n20+t1*t4*abb19n46+t1*t5*abb19n46+t2*t4*abb19n36+t2*t5*abb&
      &19n36-t6*abb19n17)+(2.0_ki)*(t7*abb19n16+t7*abb19n18+t7*abb19n25+t7*abb19&
      &n40+t8*abb19n39+t1*t6*abb19n46+t2*t6*abb19n36+t3*t4*abb19n19+t3*t5*abb19n&
      &19+t3*t6*abb19n19-(t3*t8*abb19n19+t3*t7*abb19n19+(2.0_ki)*t7*abb19n3+t7*a&
      &bb19n15+t7*abb19n13))+(1.0_ki/2.0_ki)*abb19n12+(1.0_ki/2.0_ki)*abb19n23+(&
      &1.0_ki/2.0_ki)*abb19n33+(1.0_ki/2.0_ki)*abb19n7+(-((5.0_ki)*abb19n28+t14)&
      &)*es61+((5.0_ki/2.0_ki)*(t11+(2.0_ki)*t12)+abb19n38-(6.0_ki)*t13)*es56+(t&
      &15+(5.0_ki/2.0_ki)*abb19n28-(3.0_ki)*t12)*es345+((13.0_ki/2.0_ki)*t13+t15&
      &+(5.0_ki/2.0_ki)*abb19n29)*es234+((5.0_ki)*t12-(abb19n37+t14+(3.0_ki/2.0_&
      &ki)*t13))*es34+((3.0_ki)*(abb19n17-abb19n20)+(2.0_ki)*(-(t13+t12+t11))+ab&
      &b19n26+abb19n41-(abb19n35+(5.0_ki)*abb19n10))*mu2+t2*abb19n4+(1.0_ki/2.0_&
      &ki)*t3*abb19n24+(1.0_ki/2.0_ki)*t3*abb19n34+(1.0_ki/2.0_ki)*t3*abb19n8+t6&
      &*abb19n35+(1.0_ki/2.0_ki)*t1*t3*abb19n48+t10*t2*abb19n36+t2*t9*abb19n36-(&
      &t2*t8*abb19n36+t2*t7*abb19n36+(1.0_ki/2.0_ki)*t2*t3*abb19n43+t1*t9*abb19n&
      &46+t1*t8*abb19n46+t1*t7*abb19n46+t1*t10*abb19n46+t9*abb19n31+t7*abb19n32+&
      &t7*abb19n11+t6*abb19n41+t6*abb19n26+(13.0_ki/2.0_ki)*t3*abb19n5+t3*abb19n&
      &21+(1.0_ki/2.0_ki)*t2*abb19n42+t10*abb19n31))*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak4k3)
      brack = (((4.0_ki)*(t1*abb19n44+t1*t3*abb19n49)+(8.0_ki)*(-(t1*t2*abb19n45&
      &+t1*t2*t3)))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram19(Q, mu2, epspow, res)
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
      ! d19: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram19
end module uussbb_d19h0l1
