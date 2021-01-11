module     uussbb_d240h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d240h0l1.f
   ! 90
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

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

contains
   pure function brack_1(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = (abb240n1/(es34*es345)*i_)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      real(ki) :: t1
      
      t1 = NC*NC
      brack = (TR*TR*TR*(c1/(t1*NC)+c5/NC-(c4/t1+c2/t1)))
   end  function brack_2
   pure function brack_3(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = dotproduct(Q, spvak1k5)
      t3 = dotproduct(Q, spvak6k2)
      brack = ((4.0_ki)*(t1*abb240n3+t1*t3*abb240n6-(t2*t3*abb240n7+mu2*abb240n5&
      &+t2*abb240n4)))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      
      t1 = dotproduct(Q, spvak6k2)
      brack = ((4.0_ki)*(mu2*abb240n5+t1*abb240n7*dotproduct(Q, spvak1k5)-(t1*ab&
      &b240n6*dotproduct(Q, spvak1k3)+t1*abb240n2)))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram240(Q, mu2, epspow, res)
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
      ! d240: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram240
end module uussbb_d240h0l1
