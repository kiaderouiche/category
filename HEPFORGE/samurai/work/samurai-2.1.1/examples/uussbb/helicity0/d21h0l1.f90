module     uussbb_d21h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d21h0l1.f9
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
      
      brack = (abb21n1/(es34*es56*es56))
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
      t2 = dotproduct(Q, spvak1k5)
      t3 = dotproduct(Q, spvak6k1)
      t4 = dotproduct(Q, spvak2k5)
      t5 = dotproduct(Q, spvak6k2)
      t6 = dotproduct(Q, spvak3k5)
      t7 = dotproduct(Q, spvak6k3)
      t8 = dotproduct(Q, spvak4k5)
      t9 = dotproduct(Q, spvak6k4)
      t10 = dotproduct(Q, spvak4k3)
      t11 = dotproduct(Q, spvak6k5)
      brack = (((4.0_ki)*(t1*abb21n22+t1*abb21n24+t10*t11*abb21n21+t11*abb21n30*&
      &dotproduct(Q, spvak1k2)-(t8*t9*abb21n16+t6*t7*abb21n16+t4*t5*abb21n16+t2*&
      &t3*abb21n16+t10*t11*abb21n27+t1*abb21n23+t1*abb21n17))+(2.0_ki)*(t2*abb21&
      &n29+t2*abb21n6+t3*abb21n8+t5*abb21n10+t7*abb21n12+t7*abb21n26+t8*abb21n19&
      &+t8*abb21n2+t9*abb21n15-(t8*abb21n25+t8*abb21n14+t7*abb21n3+t7*abb21n20+t&
      &6*abb21n11+t5*abb21n5+t5*abb21n28+t4*abb21n9+t2*abb21n7))+(4.0_ki)*(abb21&
      &n18+abb21n23+abb21n4-(abb21n24+abb21n22+abb21n13))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram21(Q, mu2, epspow, res)
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
      ! d21: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram21
end module uussbb_d21h0l1
