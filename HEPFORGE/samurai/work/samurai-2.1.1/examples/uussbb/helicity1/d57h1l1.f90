module     uussbb_d57h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d57h1l1.f9
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
      complex(ki) :: t25
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak1k2)
      t3 = dotproduct(Q, spvak4k3)
      t4 = dotproduct(Q, spvak5k6)
      t5 = dotproduct(Q, k4)
      t6 = dotproduct(Q, k5)
      t7 = dotproduct(Q, k6)
      t8 = dotproduct(Q, k3)
      t9 = dotproduct(Q, k1)
      t10 = dotproduct(Q, spvak5k2)
      t11 = dotproduct(Q, k2)
      t12 = dotproduct(Q, spvak5k4)
      t13 = dotproduct(Q, spvak5k3)
      t14 = dotproduct(Q, spvak4k6)
      t15 = dotproduct(Q, spvak4k5)
      t16 = dotproduct(Q, spvak4k2)
      t17 = dotproduct(Q, spvak3k6)
      t18 = dotproduct(Q, spvak1k3)
      t19 = t3*abb57n48
      t20 = t14*abb57n43
      t21 = t4*abb57n30
      t22 = t2*abb57n60
      t23 = (2.0_ki)*t22
      t24 = (3.0_ki)*abb57n24
      t25 = dotproduct(Q, spvak1k6)
      brack = ((3.0_ki)*(t1*abb57n16+t1*abb57n31+t2*abb57n21+t1*t3*abb57n48+t1*t&
      &4*abb57n30+t3*t4*abb57n17+(2.0_ki)*t4*t5*abb57n30-t1*abb57n27)+(4.0_ki)*(&
      &t2*abb57n35+t5*abb57n25+t6*abb57n20+t6*abb57n40+t8*abb57n28+t9*abb57n38+t&
      &2*t3*t4+t2*t4*abb57n57+t3*t6*abb57n48+t3*t9*abb57n48-((2.0_ki)*t4*t8*abb5&
      &7n30+t3*t7*abb57n48+t7*abb57n40+t7*abb57n20+t5*abb57n31))+(2.0_ki)*(t10*a&
      &bb57n2+t14*abb57n42+t14*abb57n52+t15*abb57n44+t16*abb57n5+t17*abb57n50+t3&
      &*abb57n15+t4*abb57n49+t5*abb57n22+t6*abb57n22+t7*abb57n22+abb57n3*dotprod&
      &uct(Q, spvak3k2)+abb57n41*dotproduct(Q, spvak3k5)+t10*t3*abb57n6+t14*t3*a&
      &bb57n45+t14*t6*abb57n43+t14*t7*abb57n43+t17*t3*abb57n43+t3*t4*abb57n54+t4&
      &*t9*abb57n30-(t2*t9*abb57n60+t2*t3*abb57n62+t18*t4*abb57n10+t14*t9*abb57n&
      &43+t14*t8*abb57n43+t14*t5*abb57n43+t13*t3*abb57n18+t12*t3*abb57n33+t11*t1&
      &4*abb57n43+t1*t14*abb57n43+abb57n26*dotproduct(Q, spvak3k4)+t3*abb57n34+t&
      &2*abb57n56+t13*abb57n32+t12*abb57n23+t11*abb57n22+abb57n1))+((2.0_ki)*(t1&
      &9+abb57n37)+t20)*es61+(2.0_ki)*(-(abb57n22+t20))*es34+((4.0_ki)*(t21-(abb&
      &57n39+t19))+t23+t24+abb57n29)*es234+((4.0_ki)*(t19+abb57n39-t21)-(abb57n2&
      &9+t24+t23))*es56+((3.0_ki)*(abb57n27-(abb57n31+abb57n16+t21+t19))+(2.0_ki&
      &)*t20+t22+abb57n46+abb57n53-abb57n47)*mu2+t1*abb57n47+t18*abb57n9+(5.0_ki&
      &)*t2*abb57n19+t2*abb57n36+t2*abb57n59+t25*abb57n14+abb57n11*dotproduct(Q,&
      & spvak1k5)+t16*t4*abb57n4+t25*t3*abb57n13-(t15*t4*abb57n43+t14*t4*abb57n5&
      &1+t1*t2*abb57n60+abb57n8*dotproduct(Q, spvak1k4)+t25*abb57n12+t18*abb57n7&
      &+t1*abb57n53+t1*abb57n46))
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
      t3 = dotproduct(Q, spvak4k3)
      brack = ((2.0_ki)*(t1*abb57n55+t1*t3*abb57n61)+(4.0_ki)*(-(t1*t2*abb57n58+&
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
end module uussbb_d57h1l1
