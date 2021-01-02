module     uussbb_d192h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d192h2l1.f
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
      real(ki) :: brack
      
      brack = (1.0_ki)/es34
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c4+((1.0_ki)/NC-NC)*c5-c3/NC))
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
      t2 = dotproduct(Q, spvak3k4)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, spvak1k2)
      t5 = dotproduct(Q, spvak1k6)
      t6 = dotproduct(Q, spvak5k2)
      t7 = dotproduct(Q, spvak2k4)
      t8 = dotproduct(Q, spvak6k4)
      t9 = dotproduct(Q, spvak5k4)
      t10 = dotproduct(Q, spvak1k4)
      brack = (((4.0_ki)*(t1*abb192n30+abb192n34*dotproduct(Q, k6)+t2*t3*abb192n&
      &36-(t2*t6*abb192n7+t2*t5*abb192n44+t2*t4*abb192n41+(2.0_ki)*t1*t2*abb192n&
      &31+abb192n4*dotproduct(Q, k2)+t1*abb192n4+t1*abb192n34+t1*abb192n19))+(2.&
      &0_ki)*(t1*abb192n28+t1*abb192n9+t3*abb192n32+t4*abb192n11+t4*abb192n40+t5&
      &*abb192n12+t5*abb192n43+t6*abb192n2+t6*abb192n6+t7*abb192n17+t8*abb192n21&
      &+abb192n1*dotproduct(Q, spvak6k5)+abb192n26*dotproduct(Q, spvak2k5)+abb19&
      &2n33*dotproduct(Q, spvak2k6)+t1*t10*abb192n42+t1*t9*abb192n22+t6*t7*abb19&
      &2n22-(t3*t8*abb192n22+abb192n5*dotproduct(Q, spvak6k2)+abb192n20*dotprodu&
      &ct(Q, spvak6k3)+abb192n16*dotproduct(Q, spvak2k3)+t8*abb192n25+t7*abb192n&
      &23+t6*abb192n3+t5*abb192n38+t4*abb192n37+t3*abb192n35+t3*abb192n10))+((2.&
      &0_ki)*((2.0_ki)*t2*abb192n31-(t9*abb192n22+t10*abb192n42+abb192n8+abb192n&
      &29))+abb192n14+abb192n15+abb192n18+abb192n27+(3.0_ki)*abb192n34-abb192n24&
      &)*mu2)*i_)
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
      brack = (((2.0_ki)*(t1*t2*t3+t1*t2*abb192n41)+t1*abb192n37+t1*t3*abb192n39&
      &-(t1*t3*abb192n45+t1*t3*abb192n13+t1*abb192n40+t1*abb192n11))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram192(Q, mu2, epspow, res)
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
      ! d192: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram192
end module uussbb_d192h2l1
