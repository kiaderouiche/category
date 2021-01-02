module     uussbb_d60h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d60h1l1.f9
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
      
      t1 = dotproduct(Q, spvak5k3)
      t2 = dotproduct(Q, spvak5k4)
      t3 = dotproduct(Q, spvak5k2)
      t4 = dotproduct(Q, spvak5k1)
      t5 = dotproduct(Q, spvak1k6)
      t6 = dotproduct(Q, spvak4k6)
      brack = ((2.0_ki)*((abb60n13+abb60n21+abb60n24-(abb60n4+abb60n22+abb60n20)&
      &)*mu2+t1*abb60n18+t1*abb60n3+t3*abb60n23+t3*abb60n5+t1*t6*abb60n27+t1*abb&
      &60n16*dotproduct(Q, spvak3k6)+t2*t6*abb60n16+t3*abb60n16*dotproduct(Q, sp&
      &vak2k6)+t4*t5*abb60n16-(t3*t5*abb60n29+t1*t6*abb60n19+t4*abb60n7+t3*abb60&
      &n9+t2*abb60n14+t1*abb60n26+t1*abb60n11))*i_)
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
      
      t1 = dotproduct(Q, spvak2k6)
      t2 = dotproduct(Q, spvak3k6)
      t3 = dotproduct(Q, spvak4k6)
      t4 = dotproduct(Q, spvak1k6)
      t5 = dotproduct(Q, spvak5k2)
      t6 = dotproduct(Q, spvak5k3)
      brack = ((2.0_ki)*((abb60n20+abb60n22+abb60n4-(abb60n24+abb60n21+abb60n13)&
      &)*mu2+t3*abb60n17+t3*abb60n2+t4*abb60n28+t4*abb60n6+t3*t6*abb60n19+t4*t5*&
      &abb60n29-(t4*abb60n16*dotproduct(Q, spvak5k1)+t3*abb60n16*dotproduct(Q, s&
      &pvak5k4)+t3*t6*abb60n27+t2*t6*abb60n16+t1*t5*abb60n16+t4*abb60n8+t3*abb60&
      &n25+t3*abb60n15+t2*abb60n12+t1*abb60n10))*i_)
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
end module uussbb_d60h1l1
