module     uussbb_d42h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d42h2l1.f9
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
      
      brack = (abb42n1/es34)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c1/NC-c6))
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
      
      t1 = dotproduct(Q, spvak3k6)
      t2 = dotproduct(Q, spvak3k2)
      t3 = dotproduct(Q, spvak3k1)
      t4 = dotproduct(Q, spvak5k4)
      t5 = dotproduct(Q, spvak1k4)
      t6 = dotproduct(Q, spvak1k2)
      t7 = dotproduct(Q, Q)
      t8 = t2*abb42n17
      brack = (((4.0_ki)*(t2*abb42n19+t2*abb42n3+t3*abb42n5+t1*t4*abb42n13+t1*t6&
      &*abb42n26+t1*abb42n8*es234+t2*abb42n17*dotproduct(Q, k6)-(t3*t5*abb42n14+&
      &t2*t5*abb42n22+t1*abb42n8*es61+t1*abb42n8*es34+t1*t4*t6+t1*abb42n12))+(2.&
      &0_ki)*(t2*abb42n7+t2*abb42n9+t7*abb42n20+t2*t4*abb42n18+t2*t5*abb42n6+t2*&
      &abb42n14*dotproduct(Q, spvak2k4)+t2*abb42n15*dotproduct(Q, spvak5k6)+t2*a&
      &bb42n4*dotproduct(Q, spvak1k6)+t2*abb42n8*dotproduct(Q, spvak2k6)-(t5*t7*&
      &abb42n23+t2*abb42n17*es56+t2*t7*abb42n17+t2*abb42n2+t2*abb42n16))+(2.0_ki&
      &)*(t8+(2.0_ki)*t1*abb42n8)*es345+(2.0_ki)*(t8+t5*abb42n23-((2.0_ki)*t6*ab&
      &b42n24+abb42n21))*mu2)*i_)
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
      t2 = dotproduct(Q, spvak5k4)
      t3 = dotproduct(Q, spvak3k6)
      brack = ((4.0_ki)*((t1*abb42n24-abb42n10)*mu2+t1*t2*t3+t1*t2*abb42n25-(t2*&
      &t3*abb42n13+t2*abb42n11))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram42(Q, mu2, epspow, res)
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
      ! d42: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram42
end module uussbb_d42h2l1
