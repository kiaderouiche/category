module     uussbb_d47h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d47h1l1.f9
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, k2)
      t4 = dotproduct(Q, spvak1k2)
      t5 = dotproduct(Q, k1)
      t6 = dotproduct(Q, k5)
      t7 = dotproduct(Q, k3)
      t8 = dotproduct(Q, k4)
      t9 = dotproduct(Q, spvak5k6)
      t10 = dotproduct(Q, spvak4k1)
      t11 = dotproduct(Q, k6)
      t12 = dotproduct(Q, spvak4k2)
      t13 = t9*abb47n11
      t14 = t12*abb47n29
      t15 = t4*abb47n39
      t16 = t2*abb47n28
      t17 = (3.0_ki)*t16
      t18 = (2.0_ki)*t14
      t19 = dotproduct(Q, spvak3k2)
      brack = ((3.0_ki)*(t1*abb47n20+t1*t2*abb47n28+t1*t4*abb47n39+(2.0_ki)*t2*t&
      &3*abb47n28-(t1*abb47n4+t1*abb47n18))+(4.0_ki)*(t5*abb47n16+t5*abb47n26+t2&
      &*t4*t9+t4*t8*abb47n39-(t4*t7*abb47n39+t2*t6*abb47n28+(2.0_ki)*t2*t5*abb47&
      &n28+t6*abb47n20+t3*abb47n8))+(2.0_ki)*(t4*abb47n38+t5*abb47n20+t6*abb47n1&
      &7+t6*abb47n26+t6*abb47n3+t7*abb47n20+t8*abb47n20+t10*t4*abb47n29+t11*t12*&
      &abb47n29+t12*t4*abb47n36+t12*t6*abb47n29+t4*abb47n42*dotproduct(Q, spvak4&
      &k6)+t6*t9*abb47n11-(t4*abb47n39*es45+t4*abb47n37*dotproduct(Q, spvak2k3)+&
      &t4*abb47n35*dotproduct(Q, spvak1k3)+t4*t9*abb47n40+t4*t6*abb47n39+t2*t4*a&
      &bb47n43+t12*t8*abb47n29+t12*t7*abb47n29+t12*t5*abb47n29+t12*t3*abb47n29+t&
      &1*t12*abb47n29+abb47n6*dotproduct(Q, spvak3k1)+abb47n5*dotproduct(Q, spva&
      &k2k1)+t6*abb47n34+t6*abb47n10+t4*abb47n7+t3*abb47n25+t12*abb47n31+t11*abb&
      &47n20+t10*abb47n13+t1*abb47n26))+abb47n12+((2.0_ki)*(abb47n32-(t15+t14+t1&
      &3))+t16)*es345+(abb47n26-(t18+t17))*es234+(t17+t18-abb47n26)*es61+((2.0_k&
      &i)*(t13+t15-abb47n34)+abb47n24+abb47n27-t16)*es34+(2.0_ki)*(t14+(2.0_ki)*&
      &t16+abb47n33-t13)*es56+((2.0_ki)*(t14+abb47n26)+(3.0_ki)*(abb47n18+abb47n&
      &4-(abb47n20+t16+t15))+t13-(abb47n9+abb47n34))*mu2+t1*abb47n34+t1*abb47n9+&
      &t19*abb47n19+t9*abb47n21+t12*t2*abb47n30+t19*t2*abb47n29-(t2*t9*abb47n23+&
      &t1*t9*abb47n11+t4*abb47n14+t2*abb47n22+abb47n2+abb47n15))
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
      brack = ((2.0_ki)*(t1*t2*abb47n41-(2.0_ki)*t1*t2*dotproduct(Q, spvak4k3)))
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
end module uussbb_d47h1l1
