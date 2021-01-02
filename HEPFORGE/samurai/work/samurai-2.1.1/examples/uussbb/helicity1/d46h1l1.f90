module     uussbb_d46h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d46h1l1.f9
   ! 0
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
      real(ki) :: brack
      
      brack = (1.0_ki)/(es34*es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c1/NC-c2))
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
      
      t1 = dotproduct(Q, spvak5k4)
      t2 = dotproduct(Q, spvak5k2)
      t3 = dotproduct(Q, spvak5k3)
      t4 = dotproduct(Q, spvak4k6)
      t5 = dotproduct(Q, spvak4k3)
      t6 = dotproduct(Q, spvak1k6)
      t7 = dotproduct(Q, Q)
      brack = (((4.0_ki)*(t2*t5*abb46n16+t2*t6*abb46n8+t3*abb46n13*dotproduct(Q,&
      & k2)-(t3*t4*abb46n5+t2*t5*t6+t1*t4*abb46n10+t3*abb46n4+t2*abb46n14+t1*abb&
      &46n1))+(2.0_ki)*(t3*abb46n2+t3*t4*abb46n11+t3*abb46n10*dotproduct(Q, spva&
      &k3k6)+t3*abb46n13*es234+t3*abb46n9*dotproduct(Q, spvak1k2)-(t4*t7*abb46n2&
      &0+t3*abb46n17*dotproduct(Q, spvak4k2)+t3*abb46n15*dotproduct(Q, spvak3k2)&
      &+t3*abb46n13*es34+t3*t7*abb46n13+t3*t6*abb46n3+t7*abb46n18+t3*abb46n12))+&
      &(2.0_ki)*(abb46n19+t3*abb46n13+t4*abb46n20-(2.0_ki)*t5*abb46n21)*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak4k3)
      t2 = dotproduct(Q, spvak1k6)
      t3 = dotproduct(Q, spvak5k2)
      brack = ((4.0_ki)*((t1*abb46n21-abb46n6)*mu2+t2*abb46n7+t1*t2*t3-(t2*t3*ab&
      &b46n8+t1*t2*abb46n22))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram46(Q, mu2, epspow, res)
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
      ! d46: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram46
end module uussbb_d46h1l1
