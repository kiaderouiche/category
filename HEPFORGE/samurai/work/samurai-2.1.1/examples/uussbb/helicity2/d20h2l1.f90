module     uussbb_d20h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d20h2l1.f9
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

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (abb20n1/(es34*es56*es56))
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c5-c3))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak1k6)
      t3 = dotproduct(Q, spvak5k1)
      t4 = dotproduct(Q, spvak2k6)
      t5 = dotproduct(Q, spvak5k2)
      t6 = dotproduct(Q, spvak3k6)
      t7 = dotproduct(Q, spvak5k3)
      t8 = dotproduct(Q, spvak4k6)
      t9 = dotproduct(Q, spvak5k4)
      t10 = dotproduct(Q, spvak3k4)
      t11 = dotproduct(Q, spvak5k6)
      brack = (((4.0_ki)*(t1*abb20n24+t1*abb20n27+t10*t11*abb20n21+t11*abb20n32*&
      &dotproduct(Q, spvak1k2)-(t8*t9*abb20n18+t6*t7*abb20n18+t4*t5*abb20n18+t2*&
      &t3*abb20n18+t10*t11*abb20n30+t1*abb20n25+t1*abb20n22))+(2.0_ki)*(t2*abb20&
      &n7+t4*abb20n12+t5*abb20n26+t5*abb20n3+t6*abb20n14+t6*abb20n29+t8*abb20n17&
      &+t9*abb20n19+t9*abb20n9-(t9*abb20n28+t9*abb20n16+t7*abb20n13+t6*abb20n20+&
      &t6*abb20n10+t5*abb20n11+t3*abb20n6+t2*abb20n4+t2*abb20n31))+(4.0_ki)*(abb&
      &20n2+abb20n23+abb20n25+abb20n8-(abb20n5+abb20n27+abb20n24+abb20n15))*mu2)&
      &*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram20(Q, mu2, epspow, res)
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
      acc(:) = acc(:) + cf1(:) * ((cond(epspow.eq.0,brack_3,Q,mu2)))
      ! d20: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram20
end module uussbb_d20h2l1
