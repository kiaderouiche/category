module     uussbb_d6h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d6h0l1.f90
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
   private :: brack_6
   private :: brack_7
   private :: brack_8
   private :: brack_9

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (-1.0_ki)*i_/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c6+NC*(c5-(2.0_ki)*c3)-c2))
   end  function brack_2
   pure function brack_3(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = ((2.0_ki)*(-(abb6n3*dotproduct(Q, spvak6k3)+abb6n1)))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c6+NC*(-((1.0_ki/2.0_ki)*c5+(1.0_ki/2.0_ki)*c3))-c2)&
      &)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (-4.0_ki)*abb6n5*dotproduct(Q, spvak1k2)
   end  function brack_5
   pure function brack_6(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = ((4.0_ki)*abb6n5*dotproduct(Q, spvak1k2))
   end  function brack_6
   pure function brack_7(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c6+NC*(c3-(2.0_ki)*c5)-c2))
   end  function brack_7
   pure function brack_8(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = ((2.0_ki)*(-(abb6n4*dotproduct(Q, spvak4k5)+abb6n2)))
   end  function brack_8
   pure function brack_9(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_9

   pure subroutine diagram6(Q, mu2, epspow, res)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer, intent(in) :: epspow
      complex(ki), dimension(1:numcs), intent(inout) :: res

      complex(ki), dimension(1:numcs) :: acc
      complex(ki) :: prefactor
      complex(ki), dimension(numcs) :: cf1
      complex(ki), dimension(numcs) :: cf2
      complex(ki), dimension(numcs) :: cf3
      integer :: t1
      ! res is set to zero in the calling routines,
      ! therefore we sum to whatever is there already.
      
      acc = 0.0_ki
      prefactor = brack_1(Q, mu2)
      cf1 = brack_2(Q, mu2)
      t1 = 0
      acc(:) = acc(:) + cf1(:) * ((cond(epspow.eq.t1,brack_3,Q,mu2)))
      cf2 = brack_4(Q, mu2)
      acc(:) = acc(:) + cf2(:) * ((cond(epspow.eq.1,brack_6,Q,mu2)+cond(epspow.e&
      &q.t1,brack_5,Q,mu2)))
      cf3 = brack_7(Q, mu2)
      acc(:) = acc(:) + cf3(:) * ((cond(epspow.eq.t1,brack_8,Q,mu2)))
      ! d6: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_9(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram6
end module uussbb_d6h0l1
