module     uussbb_d19h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d19h2l1.f9
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
      complex(ki) :: t16
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak3k4)
      t4 = dotproduct(Q, k3)
      t5 = dotproduct(Q, k4)
      t6 = dotproduct(Q, k1)
      t7 = dotproduct(Q, k2)
      t8 = dotproduct(Q, Q)
      t9 = dotproduct(Q, k5)
      t10 = dotproduct(Q, k6)
      t11 = t3*abb19n46
      t12 = -(abb19n7+abb19n41)
      t13 = (5.0_ki/2.0_ki)*t12
      t14 = (7.0_ki/2.0_ki)*t11
      t15 = t1*abb19n61
      t16 = t2*abb19n27
      brack = (((9.0_ki/2.0_ki)*((2.0_ki)*t1*t2*t3-t1*t3*abb19n64)+(17.0_ki/2.0_&
      &ki)*(t1*t2*abb19n13+t1*t2*abb19n59)+(5.0_ki/2.0_ki)*(-(abb19n8+abb19n47+a&
      &bb19n4+abb19n37))+(4.0_ki)*(-(t5*abb19n32+t5*abb19n16+t4*abb19n32+t4*abb1&
      &9n16+abb19n21))+(6.0_ki)*(t3*abb19n45+t6*abb19n16+t6*abb19n34+t7*abb19n16&
      &+t7*abb19n34+t1*abb19n61*es45)+(5.0_ki)*(t1*abb19n11+t1*abb19n55+t6*abb19&
      &n41+t6*abb19n7+t7*abb19n41+t7*abb19n7+t8*abb19n41+t8*abb19n7-abb19n24)+(3&
      &.0_ki)*(t1*abb19n62+t3*abb19n14+t3*abb19n28+t8*abb19n16+t8*abb19n33+t1*t6&
      &*abb19n61+t1*t7*abb19n61+t3*t6*abb19n46+t3*t7*abb19n46)+(2.0_ki)*(abb19n2&
      &+abb19n20+abb19n25+abb19n29+abb19n3+abb19n30+t4*abb19n51+t5*abb19n51+t1*t&
      &8*abb19n61+t2*t6*abb19n27+t2*t7*abb19n27+t2*t8*abb19n27+t3*t8*abb19n46-(t&
      &2*t5*abb19n27+t2*t4*abb19n27+t7*abb19n19+t7*abb19n15+t6*abb19n19+t6*abb19&
      &n15+t5*abb19n19+t5*abb19n15+t4*abb19n19+t4*abb19n15))+(1.0_ki/2.0_ki)*abb&
      &19n38+(1.0_ki/2.0_ki)*abb19n48+(1.0_ki/2.0_ki)*abb19n5+(1.0_ki/2.0_ki)*ab&
      &b19n9+((5.0_ki)*(abb19n41+abb19n7)+(7.0_ki)*t11)*es61+(t13-((3.0_ki)*t15+&
      &t14))*es345+((5.0_ki)*(t15+t16)+(3.0_ki/2.0_ki)*(-(abb19n7+abb19n41+(2.0_&
      &ki)*abb19n31))-(abb19n51+t14))*es34+((2.0_ki)*(abb19n23+abb19n26)+t13-((1&
      &3.0_ki/2.0_ki)*t16+t14))*es234+((2.0_ki)*((3.0_ki)*t11-(abb19n26+abb19n22&
      &))+(5.0_ki)*t15+(1.0_ki/2.0_ki)*t16+abb19n50)*es56+((3.0_ki)*(-(abb19n34+&
      &abb19n16))+(2.0_ki)*(-(t16+t15+t11))+(5.0_ki)*t12+abb19n15+abb19n19+abb19&
      &n42+abb19n52-abb19n44)*mu2+(1.0_ki/2.0_ki)*t2*abb19n10+(1.0_ki/2.0_ki)*t2&
      &*abb19n39+(1.0_ki/2.0_ki)*t2*abb19n49+(1.0_ki/2.0_ki)*t2*abb19n6+t3*abb19&
      &n17+t8*abb19n44+(1.0_ki/2.0_ki)*t1*t2*abb19n60+(1.0_ki/2.0_ki)*t1*t2*abb1&
      &9n63+t10*t3*abb19n46+t3*t9*abb19n46-(t3*t5*abb19n46+t3*t4*abb19n46+(1.0_k&
      &i/2.0_ki)*t2*t3*abb19n54+(1.0_ki/2.0_ki)*t2*t3*abb19n36+(1.0_ki/2.0_ki)*t&
      &2*t3*abb19n18+t1*t9*abb19n61+t1*t5*abb19n61+t1*t4*abb19n61+t1*t10*abb19n6&
      &1+t9*abb19n40+t8*abb19n52+t8*abb19n42+t8*abb19n15+t5*abb19n7+t5*abb19n41+&
      &t4*abb19n7+t4*abb19n41+(1.0_ki/2.0_ki)*t3*abb19n53+(1.0_ki/2.0_ki)*t3*abb&
      &19n43+t2*abb19n35+t10*abb19n40+t1*abb19n56+t1*abb19n12))*i_)
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
      brack = (((4.0_ki)*(t1*abb19n57+t1*t3*abb19n64)+(8.0_ki)*(-(t1*t2*abb19n58&
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
end module uussbb_d19h2l1
