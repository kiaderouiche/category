module     uussbb_d183h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d183h0l1.f
   ! 90
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
      
      brack = abb183n1
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c2+((1.0_ki)/NC-NC)*c5-c3/NC))
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
      t2 = dotproduct(Q, spvak4k2)
      t3 = dotproduct(Q, spvak1k2)
      t4 = dotproduct(Q, spvak6k5)
      t5 = dotproduct(Q, spvak4k3)
      t6 = dotproduct(Q, spvak2k5)
      t7 = dotproduct(Q, spvak4k5)
      t8 = dotproduct(Q, Q)
      t9 = dotproduct(Q, spvak1k5)
      brack = (((4.0_ki)*(t1*abb183n15+t1*t2*abb183n23-(t3*t4*abb183n30+t3*t4*t5&
      &))+(2.0_ki)*(t4*abb183n16+t4*abb183n2+t7*abb183n14+t8*abb183n15+t9*abb183&
      &n26+t2*t4*abb183n24+t2*t7*abb183n22+t2*t8*abb183n23+t2*t9*abb183n25+t4*t5&
      &*abb183n4+t5*t9*abb183n27+t9*abb183n13*dotproduct(Q, spvak4k1)-(t8*t9*abb&
      &183n29+t4*t9*abb183n28+t4*t5*abb183n21+t2*t9*abb183n7+t2*t6*abb183n13+t9*&
      &abb183n6+t6*abb183n12+t4*abb183n18+t4*abb183n10))+((2.0_ki)*(abb183n11+ab&
      &b183n19+(2.0_ki)*t3*abb183n31+t9*abb183n29-t2*abb183n23)+abb183n8+abb183n&
      &9-(abb183n5+abb183n17))*mu2)*i_)
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
      t3 = dotproduct(Q, spvak6k5)
      brack = (((2.0_ki)*(t1*t2*t3+t1*t2*abb183n32)+t2*abb183n20+t2*t3*abb183n21&
      &-(t2*t3*abb183n4+t2*abb183n3))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram183(Q, mu2, epspow, res)
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
      ! d183: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram183
end module uussbb_d183h0l1
