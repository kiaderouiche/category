module     uussbb_d53h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d53h0l1.f9
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
      
      t1 = dotproduct(Q, spvak4k3)
      t2 = dotproduct(Q, Q)
      t3 = dotproduct(Q, spvak6k5)
      t4 = dotproduct(Q, k2)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, k3)
      t7 = dotproduct(Q, k1)
      t8 = dotproduct(Q, k5)
      t9 = dotproduct(Q, k6)
      t10 = dotproduct(Q, spvak6k1)
      t11 = dotproduct(Q, spvak2k5)
      t12 = dotproduct(Q, k4)
      t13 = dotproduct(Q, spvak4k5)
      t14 = dotproduct(Q, spvak4k2)
      t15 = dotproduct(Q, spvak5k2)
      t16 = dotproduct(Q, spvak6k2)
      t17 = dotproduct(Q, spvak1k5)
      t18 = dotproduct(Q, spvak1k3)
      t19 = t5*abb53n67
      t20 = t16*abb53n36
      t21 = t1*abb53n54
      t22 = dotproduct(Q, spvak6k3)
      brack = ((3.0_ki)*(t1*abb53n2+t2*abb53n4+(2.0_ki)*t3*t4*abb53n22-(t2*t5*ab&
      &b53n67+t2*t3*abb53n22))+(4.0_ki)*(t2*abb53n25+t4*abb53n44+t6*abb53n15+t7*&
      &abb53n20+t8*abb53n26+t8*abb53n3+t1*t3*abb53n30+t5*t6*abb53n67+t5*t9*abb53&
      &n67-(t5*t8*abb53n67+(2.0_ki)*t3*t7*abb53n22+t1*t3*t5+t9*abb53n3+t9*abb53n&
      &26+t6*abb53n5+t6*abb53n42+t5*abb53n6+t4*abb53n21))+(2.0_ki)*(abb53n45+t1*&
      &abb53n53+t10*abb53n13+t12*abb53n17+t14*abb53n47+t16*abb53n49+t3*abb53n27+&
      &t8*abb53n17+t9*abb53n17+abb53n10*dotproduct(Q, spvak2k1)+abb53n11*dotprod&
      &uct(Q, spvak4k1)+t1*t5*abb53n69+t11*t5*abb53n62+t12*t16*abb53n36+t13*t5*a&
      &bb53n65+t16*t4*abb53n36+t16*t6*abb53n36+t16*t7*abb53n36+t16*t8*abb53n36+t&
      &16*t9*abb53n36+t17*t5*abb53n9+t18*t3*abb53n60+t3*t6*abb53n22-(t3*t5*abb53&
      &n68+t16*t5*abb53n63+t16*t2*abb53n36+t10*t5*abb53n36+t1*t6*abb53n54+abb53n&
      &12*dotproduct(Q, spvak5k1)+t5*abb53n7+t5*abb53n66+t17*abb53n61+t15*abb53n&
      &48+t13*abb53n23+t11*abb53n14+t1*abb53n28))+abb53n18+((2.0_ki)*(abb53n24-t&
      &19)+t20)*es45+((2.0_ki)*(t19-abb53n24)-t20)*es345+((4.0_ki)*(abb53n43-t19&
      &)+(2.0_ki)*t20+t21)*es34+((2.0_ki)*(t20-(2.0_ki)*abb53n25)+(3.0_ki)*(t19+&
      &t3*abb53n22-abb53n4)+abb53n16+abb53n41+abb53n57-(abb53n52+t21))*mu2+t1*ab&
      &b53n40+t1*abb53n56+t15*abb53n34+t16*abb53n32+t16*abb53n37+t18*abb53n58+t2&
      &*abb53n52+t22*abb53n51+abb53n50*dotproduct(Q, spvak5k3)+t1*t2*abb53n54+t2&
      &2*t5*abb53n64-(t16*t3*abb53n38+t15*t3*abb53n36+t14*t3*abb53n33+abb53n46*d&
      &otproduct(Q, spvak2k3)+t22*abb53n55+t22*abb53n39+t2*abb53n57+t2*abb53n41+&
      &t2*abb53n16+t18*abb53n8+t18*abb53n59+t16*abb53n35+abb53n19))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak4k3)
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak1k2)
      brack = ((2.0_ki)*(t1*abb53n29-t1*t3*abb53n70)+(4.0_ki)*(t1*t2*t3-t1*t2*ab&
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
end module uussbb_d53h0l1
