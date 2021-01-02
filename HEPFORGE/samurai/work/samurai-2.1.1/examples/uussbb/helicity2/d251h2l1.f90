module     uussbb_d251h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d251h2l1.f
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
      
      brack = i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      real(ki) :: t1
      
      t1 = NC*NC
      brack = (TR*TR*TR*((-((1.0_ki)/t1+(1.0_ki)))*c6+c1/(t1*NC)+c3/NC+(2.0_ki)/&
      &NC*c5-(c4/t1+c2/t1)))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak3k2)
      t3 = dotproduct(Q, spvak5k3)
      t4 = dotproduct(Q, spvak5k2)
      brack = ((8.0_ki)*(-(abb251n2*dotproduct(Q, k1)+t1*abb251n2))+(4.0_ki)*(ab&
      &b251n1+t3*abb251n5-(t2*t3*abb251n7+t1*t4*abb251n7+abb251n3*dotproduct(Q, &
      &spvak5k1)+t2*abb251n10))+((2.0_ki)*(t2*abb251n11+abb251n6*dotproduct(Q, s&
      &pvak5k4)-(t4*abb251n7+abb251n8))-(abb251n9*dotproduct(Q, spvak3k4)+abb251&
      &n4*dotproduct(Q, spvak5k6)+abb251n13*dotproduct(Q, spvak1k2)))*mu2)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak3k4)
      brack = (-(t1*t2*dotproduct(Q, spvak5k6)+t1*t2*abb251n12))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram251(Q, mu2, epspow, res)
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
      ! d251: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram251
end module uussbb_d251h2l1
