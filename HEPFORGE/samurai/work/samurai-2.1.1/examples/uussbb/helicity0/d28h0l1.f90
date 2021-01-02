module     uussbb_d28h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d28h0l1.f9
   ! 0
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

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (abb28n1/(es34*es34*es56))
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
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak6k5)
      t4 = dotproduct(Q, spvak1k3)
      t5 = dotproduct(Q, spvak4k1)
      t6 = dotproduct(Q, spvak2k3)
      t7 = dotproduct(Q, spvak4k2)
      t8 = dotproduct(Q, spvak4k5)
      t9 = dotproduct(Q, spvak5k3)
      t10 = dotproduct(Q, spvak4k6)
      t11 = dotproduct(Q, spvak6k3)
      brack = (((4.0_ki)*(t1*abb28n25+t1*abb28n6+t10*t11*abb28n22+t2*t3*abb28n10&
      &+t4*t5*abb28n22+t6*t7*abb28n22+t8*t9*abb28n22-(t2*abb28n29*dotproduct(Q, &
      &spvak1k2)+t2*t3*abb28n27+t1*abb28n9+t1*abb28n2))+(2.0_ki)*(t10*abb28n20+t&
      &11*abb28n12+t11*abb28n23+t4*abb28n4+t6*abb28n15+t7*abb28n11+t8*abb28n19+t&
      &8*abb28n8-(t9*abb28n17+t8*abb28n24+t8*abb28n13+t7*abb28n16+t5*abb28n5+t4*&
      &abb28n28+t11*abb28n7+t11*abb28n18))+(4.0_ki)*(abb28n21+abb28n3+abb28n9-(a&
      &bb28n6+abb28n26+abb28n14))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram28(Q, mu2, epspow, res)
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
      ! d28: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram28
end module uussbb_d28h0l1
