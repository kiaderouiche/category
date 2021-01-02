module     uussbb_d7h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d7h0l1.f90
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
      
      brack = (abb7n1/(es34*es56)*i_)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*((1.0_ki/2.0_ki)*c3+c1/(NC*NC)-((1.0_ki/2.0_ki)/NC*c6+(1&
      &.0_ki/2.0_ki)/NC*c4+(1.0_ki/2.0_ki)/NC*c2)))
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
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak4k3)
      t4 = dotproduct(Q, spvak6k2)
      t5 = dotproduct(Q, spvak1k5)
      t6 = dotproduct(Q, Q)
      brack = ((8.0_ki)*((abb7n7+t1*abb7n11+t2*abb7n6+t3*abb7n8)*mu2+t4*abb7n2+t&
      &5*abb7n4+(2.0_ki)*t1*t2*t3+t4*abb7n3*dotproduct(Q, spvak4k5)+t4*abb7n9*do&
      &tproduct(Q, spvak1k3)-(t5*abb7n5*dotproduct(Q, spvak6k3)+t5*abb7n10*dotpr&
      &oduct(Q, spvak4k2)+t3*t6*abb7n8+t2*t6*abb7n6+t1*t6*abb7n11)))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram7(Q, mu2, epspow, res)
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
      ! d7: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram7
end module uussbb_d7h0l1
