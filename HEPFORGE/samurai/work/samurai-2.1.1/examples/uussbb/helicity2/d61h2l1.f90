module     uussbb_d61h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d61h2l1.f9
   ! 0
   ! generator: haggies (1.1)
   use precision, only: ki
   use uussbb_config
   use uussbb_model
   use uussbb_kinematics
   use uussbb_util, only: cond
   use uussbb_color
   use uussbb_abbrevh2l1
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
      
      brack = (-1.0_ki)*abb61n1/(es34*es56)*i_
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
      
      t1 = dotproduct(Q, spvak3k4)
      t2 = dotproduct(Q, Q)
      t3 = dotproduct(Q, k3)
      t4 = dotproduct(Q, spvak3k6)
      t5 = dotproduct(Q, spvak3k2)
      brack = ((4.0_ki)*(t1*abb61n26*dotproduct(Q, k1)+t1*abb61n26*dotproduct(Q,&
      & k2)+t1*abb61n26*dotproduct(Q, k5)+t1*abb61n26*dotproduct(Q, k6))+(2.0_ki&
      &)*(t1*abb61n25+t1*abb61n5+t2*abb61n13+t2*abb61n2+t2*abb61n23+t2*abb61n6+t&
      &3*abb61n17+t3*abb61n3+t3*abb61n30+t3*abb61n8+abb61n15*dotproduct(Q, spvak&
      &2k4)+abb61n27*dotproduct(Q, spvak5k4)+t1*abb61n26*es56-(t1*abb61n35*dotpr&
      &oduct(Q, spvak1k2)+t1*abb61n33*dotproduct(Q, spvak5k6)+abb61n34*dotproduc&
      &t(Q, spvak1k4)+abb61n20*dotproduct(Q, spvak6k4)+t3*abb61n6+t3*abb61n23+t3&
      &*abb61n2+t3*abb61n13+t2*abb61n8+t2*abb61n30+t2*abb61n3+t2*abb61n17))+(t1*&
      &abb61n26-(2.0_ki)*abb61n29)*es34+(2.0_ki)*(abb61n17+abb61n3+abb61n30+abb6&
      &1n8-(abb61n6+abb61n23+abb61n2+abb61n13))*mu2+t1*abb61n10+t1*abb61n18+t1*a&
      &bb61n31+t1*abb61n7+t4*abb61n16+t4*abb61n28+t5*abb61n14+abb61n4*dotproduct&
      &(Q, spvak3k1)-(abb61n21*dotproduct(Q, spvak3k5)+t5*abb61n9+t4*abb61n22+t4&
      &*abb61n11+t1*abb61n12))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      
      t1 = dotproduct(Q, spvak3k4)
      brack = ((2.0_ki)*(t1*abb61n24+t1*abb61n33*dotproduct(Q, spvak5k6)+t1*abb6&
      &1n35*dotproduct(Q, spvak1k2)-t1*abb61n26*es56)+(4.0_ki)*(-(t1*abb61n26*do&
      &tproduct(Q, k6)+t1*abb61n26*dotproduct(Q, k5)+t1*abb61n26*dotproduct(Q, k&
      &2)+t1*abb61n26*dotproduct(Q, k1)))-(t1*abb61n32+t1*abb61n19))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram61(Q, mu2, epspow, res)
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
      ! d61: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram61
end module uussbb_d61h2l1
