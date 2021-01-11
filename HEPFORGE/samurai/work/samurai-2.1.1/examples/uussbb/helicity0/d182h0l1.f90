module     uussbb_d182h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d182h0l1.f
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
      
      brack = abb182n1
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*((NC-(1.0_ki)/NC)*c3+c5/NC-c2))
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
      
      t1 = dotproduct(Q, k3)
      t2 = dotproduct(Q, spvak6k2)
      t3 = dotproduct(Q, spvak1k2)
      t4 = dotproduct(Q, spvak4k3)
      t5 = dotproduct(Q, spvak6k5)
      t6 = dotproduct(Q, spvak6k3)
      t7 = dotproduct(Q, spvak1k3)
      t8 = dotproduct(Q, spvak2k3)
      t9 = dotproduct(Q, Q)
      brack = (((4.0_ki)*(t1*t2*abb182n17+t3*t4*t5+t3*t4*abb182n35-t1*abb182n8)+&
      &(2.0_ki)*(t4*abb182n12+t4*abb182n2+t4*abb182n26+t6*abb182n10+t7*abb182n31&
      &+t7*abb182n4+t2*t4*abb182n18+t2*t7*abb182n6+t2*t8*abb182n16+t2*t9*abb182n&
      &17+t4*t5*abb182n15+t4*t5*abb182n29+t5*t7*abb182n33-(t7*abb182n16*dotprodu&
      &ct(Q, spvak6k1)+t7*t9*abb182n34+t4*t7*abb182n32+t4*t5*abb182n23+t2*t7*abb&
      &182n30+t2*t6*abb182n19+t9*abb182n8+t8*abb182n7+t7*abb182n5+t4*abb182n9+t4&
      &*abb182n20))+((2.0_ki)*(abb182n21+t7*abb182n34-((2.0_ki)*t3*abb182n36+t2*&
      &abb182n17+abb182n27+abb182n13))+abb182n11-(abb182n3+abb182n25+abb182n24))&
      &*mu2)*i_)
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
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak4k3)
      brack = (((2.0_ki)*(-(t1*t2*abb182n37+t1*t2*t3))+t2*abb182n22+t2*t3*abb182&
      &n23-(t2*t3*abb182n29+t2*t3*abb182n15+t2*abb182n28+t2*abb182n14))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram182(Q, mu2, epspow, res)
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
      ! d182: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram182
end module uussbb_d182h0l1
