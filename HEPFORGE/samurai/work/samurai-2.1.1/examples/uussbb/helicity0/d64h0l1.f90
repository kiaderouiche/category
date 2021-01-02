module     uussbb_d64h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d64h0l1.f9
   ! 0
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
      
      brack = (abb64n1/(es34*es56))
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
      
      t1 = dotproduct(Q, spvak1k4)
      t2 = dotproduct(Q, spvak1k3)
      t3 = dotproduct(Q, spvak1k5)
      t4 = dotproduct(Q, spvak1k6)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak6k2)
      brack = ((2.0_ki)*((abb64n16+abb64n18+abb64n20-(abb64n19+abb64n17+abb64n15&
      &))*mu2+t2*abb64n11+t3*abb64n12+t4*abb64n13+t2*t5*abb64n23+t3*abb64n21*dot&
      &product(Q, spvak5k2)+t4*t6*abb64n21-(t3*t6*abb64n22+t2*abb64n21*dotproduc&
      &t(Q, spvak3k2)+t1*t5*abb64n21+t3*abb64n9+t3*abb64n14+t2*abb64n8+t1*abb64n&
      &10))*i_)
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
      
      t1 = dotproduct(Q, spvak3k2)
      t2 = dotproduct(Q, spvak4k2)
      t3 = dotproduct(Q, spvak5k2)
      t4 = dotproduct(Q, spvak6k2)
      t5 = dotproduct(Q, spvak1k3)
      t6 = dotproduct(Q, spvak1k5)
      brack = ((2.0_ki)*((abb64n15+abb64n17+abb64n19-(abb64n20+abb64n18+abb64n16&
      &))*mu2+t2*abb64n3+t3*abb64n5+t4*abb64n7+t1*t5*abb64n21+t2*abb64n21*dotpro&
      &duct(Q, spvak1k4)+t4*t6*abb64n22-(t4*abb64n21*dotproduct(Q, spvak1k6)+t3*&
      &t6*abb64n21+t2*t5*abb64n23+t4*abb64n6+t2*abb64n4+t1*abb64n2))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram64(Q, mu2, epspow, res)
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
      ! d64: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram64
end module uussbb_d64h0l1
