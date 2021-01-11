module     uussbb_d181h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d181h1l1.f
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
      
      brack = abb181n1
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c6+c5/NC-(c3/NC+c4)))
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
      t2 = dotproduct(Q, spvak1k3)
      t3 = dotproduct(Q, spvak1k2)
      t4 = dotproduct(Q, spvak5k6)
      t5 = dotproduct(Q, spvak4k3)
      t6 = dotproduct(Q, spvak5k2)
      t7 = dotproduct(Q, spvak5k3)
      t8 = dotproduct(Q, Q)
      t9 = dotproduct(Q, spvak5k1)
      brack = (((4.0_ki)*(t1*abb181n23+t3*t4*abb181n35-(t3*t4*t5+t1*t2*abb181n32&
      &))+(2.0_ki)*(t4*abb181n11+t4*abb181n24+t6*abb181n14+t2*t6*abb181n30+t2*t7&
      &*abb181n31+t2*t8*abb181n32+t2*t9*abb181n13+t4*t5*abb181n29+t4*t5*abb181n5&
      &+t4*t6*abb181n15-(t6*abb181n13*dotproduct(Q, spvak2k3)+t6*t8*abb181n16+t5&
      &*t6*abb181n17+t4*t5*abb181n12+t2*t6*abb181n8+t2*t4*abb181n33+t9*abb181n7+&
      &t8*abb181n23+t7*abb181n21+t6*abb181n19+t4*abb181n3+t4*abb181n27+t4*abb181&
      &n20))+((2.0_ki)*((2.0_ki)*t3*abb181n36+t6*abb181n16-(t2*abb181n32+abb181n&
      &4+abb181n28))+abb181n18+(3.0_ki)*abb181n22+abb181n25+abb181n6-abb181n9)*m&
      &u2)*i_)
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
      brack = (((2.0_ki)*(t1*t2*t3-t1*t2*abb181n34)+t2*abb181n2+t2*abb181n26+t2*&
      &t3*abb181n12-(t2*t3*abb181n5+t2*t3*abb181n29+t2*abb181n10))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram181(Q, mu2, epspow, res)
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
      ! d181: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram181
end module uussbb_d181h1l1
