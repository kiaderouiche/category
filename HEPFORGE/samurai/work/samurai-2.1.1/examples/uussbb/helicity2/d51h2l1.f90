module     uussbb_d51h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d51h2l1.f9
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
      
      brack = (-1.0_ki)*abb51n1/es56*i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c2+c6-(NC*c5+c4)))
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
      
      t1 = dotproduct(Q, spvak5k6)
      t2 = dotproduct(Q, Q)
      t3 = dotproduct(Q, k2)
      t4 = dotproduct(Q, spvak1k2)
      t5 = dotproduct(Q, k3)
      t6 = dotproduct(Q, k1)
      t7 = dotproduct(Q, k5)
      t8 = dotproduct(Q, k6)
      t9 = dotproduct(Q, spvak3k4)
      t10 = dotproduct(Q, spvak5k1)
      t11 = dotproduct(Q, k4)
      t12 = dotproduct(Q, spvak6k2)
      t13 = dotproduct(Q, spvak5k2)
      t14 = t13*abb51n25
      t15 = t4*abb51n42
      brack = ((3.0_ki)*(-(t2*t4*abb51n42+t1*t4*abb51n4+(2.0_ki)*t1*t3*abb51n21+&
      &t1*t2*abb51n21+t2*abb51n29+t1*abb51n20))+(4.0_ki)*(t1*abb51n19+t3*abb51n2&
      &7+t5*abb51n12+t1*t5*abb51n21+(2.0_ki)*t1*t6*abb51n21+t4*t8*abb51n42-(t4*t&
      &7*abb51n42+t1*t4*t9+t6*abb51n17))+(2.0_ki)*(abb51n2+t10*abb51n10+t11*abb5&
      &1n12+t13*abb51n35+t2*abb51n15+t5*abb51n28+t5*abb51n3+t5*abb51n32+abb51n8*&
      &dotproduct(Q, spvak2k1)+t10*t4*abb51n25+t11*t13*abb51n25+t13*t4*abb51n38+&
      &t13*t5*abb51n25+t4*t5*abb51n42+t4*t9*abb51n44+t4*abb51n40*dotproduct(Q, s&
      &pvak5k4)+t4*abb51n42*es345-(t5*t9*abb51n34+t4*abb51n42*es45+t4*abb51n39*d&
      &otproduct(Q, spvak2k6)+t4*abb51n26*dotproduct(Q, spvak1k6)+t13*t8*abb51n2&
      &5+t13*t7*abb51n25+t13*t6*abb51n25+t13*t3*abb51n25+t13*t2*abb51n25+t1*t4*a&
      &bb51n43+abb51n9*dotproduct(Q, spvak6k1)+t9*abb51n33+t8*abb51n12+t7*abb51n&
      &12+t5*abb51n7+t5*abb51n37+t5*abb51n31+t5*abb51n18+t4*abb51n41+t12*abb51n3&
      &0+abb51n6+abb51n36))+abb51n11+abb51n5+(2.0_ki)*(-(abb51n12+t14))*es56+(2.&
      &0_ki)*(t14+abb51n12-(2.0_ki)*t15)*es34+((2.0_ki)*(t14-abb51n16)+(3.0_ki)*&
      &(t15+abb51n12+abb51n29+abb51n3+t1*abb51n21-abb51n7)+abb51n32-(t9*abb51n34&
      &+abb51n37+abb51n31))*mu2+t1*abb51n13+t12*abb51n23+t13*abb51n22+t2*abb51n3&
      &1+t2*abb51n37+t1*t12*abb51n25+t1*t13*abb51n24+t1*t9*abb51n14+t2*t9*abb51n&
      &34-t2*abb51n32)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak3k4)
      brack = ((2.0_ki)*((2.0_ki)*t1*t2*dotproduct(Q, spvak5k6)-t1*t2*abb51n45))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram51(Q, mu2, epspow, res)
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
      ! d51: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram51
end module uussbb_d51h2l1
