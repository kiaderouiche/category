module     uussbb_d57h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d57h2l1.f9
   ! 0
   ! generator: haggies (1.1)
   use precision, only: ki
   use uussbb_config
   use uussbb_model
   use uussbb_kinematics
   use uussbb_util, only: cond
   use uussbb_color
   use uussbb_abbrevh2l1
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
      
      brack = (-1.0_ki)*i_/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c6-(NC*c3+c2)))
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
      complex(ki) :: t16
      complex(ki) :: t17
      complex(ki) :: t18
      complex(ki) :: t19
      complex(ki) :: t20
      complex(ki) :: t21
      complex(ki) :: t22
      complex(ki) :: t23
      complex(ki) :: t24
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, Q)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, k3)
      t5 = dotproduct(Q, spvak3k4)
      t6 = dotproduct(Q, k1)
      t7 = dotproduct(Q, k5)
      t8 = dotproduct(Q, k6)
      t9 = dotproduct(Q, k4)
      t10 = dotproduct(Q, spvak5k2)
      t11 = dotproduct(Q, k2)
      t12 = dotproduct(Q, spvak5k3)
      t13 = dotproduct(Q, spvak5k4)
      t14 = dotproduct(Q, spvak3k2)
      t15 = dotproduct(Q, spvak3k6)
      t16 = dotproduct(Q, spvak4k6)
      t17 = dotproduct(Q, spvak1k4)
      t18 = t5*abb57n57
      t19 = t15*abb57n54
      t20 = t13*abb57n32
      t21 = t1*abb57n69
      t22 = (3.0_ki)*abb57n30
      t23 = dotproduct(Q, spvak1k6)
      t24 = dotproduct(Q, spvak3k5)
      brack = ((3.0_ki)*(t1*abb57n18+t2*abb57n23+t2*abb57n38+t2*t3*abb57n31+t2*t&
      &5*abb57n57+(2.0_ki)*t3*t4*abb57n31+t3*t5*abb57n39-t2*abb57n30)+(4.0_ki)*(&
      &abb57n19+t1*abb57n43+t2*abb57n17+t4*abb57n28+t5*abb57n33+t6*abb57n17+t6*a&
      &bb57n46+t7*abb57n17+t7*abb57n48+t1*t3*t5+t1*t3*abb57n66+t5*t6*abb57n57+t5&
      &*t7*abb57n57-(t5*t8*abb57n57+(2.0_ki)*t3*t9*abb57n31+t3*t5*abb57n25+t9*ab&
      &b57n37+t8*abb57n48+t8*abb57n17+t4*abb57n23))+(2.0_ki)*(t10*abb57n2+t15*ab&
      &b57n53+t16*abb57n59+t3*abb57n58+t4*abb57n21+t5*abb57n24+t5*abb57n36+t7*ab&
      &b57n21+t8*abb57n21+abb57n3*dotproduct(Q, spvak4k2)+abb57n51*dotproduct(Q,&
      & spvak4k5)+t10*t5*abb57n6+t15*t5*abb57n50+t15*t7*abb57n54+t15*t8*abb57n54&
      &+t16*t5*abb57n54+t3*t5*abb57n63+t3*t6*abb57n31-(t17*t3*abb57n10+t15*t9*ab&
      &b57n54+t15*t6*abb57n54+t15*t4*abb57n54+t15*t2*abb57n54+t13*t5*abb57n40+t1&
      &2*t5*abb57n32+t11*t15*abb57n54+t1*t6*abb57n69+t1*t5*abb57n71+abb57n29*dot&
      &product(Q, spvak4k3)+t6*abb57n21+t5*abb57n42+t5*abb57n35+t15*abb57n49+t14&
      &*abb57n4+t13*abb57n34+t12*abb57n22+t11*abb57n21+t1*abb57n65+abb57n41+abb5&
      &7n1))+((2.0_ki)*(t18+abb57n45)+t19)*es61+(2.0_ki)*(-(abb57n21+t19))*es34+&
      &((4.0_ki)*(-(abb57n47+t18))+(2.0_ki)*(t21-t20)+t22+abb57n27)*es234+((4.0_&
      &ki)*(t18+abb57n47)+(2.0_ki)*(t20-t21)-(abb57n27+t22))*es56+((3.0_ki)*(abb&
      &57n30-(t3*abb57n31+abb57n38+t18))+(2.0_ki)*t19+t21+abb57n20+abb57n55+abb5&
      &7n62-(abb57n56+abb57n26))*mu2+(5.0_ki)*t1*abb57n16+t1*abb57n44+t1*abb57n6&
      &8+t17*abb57n9+t2*abb57n28+t2*abb57n56+t23*abb57n15+abb57n12*dotproduct(Q,&
      & spvak1k5)+t14*t3*abb57n5+t23*t5*abb57n14-(t24*t3*abb57n54+t15*t3*abb57n6&
      &1+t1*t2*abb57n69+abb57n8*dotproduct(Q, spvak1k3)+t24*abb57n52+t23*abb57n1&
      &3+t2*abb57n62+t2*abb57n55+t2*abb57n21+t17*abb57n7+t17*abb57n11+t15*abb57n&
      &60))
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
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak3k4)
      brack = ((2.0_ki)*(t1*abb57n64+t1*t3*abb57n70)+(4.0_ki)*(-(t1*t2*abb57n67+&
      &t1*t2*t3)))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram57(Q, mu2, epspow, res)
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
      ! d57: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram57
end module uussbb_d57h2l1
