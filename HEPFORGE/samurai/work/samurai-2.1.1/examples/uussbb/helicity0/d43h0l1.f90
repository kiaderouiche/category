module     uussbb_d43h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d43h0l1.f9
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
      
      brack = (abb43n1/es56)
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c1/NC-c4))
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
      complex(ki) :: t11
      complex(ki) :: t12
      complex(ki) :: t13
      
      t1 = dotproduct(Q, k2)
      t2 = dotproduct(Q, k3)
      t3 = dotproduct(Q, spvak6k5)
      t4 = dotproduct(Q, spvak1k5)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak1k3)
      t7 = dotproduct(Q, spvak6k2)
      t8 = dotproduct(Q, spvak4k3)
      t9 = dotproduct(Q, spvak5k2)
      t10 = dotproduct(Q, Q)
      t11 = dotproduct(Q, spvak1k6)
      t12 = dotproduct(Q, spvak1k2)
      t13 = t4*abb43n44
      brack = (((4.0_ki)*(abb43n7+t2*abb43n18+t2*t4*abb43n44+t3*t5*t6+t3*t6*abb4&
      &3n40-(t3*t5*abb43n10+t1*t4*abb43n44+t4*abb43n43+t3*abb43n4+t1*abb43n18))+&
      &(2.0_ki)*(abb43n3+abb43n6+t5*abb43n9+t6*abb43n37+t7*abb43n11+t8*abb43n16+&
      &t9*abb43n23+abb43n20*es345+t4*t7*abb43n50+t4*t9*abb43n49+t5*t6*abb43n45+t&
      &7*t8*abb43n24-(t5*t7*abb43n13+t5*t6*abb43n51+t4*t7*abb43n47+t4*t5*abb43n4&
      &6+t12*t4*abb43n25+t11*t7*abb43n49+t10*t7*abb43n32+t10*t4*abb43n44+abb43n2&
      &0*es45+t7*abb43n22+t7*abb43n12+t6*abb43n38+t5*abb43n5+t5*abb43n21+t4*abb4&
      &3n41+t12*abb43n48+t11*abb43n42+t10*abb43n27+abb43n2+abb43n17))+(4.0_ki)*(&
      &abb43n8-(abb43n20+t13))*es34+(2.0_ki)*(t13+abb43n19+abb43n26+abb43n35+(2.&
      &0_ki)*t3*abb43n30+t7*abb43n32-(abb43n36+abb43n34+abb43n33+abb43n31+abb43n&
      &29))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak4k2)
      brack = (((4.0_ki)*(-(t1*t2*abb43n39+t1*t2*t3))+(2.0_ki)*(t1*abb43n15+t1*a&
      &bb43n38+t1*t3*abb43n51-(t1*t3*abb43n45+t1*abb43n37+t1*abb43n14))+(2.0_ki)&
      &*(abb43n28-((2.0_ki)*t2*abb43n30+abb43n26))*mu2)*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram43(Q, mu2, epspow, res)
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
      ! d43: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram43
end module uussbb_d43h0l1
