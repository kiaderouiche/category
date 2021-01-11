module     uussbb_d15h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d15h0l1.f9
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
      
      brack = (abb15n1/(es34*es56)*i_)
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
      brack = ((8.0_ki)*((abb15n7+t1*abb15n11+t2*abb15n6+t3*abb15n8)*mu2+t4*abb1&
      &5n2+t5*abb15n4+(2.0_ki)*t1*t2*t3+t4*abb15n3*dotproduct(Q, spvak4k5)+t4*ab&
      &b15n9*dotproduct(Q, spvak1k3)-(t5*abb15n5*dotproduct(Q, spvak6k3)+t5*abb1&
      &5n10*dotproduct(Q, spvak4k2)+t3*t6*abb15n8+t2*t6*abb15n6+t1*t6*abb15n11))&
      &)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_4

   pure subroutine diagram15(Q, mu2, epspow, res)
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
      ! d15: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_4(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram15
end module uussbb_d15h0l1
