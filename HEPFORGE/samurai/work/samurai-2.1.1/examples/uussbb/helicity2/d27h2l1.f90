module     uussbb_d27h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d27h2l1.f9
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
      
      brack = (abb27n1/(es34*es34*es56))
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
      t2 = dotproduct(Q, spvak3k4)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, spvak1k4)
      t5 = dotproduct(Q, spvak3k1)
      t6 = dotproduct(Q, spvak2k4)
      t7 = dotproduct(Q, spvak3k2)
      t8 = dotproduct(Q, spvak3k5)
      t9 = dotproduct(Q, spvak5k4)
      t10 = dotproduct(Q, spvak3k6)
      t11 = dotproduct(Q, spvak6k4)
      brack = (((4.0_ki)*(t1*abb27n27+t1*abb27n3+t1*abb27n6+t10*t11*abb27n24+t2*&
      &t3*abb27n11+t4*t5*abb27n24+t6*t7*abb27n24+t8*t9*abb27n24-(t2*abb27n31*dot&
      &product(Q, spvak1k2)+t2*t3*abb27n29+t1*abb27n5+t1*abb27n10))+(2.0_ki)*(t1&
      &0*abb27n17+t10*abb27n26+t11*abb27n20+t4*abb27n30+t5*abb27n4+t7*abb27n14+t&
      &9*abb27n19+t9*abb27n8-(t9*abb27n25+t9*abb27n16+t8*abb27n21+t7*abb27n7+t6*&
      &abb27n15+t4*abb27n12+t10*abb27n9+t10*abb27n22))+(4.0_ki)*(abb27n13+abb27n&
      &2+abb27n23+abb27n5-(abb27n6+abb27n3+abb27n28+abb27n18))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram27(Q, mu2, epspow, res)
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
      ! d27: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram27
end module uussbb_d27h2l1
