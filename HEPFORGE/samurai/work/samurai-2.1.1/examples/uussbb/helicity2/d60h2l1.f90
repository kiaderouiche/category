module     uussbb_d60h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d60h2l1.f9
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
      
      brack = (abb60n1/(es34*es56))
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c5/NC-c3/NC))
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
      
      t1 = dotproduct(Q, spvak5k2)
      t2 = dotproduct(Q, spvak5k3)
      t3 = dotproduct(Q, spvak5k4)
      t4 = dotproduct(Q, spvak5k1)
      t5 = dotproduct(Q, spvak1k6)
      t6 = dotproduct(Q, spvak3k6)
      brack = ((2.0_ki)*((abb60n15+abb60n23+abb60n26+abb60n5-(abb60n8+abb60n24+a&
      &bb60n22+abb60n2))*mu2+t1*abb60n25+t1*abb60n3+t3*abb60n19+t3*abb60n9+t1*ab&
      &b60n18*dotproduct(Q, spvak2k6)+t2*t6*abb60n18+t3*t6*abb60n29+t3*abb60n18*&
      &dotproduct(Q, spvak4k6)+t4*t5*abb60n18-(t3*t6*abb60n21+t1*t5*abb60n31+t4*&
      &abb60n6+t3*abb60n27+t3*abb60n16+t2*abb60n13+t1*abb60n11))*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
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
      
      t1 = dotproduct(Q, spvak3k6)
      t2 = dotproduct(Q, spvak2k6)
      t3 = dotproduct(Q, spvak4k6)
      t4 = dotproduct(Q, spvak1k6)
      t5 = dotproduct(Q, spvak5k2)
      t6 = dotproduct(Q, spvak5k4)
      brack = ((2.0_ki)*((abb60n2+abb60n22+abb60n24+abb60n8-(abb60n5+abb60n26+ab&
      &b60n23+abb60n15))*mu2+t1*abb60n10+t1*abb60n20+t4*abb60n30+t4*abb60n4+t1*t&
      &6*abb60n21+t4*t5*abb60n31-(t4*abb60n18*dotproduct(Q, spvak5k1)+t3*t6*abb6&
      &0n18+t2*t5*abb60n18+t1*abb60n18*dotproduct(Q, spvak5k3)+t1*t6*abb60n29+t4&
      &*abb60n7+t3*abb60n17+t2*abb60n12+t1*abb60n28+t1*abb60n14))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram60(Q, mu2, epspow, res)
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
      ! d60: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram60
end module uussbb_d60h2l1
