module     uussbb_d184h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d184h1l1.f
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
      complex(ki) :: brack
      
      brack = abb184n1
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c5/NC-(c3/NC+c6)))
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
      
      t1 = dotproduct(Q, k6)
      t2 = dotproduct(Q, spvak4k2)
      t3 = dotproduct(Q, spvak1k2)
      t4 = dotproduct(Q, spvak5k6)
      t5 = dotproduct(Q, spvak4k3)
      t6 = dotproduct(Q, spvak2k6)
      t7 = dotproduct(Q, spvak4k6)
      t8 = dotproduct(Q, Q)
      t9 = dotproduct(Q, spvak1k6)
      brack = (((4.0_ki)*(t3*t4*t5+t3*t4*abb184n33-(t1*t2*abb184n22+t1*abb184n19&
      &))+(2.0_ki)*(t4*abb184n15+t4*abb184n24+t6*abb184n12+t9*abb184n6+t2*t6*abb&
      &184n13+t2*t9*abb184n7+t4*t5*abb184n26+t4*t9*abb184n31+t8*t9*abb184n30-(t9&
      &*abb184n13*dotproduct(Q, spvak4k1)+t5*t9*abb184n29+t4*t5*abb184n4+t2*t9*a&
      &bb184n27+t2*t8*abb184n22+t2*t7*abb184n20+t2*t4*abb184n21+t9*abb184n28+t8*&
      &abb184n19+t7*abb184n16+t4*abb184n2+t4*abb184n17))+((2.0_ki)*(t2*abb184n22&
      &-(t9*abb184n30+(2.0_ki)*t3*abb184n32+abb184n23+abb184n14+abb184n10))+abb1&
      &84n11+(3.0_ki)*abb184n18+abb184n5-(abb184n9+abb184n8))*mu2)*i_)
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
      brack = (((2.0_ki)*(-(t1*t2*abb184n34+t1*t2*t3))+t2*abb184n3+t2*t3*abb184n&
      &4-(t2*t3*abb184n26+t2*abb184n25))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram184(Q, mu2, epspow, res)
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
      ! d184: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram184
end module uussbb_d184h1l1
