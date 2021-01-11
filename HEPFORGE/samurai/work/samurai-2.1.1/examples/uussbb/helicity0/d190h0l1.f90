module     uussbb_d190h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d190h0l1.f
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
      real(ki) :: brack
      
      brack = (1.0_ki)/es34
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c6+c5/NC-(c3/NC+c2)))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak1k2)
      t3 = dotproduct(Q, spvak4k3)
      t4 = dotproduct(Q, spvak6k5)
      t5 = dotproduct(Q, spvak1k5)
      t6 = dotproduct(Q, spvak6k2)
      t7 = dotproduct(Q, spvak4k1)
      t8 = dotproduct(Q, spvak4k6)
      t9 = dotproduct(Q, spvak4k5)
      t10 = dotproduct(Q, spvak4k2)
      brack = (((4.0_ki)*(t1*abb190n24+t1*abb190n33+t1*abb190n8+(2.0_ki)*t1*t3*a&
      &bb190n35+t3*t4*abb190n38+t3*t5*abb190n4-(t3*t6*abb190n42+t2*t3*abb190n21+&
      &abb190n8*dotproduct(Q, k1)+abb190n28*dotproduct(Q, k6)+t1*abb190n7+t1*abb&
      &190n28))+(2.0_ki)*(t2*abb190n19+t4*abb190n37+t5*abb190n3+t6*abb190n39+t7*&
      &abb190n13+t7*abb190n5+t8*abb190n25+t8*abb190n30+t2*t7*abb190n40-(t6*t8*ab&
      &b190n40+t1*t9*abb190n29+t1*t10*abb190n40+abb190n9*dotproduct(Q, spvak2k1)&
      &+abb190n26*dotproduct(Q, spvak3k6)+abb190n23*dotproduct(Q, spvak2k6)+abb1&
      &90n18*dotproduct(Q, spvak1k6)+abb190n12*dotproduct(Q, spvak6k1)+abb190n10&
      &*dotproduct(Q, spvak3k1)+t8*abb190n32+t8*abb190n27+t7*abb190n16+t7*abb190&
      &n11+t6*abb190n41+t5*abb190n2+t4*abb190n1+t2*abb190n20+t1*abb190n22))+((2.&
      &0_ki)*(abb190n31+abb190n6+t10*abb190n40+t9*abb190n29-((2.0_ki)*t3*abb190n&
      &35+abb190n34))+abb190n15-(abb190n36+abb190n17+abb190n14))*mu2)*i_)
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
      brack = (((2.0_ki)*(-(t1*t2*abb190n38+t1*t2*t3))+t2*abb190n1+t2*t3*abb190n&
      &43-(t2*t3*abb190n44+t2*abb190n37))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram190(Q, mu2, epspow, res)
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
      ! d190: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram190
end module uussbb_d190h0l1
