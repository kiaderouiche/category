module     uussbb_d191h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d191h1l1.f
   ! 90
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
      real(ki) :: brack
      
      brack = (1.0_ki)/es34
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c2+c5/NC-(c3/NC+c6)))
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
      
      t1 = dotproduct(Q, k5)
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, spvak4k2)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, spvak5k4)
      t7 = dotproduct(Q, spvak5k3)
      t8 = dotproduct(Q, spvak5k2)
      t9 = dotproduct(Q, Q)
      brack = (((4.0_ki)*(t1*t4*abb191n27+t2*t3*t5-(t2*t3*abb191n24+t1*abb191n22&
      &))+(2.0_ki)*(t3*abb191n1+t3*abb191n23+t6*abb191n14+t7*abb191n4+t8*abb191n&
      &2+t9*abb191n22+t3*t4*abb191n30+t3*t5*abb191n32+t3*t7*abb191n16+t4*t7*abb1&
      &91n19+t5*t7*abb191n10+t7*abb191n18*dotproduct(Q, spvak3k2)-(t7*t9*abb191n&
      &17+t4*t9*abb191n27+t4*t8*abb191n3+t4*t7*abb191n5+t4*t6*abb191n18+t3*t5*ab&
      &b191n8+t3*t5*abb191n35+t7*abb191n15+t3*abb191n28+t3*abb191n20))+((2.0_ki)&
      &*(abb191n25+abb191n6+t4*abb191n27+t7*abb191n17-(2.0_ki)*t2*abb191n26)+abb&
      &191n13-(abb191n9+abb191n29+(3.0_ki)*abb191n21+abb191n12+abb191n11))*mu2)*&
      &i_)
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
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak5k6)
      brack = (((2.0_ki)*(-(t1*t2*abb191n34+t1*t2*t3))+t1*abb191n33+t1*abb191n7+&
      &t1*t3*abb191n35+t1*t3*abb191n8-(t1*t3*abb191n32+t1*abb191n31))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram191(Q, mu2, epspow, res)
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
      ! d191: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram191
end module uussbb_d191h1l1
