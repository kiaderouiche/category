module     uussbb_d253h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d253h1l1.f
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
      brack = (TR*TR*TR*((-((1.0_ki)/t1+(1.0_ki)))*c2+c1/(t1*NC)+(2.0_ki)/NC*c3+&
      &c5/NC-(c6/t1+c4/t1)))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak4k2)
      t3 = dotproduct(Q, spvak5k4)
      t4 = dotproduct(Q, spvak5k2)
      t5 = t2*abb253n12
      brack = ((8.0_ki)*(t1*abb253n2+abb253n2*dotproduct(Q, k1))+(4.0_ki)*(abb25&
      &3n1+abb253n3*dotproduct(Q, spvak5k1)+t1*t4*abb253n7+t2*t3*abb253n7-(t3*ab&
      &b253n5+t2*abb253n11))+(4.0_ki)*(abb253n8-t5)*es56+(4.0_ki)*(t5-abb253n8)*&
      &es234+((2.0_ki)*(abb253n9+t4*abb253n7-(abb253n6*dotproduct(Q, spvak5k3)+t&
      &5))+abb253n10*dotproduct(Q, spvak4k3)+abb253n14*dotproduct(Q, spvak1k2)+a&
      &bb253n4*dotproduct(Q, spvak5k6))*mu2)
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
      brack = (t1*t2*abb253n13+t1*t2*dotproduct(Q, spvak5k6))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram253(Q, mu2, epspow, res)
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
      ! d253: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram253
end module uussbb_d253h1l1
