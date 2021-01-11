module     uussbb_d191h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d191h0l1.f
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
      real(ki) :: brack
      
      brack = (1.0_ki)/es34
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c2+c5/NC-(c3/NC+c6)))
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
      complex(ki) :: t8
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, k2)
      t4 = dotproduct(Q, k5)
      t5 = dotproduct(Q, spvak2k3)
      t6 = dotproduct(Q, spvak5k3)
      t7 = dotproduct(Q, spvak6k3)
      t8 = dotproduct(Q, spvak1k3)
      brack = (((8.0_ki)*(t1*t2*abb191n29+t2*t3*abb191n29-t2*t4*abb191n29)+(4.0_&
      &ki)*(t1*abb191n2+t1*abb191n21+t3*abb191n23+t4*abb191n27+t4*abb191n9-(t4*a&
      &bb191n22+t3*abb191n7+t3*abb191n27+t1*abb191n25))+(2.0_ki)*(t5*abb191n4+t5&
      &*abb191n5+t6*abb191n6+abb191n14*dotproduct(Q, spvak2k4)+abb191n17*dotprod&
      &uct(Q, spvak5k4)+abb191n3*dotproduct(Q, spvak5k2)+t6*abb191n1*dotproduct(&
      &Q, spvak6k5)-(t5*abb191n1*dotproduct(Q, spvak6k2)+t1*t8*abb191n35+t1*t7*a&
      &bb191n1+abb191n26*dotproduct(Q, spvak5k6)+abb191n24*dotproduct(Q, spvak2k&
      &6)+abb191n19*dotproduct(Q, spvak2k5)+t6*abb191n18+t5*abb191n16+t1*abb191n&
      &28))+((2.0_ki)*(abb191n27+abb191n8+t7*abb191n1+t8*abb191n35-((2.0_ki)*t2*&
      &abb191n29+abb191n23))-(abb191n30+(3.0_ki)*abb191n20+abb191n15+abb191n13+a&
      &bb191n12))*mu2)*i_)
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
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak6k5)
      brack = (((2.0_ki)*(-(t1*t2*abb191n34+t1*t2*t3))+t1*abb191n10+t1*abb191n33&
      &+t1*t3*abb191n11+t1*t3*abb191n36-(t1*t3*abb191n32+t1*abb191n31))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram191(Q, mu2, epspow, res)
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
      ! d191: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram191
end module uussbb_d191h0l1
