module     uussbb_d179h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d179h0l1.f
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
      
      brack = (abb179n1*i_)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      real(ki) :: t1
      
      t1 = NC*NC
      brack = (TR*TR*TR*(((1.0_ki)/(t1*NC)+(1.0_ki)/NC)*c1+c3/NC+c5/NC-(c4/t1+(2&
      &.0_ki)/t1*c2+c6)))
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
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = t1*abb179n14
      t3 = abb179n6-t2
      t4 = dotproduct(Q, spvak3k2)
      t5 = dotproduct(Q, Q)
      t6 = dotproduct(Q, spvak1k2)
      brack = ((2.0_ki)*((2.0_ki)*((t2-abb179n6)*es345+t3*es34+t3*es45+t5*abb179&
      &n9+abb179n2*dotproduct(Q, spvak5k3)+abb179n3*dotproduct(Q, spvak5k4)+abb1&
      &79n5*dotproduct(Q, spvak5k6)+t1*t4*abb179n15-(t5*t6*abb179n15+t4*abb179n1&
      &0))+(t2+abb179n11*dotproduct(Q, spvak4k2)-(abb179n4*dotproduct(Q, spvak6k&
      &2)+abb179n12*dotproduct(Q, spvak1k5)+(2.0_ki)*t6*abb179n15+abb179n7))*mu2&
      &))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      
      t1 = dotproduct(Q, spvak4k3)
      t2 = dotproduct(Q, spvak1k5)
      brack = ((2.0_ki)*(t1*t2*abb179n13+t1*t2*dotproduct(Q, spvak6k2)+t1*mu2*ab&
      &b179n8))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram179(Q, mu2, epspow, res)
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
      ! d179: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram179
end module uussbb_d179h0l1
