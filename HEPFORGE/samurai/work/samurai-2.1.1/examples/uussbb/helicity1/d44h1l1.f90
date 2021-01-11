module     uussbb_d44h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d44h1l1.f9
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
      complex(ki) :: brack
      
      brack = (abb44n1/es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c1/NC-c4))
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
      
      t1 = dotproduct(Q, spvak4k6)
      t2 = dotproduct(Q, spvak1k6)
      t3 = dotproduct(Q, spvak2k6)
      t4 = dotproduct(Q, spvak5k2)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, spvak5k3)
      t7 = dotproduct(Q, Q)
      brack = (((4.0_ki)*(t1*abb44n14+t1*t6*abb44n6+t2*abb44n21*es34-(t3*t4*abb4&
      &4n10+t2*abb44n21*dotproduct(Q, k4)+t2*t4*abb44n8+t1*t5*abb44n23+t1*t5*t6+&
      &t3*abb44n9+t2*abb44n7+t2*abb44n2))+(2.0_ki)*(t2*abb44n20+t2*abb44n3+t7*ab&
      &b44n11+t2*t4*abb44n16+t2*t6*abb44n18+t2*t7*abb44n21+t2*abb44n10*dotproduc&
      &t(Q, spvak5k1)+t2*abb44n15*dotproduct(Q, spvak4k1)+t2*abb44n17*dotproduct&
      &(Q, spvak4k2)+t4*t7*abb44n12-(t2*abb44n21*es56+t2*abb44n19*dotproduct(Q, &
      &spvak4k3)))+((4.0_ki)*(abb44n13-t5*abb44n24)+(2.0_ki)*(-(t4*abb44n12+t2*a&
      &bb44n21)))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak5k3)
      t3 = dotproduct(Q, spvak4k6)
      brack = ((4.0_ki)*((t1*abb44n24-abb44n5)*mu2+t2*abb44n4+t1*t2*t3-(t2*t3*ab&
      &b44n6+t1*t2*abb44n22))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram44(Q, mu2, epspow, res)
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
      ! d44: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram44
end module uussbb_d44h1l1
