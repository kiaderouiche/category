module     uussbb_d255h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d255h1l1.f
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
      brack = (TR*TR*TR*((-((1.0_ki)/t1+(1.0_ki)))*c4+c1/(t1*NC)+(2.0_ki)/NC*c3+&
      &c5/NC-(c6/t1+c2/t1)))
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
      
      t1 = dotproduct(Q, spvak1k6)
      t2 = t1*abb255n13
      t3 = t2+abb255n3
      t4 = dotproduct(Q, spvak4k1)
      t5 = dotproduct(Q, Q)
      t6 = dotproduct(Q, spvak4k6)
      brack = ((4.0_ki)*((-(abb255n3+t2))*es234+t3*es56+t3*es61+t4*abb255n2+abb2&
      &55n6*dotproduct(Q, spvak3k5)+t1*t4*abb255n8+t5*t6*abb255n8-(abb255n5*dotp&
      &roduct(Q, spvak2k5)+abb255n4*dotproduct(Q, spvak1k5)+t5*abb255n7))+((2.0_&
      &ki)*(abb255n9+t6*abb255n8+abb255n11*dotproduct(Q, spvak4k2)-t2)-(abb255n1&
      &4*dotproduct(Q, spvak1k2)+abb255n10*dotproduct(Q, spvak4k3)+abb255n1*dotp&
      &roduct(Q, spvak5k6)))*mu2)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak5k6)
      brack = (-(t1*t2*dotproduct(Q, spvak4k3)+t1*t2*abb255n12))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram255(Q, mu2, epspow, res)
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
      ! d255: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram255
end module uussbb_d255h1l1
