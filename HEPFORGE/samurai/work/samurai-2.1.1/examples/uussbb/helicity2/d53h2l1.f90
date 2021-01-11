module     uussbb_d53h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d53h2l1.f9
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
      
      brack = (-1.0_ki)*abb53n1/es56*i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c2+c6-(NC*c3+c4)))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak3k4)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, k1)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, k3)
      t7 = dotproduct(Q, k5)
      t8 = dotproduct(Q, k6)
      t9 = dotproduct(Q, k2)
      t10 = dotproduct(Q, k4)
      t11 = dotproduct(Q, spvak5k1)
      t12 = dotproduct(Q, spvak5k2)
      t13 = dotproduct(Q, spvak5k4)
      t14 = dotproduct(Q, spvak1k5)
      t15 = dotproduct(Q, spvak1k6)
      t16 = dotproduct(Q, spvak2k6)
      t17 = dotproduct(Q, spvak1k4)
      t18 = dotproduct(Q, spvak3k2)
      t19 = t5*abb53n69
      t20 = t15*abb53n63
      t21 = t2*abb53n49
      t22 = dotproduct(Q, spvak3k6)
      brack = ((3.0_ki)*(t1*abb53n3+t1*abb53n36+t2*abb53n4+t2*abb53n8+(2.0_ki)*t&
      &3*t4*abb53n19-(t1*t5*abb53n69+t1*t3*abb53n19+t1*abb53n5+abb53n17+abb53n13&
      &))+(4.0_ki)*(t1*abb53n10+t4*abb53n3+t6*abb53n11+t6*abb53n5+t7*abb53n10+t7&
      &*abb53n26+t9*abb53n35+t2*t3*abb53n30+t5*t6*abb53n69+t5*t8*abb53n69-(t5*t7&
      &*abb53n69+(2.0_ki)*t3*t9*abb53n19+t2*t3*t5+t8*abb53n26+t8*abb53n10+t6*abb&
      &53n37+t6*abb53n3+t6*abb53n10+t5*abb53n55+t4*abb53n18))+(2.0_ki)*(abb53n14&
      &+abb53n50+t10*abb53n16+t15*abb53n33+t16*abb53n51+t2*abb53n48+t3*abb53n27+&
      &t7*abb53n16+t8*abb53n16+abb53n40*dotproduct(Q, spvak2k4)+abb53n6*dotprodu&
      &ct(Q, spvak2k1)+t10*t15*abb53n63+t11*t5*abb53n22+t12*t5*abb53n57+t13*t5*a&
      &bb53n66+t15*t4*abb53n63+t15*t6*abb53n63+t15*t7*abb53n63+t15*t8*abb53n63+t&
      &15*t9*abb53n63+t18*t3*abb53n21+t2*t5*abb53n71+t3*t6*abb53n19-(t3*t5*abb53&
      &n70+t2*t6*abb53n49+t16*t5*abb53n63+t15*t5*abb53n34+t1*t15*abb53n63+abb53n&
      &41*dotproduct(Q, spvak2k5)+t5*abb53n68+t5*abb53n56+t2*abb53n28+t17*abb53n&
      &58+t14*abb53n32+t13*abb53n24+t12*abb53n23+t11*abb53n2))+abb53n12+((2.0_ki&
      &)*(abb53n25-t19)+t20)*es45+((2.0_ki)*(t19-abb53n25)-t20)*es345+((4.0_ki)*&
      &(abb53n38+abb53n9-t19)+(2.0_ki)*t20+t21-(3.0_ki)*abb53n11)*es34+((2.0_ki)&
      &*(t20-(2.0_ki)*abb53n10)+(3.0_ki)*(t19+abb53n5+t3*abb53n19-(abb53n36+abb5&
      &3n3))+abb53n15+abb53n44+abb53n54-(abb53n47+t21))*mu2+t1*abb53n47+t14*abb5&
      &3n61+t15*abb53n59+t15*abb53n64+t18*abb53n20+t2*abb53n43+t2*abb53n53+t22*a&
      &bb53n46+abb53n45*dotproduct(Q, spvak3k5)+t1*t2*abb53n49+t22*t5*abb53n67-(&
      &t17*t3*abb53n60+t15*t3*abb53n65+t14*t3*abb53n63+abb53n7*dotproduct(Q, spv&
      &ak3k1)+t22*abb53n52+t22*abb53n42+t18*abb53n39+t15*abb53n62+t1*abb53n54+t1&
      &*abb53n44+t1*abb53n15))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak3k4)
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak1k2)
      brack = ((2.0_ki)*(t1*abb53n29-t1*t3*abb53n72)+(4.0_ki)*(t1*t2*t3-t1*t2*ab&
      &b53n31))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram53(Q, mu2, epspow, res)
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
      ! d53: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram53
end module uussbb_d53h2l1
