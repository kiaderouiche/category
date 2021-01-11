module     uussbb_d176h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d176h2l1.f
   ! 90
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
      real(ki) :: t1
      
      t1 = es12+es56-(es34+es123)
      brack = (abb176n1/(t1*t1*es56)*i_)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      real(ki) :: t1
      real(ki) :: t2
      
      t1 = NC*NC
      t2 = (1.0_ki)-(1.0_ki)/t1
      brack = (TR*TR*TR*(((1.0_ki)/(t1*NC)-(1.0_ki)/NC)*c1+((1.0_ki)/NC-NC)*c3+t&
      &2*c2+t2*c6))
   end  function brack_2
   pure function brack_3(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = ((4.0_ki)*(abb176n4*dotproduct(Q, spvak3k4)+abb176n5*dotproduct(Q,&
      & spvak5k4)-(abb176n3*dotproduct(Q, spvak5k2)+abb176n2*dotproduct(Q, spvak&
      &3k2))))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      
      brack = ((4.0_ki)*(abb176n2*dotproduct(Q, spvak3k2)+abb176n3*dotproduct(Q,&
      & spvak5k2)-(abb176n5*dotproduct(Q, spvak5k4)+abb176n4*dotproduct(Q, spvak&
      &3k4))))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram176(Q, mu2, epspow, res)
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
      ! d176: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram176
end module uussbb_d176h2l1
