module     uussbb_d47h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d47h2l1.f9
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
      
      brack = (-1.0_ki)*abb47n1/es34*i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c6+NC*c3-(c4+c2)))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak3k4)
      t3 = dotproduct(Q, k2)
      t4 = dotproduct(Q, spvak1k2)
      t5 = dotproduct(Q, k1)
      t6 = dotproduct(Q, k5)
      t7 = dotproduct(Q, k3)
      t8 = dotproduct(Q, k4)
      t9 = dotproduct(Q, spvak5k6)
      t10 = dotproduct(Q, spvak3k1)
      t11 = dotproduct(Q, k6)
      t12 = dotproduct(Q, spvak3k2)
      t13 = t9*abb47n12
      t14 = t4*abb47n41
      t15 = (2.0_ki)*t14
      t16 = t2*abb47n29
      t17 = t12*abb47n31
      t18 = (3.0_ki)*t16
      t19 = (2.0_ki)*t17
      t20 = dotproduct(Q, spvak4k2)
      brack = ((3.0_ki)*(t1*abb47n23+t1*abb47n4+t1*t2*abb47n29+t1*t4*abb47n41+(2&
      &.0_ki)*t2*t3*abb47n29-(t1*abb47n3+t1*abb47n20))+(4.0_ki)*(t5*abb47n18+t5*&
      &abb47n28+t2*t4*t9+t4*t7*abb47n41-(t4*t8*abb47n41+t2*t6*abb47n29+(2.0_ki)*&
      &t2*t5*abb47n29+t6*abb47n23+t3*abb47n9))+(2.0_ki)*(t4*abb47n40+t5*abb47n23&
      &+t6*abb47n19+t6*abb47n28+t6*abb47n3+t6*abb47n8+t7*abb47n23+t8*abb47n23+t1&
      &0*t4*abb47n31+t11*t12*abb47n31+t12*t4*abb47n38+t12*t6*abb47n31+t2*t4*abb4&
      &7n44+t4*abb47n41*es45+t4*abb47n45*dotproduct(Q, spvak3k6)+t6*t9*abb47n12-&
      &(t4*abb47n39*dotproduct(Q, spvak2k4)+t4*abb47n37*dotproduct(Q, spvak1k4)+&
      &t4*t9*abb47n42+t4*t6*abb47n41+t12*t8*abb47n31+t12*t7*abb47n31+t12*t5*abb4&
      &7n31+t12*t3*abb47n31+t1*t12*abb47n31+abb47n6*dotproduct(Q, spvak4k1)+abb4&
      &7n5*dotproduct(Q, spvak2k1)+t6*abb47n4+t6*abb47n36+t6*abb47n11+t4*abb47n7&
      &+t3*abb47n27+t12*abb47n32+t11*abb47n23+t10*abb47n15+t1*abb47n28))+abb47n1&
      &4+((2.0_ki)*(t13+t15+abb47n3-abb47n33)-t16)*es34+((2.0_ki)*(abb47n34-(abb&
      &47n3+abb47n21+abb47n13+t17+t15+t13))+t16)*es345+(abb47n28-(t19+t18))*es23&
      &4+(t18+t19-abb47n28)*es61+(2.0_ki)*((2.0_ki)*t16+t17+abb47n35-t13)*es56+(&
      &(2.0_ki)*(t17+abb47n28)+(3.0_ki)*(abb47n20+abb47n3-(abb47n4+abb47n23+t16+&
      &t14))+t13+abb47n8-(abb47n36+abb47n10))*mu2+t1*abb47n10+t1*abb47n36+t20*ab&
      &b47n22+t9*abb47n24+t12*t2*abb47n30+t2*t20*abb47n31-(t2*t9*abb47n26+t1*t9*&
      &abb47n12+t4*abb47n16+t2*abb47n25+t1*abb47n8+abb47n2+abb47n17))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak5k6)
      brack = ((2.0_ki)*(t1*t2*abb47n43-(2.0_ki)*t1*t2*dotproduct(Q, spvak3k4)))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram47(Q, mu2, epspow, res)
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
      ! d47: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram47
end module uussbb_d47h2l1
