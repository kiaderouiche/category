module     uussbb_d31h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d31h1l1.f9
   ! 0
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

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (abb31n1/(es34*es34*es56))
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
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, spvak1k3)
      t5 = dotproduct(Q, spvak4k1)
      t6 = dotproduct(Q, spvak2k3)
      t7 = dotproduct(Q, spvak4k2)
      t8 = dotproduct(Q, spvak4k5)
      t9 = dotproduct(Q, spvak5k3)
      t10 = dotproduct(Q, spvak4k6)
      t11 = dotproduct(Q, spvak6k3)
      brack = (((4.0_ki)*(t1*abb31n26+t1*abb31n6+t10*t11*abb31n23+t2*t3*abb31n10&
      &+t4*t5*abb31n23+t6*t7*abb31n23+t8*t9*abb31n23-(t2*abb31n30*dotproduct(Q, &
      &spvak1k2)+t2*t3*abb31n28+t1*abb31n9+t1*abb31n2))+(2.0_ki)*(t10*abb31n21+t&
      &10*abb31n8+t4*abb31n4+t6*abb31n13+t7*abb31n11+t8*abb31n20+t9*abb31n15+t9*&
      &abb31n24-(t9*abb31n7+t9*abb31n18+t7*abb31n14+t5*abb31n5+t4*abb31n29+t11*a&
      &bb31n19+t10*abb31n25+t10*abb31n16))+(4.0_ki)*(abb31n12+abb31n22+abb31n3-(&
      &abb31n6+abb31n27+abb31n17))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram31(Q, mu2, epspow, res)
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
      ! d31: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram31
end module uussbb_d31h1l1
