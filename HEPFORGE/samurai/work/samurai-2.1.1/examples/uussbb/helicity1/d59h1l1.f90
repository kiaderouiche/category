module     uussbb_d59h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d59h1l1.f9
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
      
      brack = (-1.0_ki)*abb59n1/(es34*es56)*i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*NC*(c5-c3))
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
      
      t1 = dotproduct(Q, spvak5k6)
      t2 = dotproduct(Q, Q)
      t3 = dotproduct(Q, k5)
      t4 = dotproduct(Q, spvak5k3)
      t5 = dotproduct(Q, spvak5k2)
      brack = ((4.0_ki)*(-(t1*abb59n15*dotproduct(Q, k4)+t1*abb59n15*dotproduct(&
      &Q, k3)+t1*abb59n15*dotproduct(Q, k2)+t1*abb59n15*dotproduct(Q, k1)+t1*abb&
      &59n15*es34))+(2.0_ki)*(t1*abb59n14+t2*abb59n18+t2*abb59n21+t2*abb59n3+t3*&
      &abb59n12+t3*abb59n19+t3*abb59n26+abb59n30*dotproduct(Q, spvak1k6)+t1*abb5&
      &9n15*es345+t1*abb59n31*dotproduct(Q, spvak1k2)-(t1*abb59n29*dotproduct(Q,&
      & spvak4k3)+abb59n9*dotproduct(Q, spvak2k6)+abb59n27*dotproduct(Q, spvak4k&
      &6)+abb59n11*dotproduct(Q, spvak3k6)+t3*abb59n3+t3*abb59n21+t3*abb59n18+t2&
      &*abb59n26+t2*abb59n19+t2*abb59n12+t1*abb59n17))+(t1*abb59n15-(2.0_ki)*abb&
      &59n25)*es56+(2.0_ki)*(abb59n12+abb59n19+abb59n26-(abb59n3+abb59n21+abb59n&
      &18))*mu2+t1*abb59n24+t4*abb59n16+t4*abb59n2+t5*abb59n22+t5*abb59n4-(abb59&
      &n7*dotproduct(Q, spvak5k1)+abb59n13*dotproduct(Q, spvak5k4)+t5*abb59n8+t4&
      &*abb59n28+t4*abb59n10+t1*abb59n5+t1*abb59n20))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      
      t1 = dotproduct(Q, spvak5k6)
      brack = ((2.0_ki)*(t1*abb59n15*es34+t1*abb59n29*dotproduct(Q, spvak4k3)-(t&
      &1*abb59n31*dotproduct(Q, spvak1k2)+t1*abb59n14))+(4.0_ki)*(t1*abb59n15*do&
      &tproduct(Q, k1)+t1*abb59n15*dotproduct(Q, k2)+t1*abb59n15*dotproduct(Q, k&
      &3)+t1*abb59n15*dotproduct(Q, k4))+t1*abb59n23+t1*abb59n6)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram59(Q, mu2, epspow, res)
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
      ! d59: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram59
end module uussbb_d59h1l1
