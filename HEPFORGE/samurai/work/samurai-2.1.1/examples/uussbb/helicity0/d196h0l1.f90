module     uussbb_d196h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d196h0l1.f
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
      complex(ki) :: brack
      
      brack = (i_/es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      real(ki) :: t1
      
      t1 = NC*NC
      brack = (TR*TR*TR*(((1.0_ki)/(t1*NC)+(1.0_ki)/NC)*c1+c3/NC+c5/NC-((2.0_ki)&
      &/t1*c6+c2/t1+c4)))
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
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = t1*abb196n15
      t3 = dotproduct(Q, spvak1k2)
      t4 = t3*abb196n17
      t5 = dotproduct(Q, spvak6k1)
      t6 = dotproduct(Q, Q)
      t7 = dotproduct(Q, spvak6k2)
      t8 = dotproduct(Q, spvak6k3)
      brack = ((2.0_ki)*((2.0_ki)*(abb196n1+(t4-(abb196n3+t2))*es234+(t2+abb196n&
      &3-t4)*es56+t1*abb196n14+t5*abb196n2+abb196n4*dotproduct(Q, spvak1k4)+abb1&
      &96n5*dotproduct(Q, spvak2k4)+t1*t5*abb196n9+t6*t8*abb196n9-(t6*t7*abb196n&
      &10+t3*t5*abb196n10+abb196n6*dotproduct(Q, spvak3k4)+t6*abb196n8+t3*abb196&
      &n16))+(t8*abb196n9+abb196n13*dotproduct(Q, spvak1k5)-(abb196n11*dotproduc&
      &t(Q, spvak4k5)+t7*abb196n10+abb196n7))*mu2))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, spvak4k5)
      brack = ((2.0_ki)*(-(t1*mu2*abb196n17+t1*t2*dotproduct(Q, spvak6k3)+t1*t2*&
      &abb196n12)))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram196(Q, mu2, epspow, res)
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
      ! d196: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram196
end module uussbb_d196h0l1
