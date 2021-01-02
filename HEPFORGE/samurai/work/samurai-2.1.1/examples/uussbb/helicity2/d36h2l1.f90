module     uussbb_d36h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d36h2l1.f9
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
      
      brack = (abb36n1/(es34*es56))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak1k3)
      t3 = dotproduct(Q, spvak3k2)
      t4 = dotproduct(Q, spvak1k4)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak1k5)
      t7 = dotproduct(Q, spvak5k2)
      t8 = dotproduct(Q, spvak1k6)
      t9 = dotproduct(Q, spvak6k2)
      t10 = dotproduct(Q, spvak1k2)
      brack = (((4.0_ki)*(t1*abb36n19+t10*abb36n27*dotproduct(Q, spvak5k6)+t2*t3&
      &*abb36n26+t4*t5*abb36n26-(t8*t9*abb36n26+t6*t7*abb36n26+t10*abb36n28*dotp&
      &roduct(Q, spvak3k4)+t1*abb36n23+t1*abb36n16))+(2.0_ki)*(t2*abb36n10+t3*ab&
      &b36n2+t3*abb36n6+t4*abb36n12+t7*abb36n7+t8*abb36n14+t9*abb36n8-(t8*abb36n&
      &15+t7*abb36n9+t7*abb36n3+t6*abb36n13+t5*abb36n5+t4*abb36n11+t3*abb36n4))+&
      &(4.0_ki)*(abb36n16+abb36n18+abb36n21+abb36n24-(abb36n25+abb36n22+abb36n20&
      &+abb36n17))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram36(Q, mu2, epspow, res)
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
      ! d36: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram36
end module uussbb_d36h2l1
