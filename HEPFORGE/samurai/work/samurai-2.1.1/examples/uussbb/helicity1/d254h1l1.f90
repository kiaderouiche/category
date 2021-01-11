module     uussbb_d254h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d254h1l1.f
   ! 90
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
      brack = (TR*TR*TR*((-((1.0_ki)/t1+(1.0_ki)))*c4+c1/(t1*NC)+c3/NC+(2.0_ki)/&
      &NC*c5-(c6/t1+c2/t1)))
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
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = t1*abb254n15
      t3 = dotproduct(Q, spvak5k1)
      t4 = dotproduct(Q, Q)
      t5 = dotproduct(Q, spvak5k3)
      brack = ((4.0_ki)*((abb254n11-t2)*es234+(t2-abb254n11)*es56+t1*abb254n14+a&
      &bb254n2*dotproduct(Q, spvak1k4)+abb254n4*dotproduct(Q, spvak2k4)+abb254n6&
      &*dotproduct(Q, spvak6k4)+t1*t3*abb254n8+t4*t5*abb254n8-(t4*abb254n7+t3*ab&
      &b254n3+abb254n1))+((2.0_ki)*(t2+t5*abb254n8-(abb254n9*dotproduct(Q, spvak&
      &5k2)+abb254n12))-(abb254n5*dotproduct(Q, spvak5k6)+abb254n16*dotproduct(Q&
      &, spvak1k2)+abb254n10*dotproduct(Q, spvak4k3)))*mu2)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak4k3)
      brack = (-(t1*t2*dotproduct(Q, spvak5k6)+t1*t2*abb254n13))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram254(Q, mu2, epspow, res)
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
      ! d254: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram254
end module uussbb_d254h1l1
