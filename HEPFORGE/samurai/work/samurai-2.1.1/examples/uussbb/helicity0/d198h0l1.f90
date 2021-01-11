module     uussbb_d198h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d198h0l1.f
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
      
      brack = (1.0_ki)/es56
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c2+c5/NC-(c3/NC+c4)))
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
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak1k2)
      t4 = dotproduct(Q, spvak4k3)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak1k3)
      t7 = dotproduct(Q, spvak6k1)
      t8 = dotproduct(Q, spvak6k4)
      t9 = dotproduct(Q, spvak6k3)
      t10 = dotproduct(Q, spvak6k2)
      brack = (((4.0_ki)*(t1*abb198n13+t1*abb198n31+abb198n7*dotproduct(Q, k1)+t&
      &2*t3*abb198n11+t2*t5*abb198n37-(t2*t6*abb198n4+t2*t4*abb198n27+(2.0_ki)*t&
      &1*t2*abb198n1+abb198n28*dotproduct(Q, k4)+t1*abb198n7+t1*abb198n24))+(2.0&
      &_ki)*(t1*abb198n19+t1*abb198n23+t3*abb198n10+t4*abb198n25+t5*abb198n36+t6&
      &*abb198n2+t7*abb198n12+t7*abb198n18+t8*abb198n32+abb198n14*dotproduct(Q, &
      &spvak2k1)+abb198n15*dotproduct(Q, spvak4k1)+abb198n30*dotproduct(Q, spvak&
      &5k4)+t1*t9*abb198n33+t3*t7*abb198n38-(t5*t8*abb198n38+t1*t10*abb198n38+ab&
      &b198n8*dotproduct(Q, spvak1k4)+abb198n20*dotproduct(Q, spvak2k4)+abb198n1&
      &6*dotproduct(Q, spvak5k1)+t8*abb198n34+t8*abb198n29+t8*abb198n21+t7*abb19&
      &8n5+t7*abb198n17+t6*abb198n3+t5*abb198n35+t4*abb198n26+t3*abb198n9))+((2.&
      &0_ki)*(abb198n24+t10*abb198n38+(2.0_ki)*t2*abb198n1-(t9*abb198n33+abb198n&
      &22))+abb198n40+abb198n6-(abb198n41+abb198n39))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak4k3)
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak1k2)
      brack = (((2.0_ki)*(t1*t2*t3+t1*t2*abb198n27)+t1*abb198n26+t1*t3*abb198n43&
      &-(t1*t3*abb198n42+t1*abb198n25))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram198(Q, mu2, epspow, res)
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
      ! d198: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram198
end module uussbb_d198h0l1
