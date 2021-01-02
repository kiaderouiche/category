module     uussbb_d184h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d184h2l1.f
   ! 90
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
      
      brack = abb184n1
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+c5/NC-(c3/NC+c6)))
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
      complex(ki) :: t9
      complex(ki) :: t10
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak1k2)
      t3 = dotproduct(Q, spvak5k4)
      t4 = dotproduct(Q, spvak5k6)
      t5 = dotproduct(Q, spvak3k4)
      t6 = dotproduct(Q, spvak3k6)
      t7 = dotproduct(Q, spvak4k2)
      t8 = dotproduct(Q, spvak6k2)
      t9 = dotproduct(Q, spvak5k2)
      t10 = dotproduct(Q, spvak3k2)
      brack = (((4.0_ki)*(t1*abb184n17+t1*abb184n32+(2.0_ki)*t1*t2*abb184n38+t2*&
      &t3*abb184n37+t2*t4*abb184n39+t2*t5*abb184n40-(t2*t6*abb184n41+abb184n29*d&
      &otproduct(Q, k6)+abb184n22*dotproduct(Q, k4)+t1*abb184n29+t1*abb184n22))+&
      &(2.0_ki)*(t1*abb184n25+t3*abb184n31+t4*abb184n33+t5*abb184n34+t6*abb184n1&
      &0+t7*abb184n19+t8*abb184n20+abb184n4*dotproduct(Q, spvak4k1)+abb184n5*dot&
      &product(Q, spvak6k1)+t1*t9*abb184n16+t3*t7*abb184n16+t4*t8*abb184n16-(t1*&
      &t10*abb184n30+abb184n27*dotproduct(Q, spvak6k5)+abb184n26*dotproduct(Q, s&
      &pvak6k4)+abb184n24*dotproduct(Q, spvak4k6)+abb184n23*dotproduct(Q, spvak4&
      &k5)+t8*abb184n15+t7*abb184n14+t6*abb184n35+t5*abb184n9+t4*abb184n8+t3*abb&
      &184n6))+((2.0_ki)*(abb184n21+abb184n7+t10*abb184n30-(t9*abb184n16+(2.0_ki&
      &)*t2*abb184n38+abb184n32+abb184n25+abb184n18))+abb184n2+(3.0_ki)*abb184n2&
      &8-(abb184n3+abb184n13+abb184n12))*mu2)*i_)
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
      t2 = dotproduct(Q, spvak3k4)
      t3 = dotproduct(Q, spvak5k6)
      brack = (((2.0_ki)*(-(t1*t2*abb184n40+t1*t2*t3))+t2*abb184n9+t2*t3*abb184n&
      &11-(t2*t3*abb184n36+t2*abb184n34))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram184(Q, mu2, epspow, res)
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
      ! d184: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram184
end module uussbb_d184h2l1
