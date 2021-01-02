module     uussbb_d55h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d55h0l1.f9
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
      
      brack = (-1.0_ki)*i_/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c6-(NC*c5+c2)))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, k3)
      t4 = dotproduct(Q, spvak4k3)
      t5 = dotproduct(Q, k4)
      t6 = dotproduct(Q, k1)
      t7 = dotproduct(Q, k5)
      t8 = dotproduct(Q, k6)
      t9 = dotproduct(Q, spvak1k2)
      t10 = dotproduct(Q, spvak6k4)
      t11 = dotproduct(Q, k2)
      t12 = dotproduct(Q, spvak6k3)
      t13 = t2*abb55n17
      t14 = (2.0_ki)*t13
      t15 = t4*abb55n31
      t16 = t9*abb55n37
      t17 = t12*abb55n22
      t18 = dotproduct(Q, spvak5k3)
      brack = ((3.0_ki)*(t1*abb55n15+t1*t2*abb55n17+t1*t4*abb55n31-((2.0_ki)*t2*&
      &t3*abb55n17+t2*abb55n5+t2*abb55n16+t1*abb55n6+t1*abb55n19))+(4.0_ki)*(t2*&
      &t4*t9+(2.0_ki)*t2*t5*abb55n17+t2*t6*abb55n17+t4*t8*abb55n31-(t4*t7*abb55n&
      &31+t6*abb55n7+t5*abb55n18+t3*abb55n3))+(2.0_ki)*(abb55n1+t10*abb55n23+t3*&
      &abb55n8+t5*abb55n8+t6*abb55n14+t6*abb55n26+t6*abb55n34+t9*abb55n10+abb55n&
      &20*dotproduct(Q, spvak5k4)+t12*t3*abb55n22+t12*t5*abb55n22+t4*t6*abb55n31&
      &+t4*t9*abb55n38+t4*abb55n2*dotproduct(Q, spvak6k2)+t4*abb55n28*dotproduct&
      &(Q, spvak3k5)+t4*abb55n29*dotproduct(Q, spvak4k5)-(t6*t9*abb55n37+t4*abb5&
      &5n31*es61+t2*t4*abb55n35+t12*t8*abb55n22+t12*t7*abb55n22+t12*t6*abb55n22+&
      &t12*t4*abb55n4+t11*t12*abb55n22+t10*t4*abb55n22+t1*t12*abb55n22+abb55n13*&
      &dotproduct(Q, spvak3k4)+t9*abb55n36+t8*abb55n8+t7*abb55n8+t6*abb55n30+t6*&
      &abb55n19+t4*abb55n27+t3*abb55n12+t11*abb55n8))+(2.0_ki)*(t14+abb55n33-(t1&
      &6+t15))*es234+(2.0_ki)*(t15+t16-(abb55n32+t17+t14))*es56+((3.0_ki)*(abb55&
      &n19+abb55n6-(abb55n15+t15+t13))+t16+(2.0_ki)*t17+abb55n30-(abb55n34+abb55&
      &n26))*mu2+t1*abb55n26+t1*abb55n34+t2*abb55n9+t12*t2*abb55n25+t18*t2*abb55&
      &n22+t2*t9*abb55n11-(t1*t9*abb55n37+t18*abb55n21+t12*abb55n24+t1*abb55n30)&
      &)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak4k3)
      brack = ((2.0_ki)*(-((2.0_ki)*t1*t2*dotproduct(Q, spvak6k5)+t1*t2*abb55n39&
      &)))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram55(Q, mu2, epspow, res)
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
      ! d55: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram55
end module uussbb_d55h0l1
