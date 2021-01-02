module     uussbb_d193h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d193h1l1.f
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
      
      brack = (i_/es34)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      real(ki) :: t1
      
      t1 = NC*NC
      brack = (TR*TR*TR*(c1/(t1*NC)+c3/NC+c5/NC-(c6/t1+(2.0_ki)/t1*c4)))
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
      complex(ki) :: t7
      
      t1 = dotproduct(Q, k5)
      t2 = dotproduct(Q, spvak5k3)
      t3 = dotproduct(Q, Q)
      t4 = dotproduct(Q, spvak1k5)
      t5 = dotproduct(Q, spvak1k3)
      t6 = t2*abb193n6
      t7 = abb193n5-t6
      brack = ((8.0_ki)*(t1*t2*abb193n6-t1*abb193n5)+(4.0_ki)*(t3*abb193n10+abb1&
      &93n1*dotproduct(Q, spvak6k1)+abb193n2*dotproduct(Q, spvak2k1)+abb193n3*do&
      &tproduct(Q, spvak5k1)+t2*t4*abb193n12-(t3*t5*abb193n12+t2*t3*abb193n6+t4*&
      &abb193n11))+(4.0_ki)*(t6-abb193n5)*es234+(2.0_ki)*(abb193n7*dotproduct(Q,&
      & spvak4k6)+abb193n9*dotproduct(Q, spvak4k2)-(t5*abb193n12+abb193n8+t6))*m&
      &u2+(4.0_ki)*t7*es56+(4.0_ki)*t7*es61)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak5k6)
      t2 = dotproduct(Q, spvak1k3)
      brack = ((2.0_ki)*(t1*t2*dotproduct(Q, spvak4k2)+t1*mu2*abb193n4-t1*t2*abb&
      &193n13))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram193(Q, mu2, epspow, res)
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
      ! d193: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram193
end module uussbb_d193h1l1
