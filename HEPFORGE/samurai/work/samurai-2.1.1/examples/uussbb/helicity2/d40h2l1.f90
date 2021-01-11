module     uussbb_d40h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d40h2l1.f9
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
   private :: brack_5

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (-1.0_ki)*abb40n1/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*NC*(c5-c3))
   end  function brack_2
   pure function brack_3(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      
      t1 = dotproduct(Q, spvak1k2)
      brack = (((2.0_ki)*(mu2*abb40n3-(abb40n3*dotproduct(Q, k2)+abb40n3*dotprod&
      &uct(Q, k1)+abb40n3*dotproduct(Q, Q)))+(10.0_ki)*(t1*abb40n5*dotproduct(Q,&
      & k3)+t1*abb40n5*dotproduct(Q, k4)-(t1*abb40n5*dotproduct(Q, k6)+t1*abb40n&
      &5*dotproduct(Q, k5)))+(5.0_ki)*(t1*abb40n5*es34+t1*abb40n6*dotproduct(Q, &
      &spvak5k6)-(t1*abb40n7*dotproduct(Q, spvak3k4)+t1*abb40n5*es56+abb40n2))+(&
      &5.0_ki/2.0_ki)*t1*abb40n4)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      
      t1 = dotproduct(Q, spvak1k2)
      brack = (((4.0_ki)*(t1*abb40n5*es56+t1*abb40n7*dotproduct(Q, spvak3k4)-(t1&
      &*abb40n6*dotproduct(Q, spvak5k6)+t1*abb40n5*es34))+(8.0_ki)*(t1*abb40n5*d&
      &otproduct(Q, k5)+t1*abb40n5*dotproduct(Q, k6)-(t1*abb40n5*dotproduct(Q, k&
      &4)+t1*abb40n5*dotproduct(Q, k3)))-(2.0_ki)*t1*abb40n4)*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram40(Q, mu2, epspow, res)
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
      ! d40: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram40
end module uussbb_d40h2l1
