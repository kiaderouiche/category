module     uussbb_d197h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d197h0l1.f
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
      
      brack = (1.0_ki)/es56
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c6+((1.0_ki)/NC-NC)*c5-c3/NC))
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
      t2 = dotproduct(Q, spvak1k5)
      t3 = dotproduct(Q, spvak4k3)
      t4 = dotproduct(Q, spvak6k5)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, spvak6k3)
      t7 = dotproduct(Q, spvak1k3)
      t8 = dotproduct(Q, Q)
      t9 = dotproduct(Q, spvak5k3)
      brack = (((4.0_ki)*(t1*abb197n5-(t3*t4*abb197n7+t3*t4*t5+t1*t2*abb197n24))&
      &+(2.0_ki)*(t3*abb197n4+t3*abb197n8+t6*abb197n10+t7*abb197n2+t8*abb197n5+t&
      &2*t6*abb197n29+t2*t9*abb197n28+t3*t5*abb197n21+t3*t6*abb197n11+t5*t6*abb1&
      &97n25+t6*t8*abb197n19-(t6*abb197n28*dotproduct(Q, spvak1k6)+t3*t5*abb197n&
      &30+t2*t8*abb197n24+t2*t7*abb197n3+t2*t6*abb197n27+t2*t3*abb197n26+t9*abb1&
      &97n9+t6*abb197n12+t3*abb197n6))+((2.0_ki)*(abb197n17+t2*abb197n24+(2.0_ki&
      &)*t4*abb197n1-(t6*abb197n19+abb197n16))+abb197n20+abb197n23-(abb197n22+ab&
      &b197n18))*mu2)*i_)
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
      brack = (((2.0_ki)*(t1*t2*t3-t1*t2*abb197n15)+t1*abb197n13+t1*t3*abb197n30&
      &-(t1*t3*abb197n21+t1*abb197n14))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram197(Q, mu2, epspow, res)
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
      ! d197: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram197
end module uussbb_d197h0l1
