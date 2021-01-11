module     uussbb_d41h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d41h2l1.f9
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
      
      brack = (abb41n1/es34)
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
      complex(ki) :: t9
      complex(ki) :: t10
      complex(ki) :: t11
      complex(ki) :: t12
      complex(ki) :: t13
      complex(ki) :: t14
      
      t1 = dotproduct(Q, spvak3k4)
      t2 = dotproduct(Q, k1)
      t3 = dotproduct(Q, k5)
      t4 = dotproduct(Q, spvak1k6)
      t5 = dotproduct(Q, spvak3k2)
      t6 = dotproduct(Q, spvak5k2)
      t7 = dotproduct(Q, spvak5k6)
      t8 = dotproduct(Q, Q)
      t9 = dotproduct(Q, spvak4k2)
      t10 = dotproduct(Q, spvak1k4)
      t11 = dotproduct(Q, spvak1k3)
      t12 = dotproduct(Q, spvak1k2)
      t13 = t5*abb41n33
      t14 = (2.0_ki)*t12*abb41n44
      brack = (((4.0_ki)*(t1*abb41n10+t3*abb41n24+t1*t4*t6+t1*t4*abb41n13+t1*t6*&
      &abb41n35+t2*t5*abb41n33-(t3*t5*abb41n33+t2*abb41n24))+(2.0_ki)*(abb41n8+t&
      &10*abb41n38+t10*abb41n7+t12*abb41n5+t4*abb41n11+t5*abb41n30+t6*abb41n21+t&
      &7*abb41n23+t9*abb41n31+t10*t5*abb41n46+t10*t8*abb41n42+t11*t5*abb41n44+t1&
      &2*t5*abb41n37+t12*abb41n44*es61+t4*t5*abb41n47+t4*t6*abb41n36+t5*t8*abb41&
      &n33-(t4*t6*abb41n45+t12*abb41n44*es234+t10*t9*abb41n44+t10*t7*abb41n41+t1&
      &0*t5*abb41n43+t10*t4*abb41n14+abb41n25*es45+t8*abb41n26+t6*abb41n32+t4*ab&
      &b41n40+t4*abb41n12+t11*abb41n39+t10*abb41n6+abb41n9+abb41n22))+((4.0_ki)*&
      &(abb41n24-t13)-t14)*es345+((4.0_ki)*(t13-abb41n24)+t14)*es34+((4.0_ki)*(t&
      &1*abb41n29-abb41n4)+(2.0_ki)*(abb41n15+abb41n16+abb41n18+abb41n20-(t10*ab&
      &b41n42+abb41n27+abb41n17+t13)))*mu2)*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      complex(ki) :: t2
      complex(ki) :: t3
      
      t1 = dotproduct(Q, spvak3k4)
      t2 = dotproduct(Q, spvak5k2)
      t3 = dotproduct(Q, spvak1k6)
      brack = (((4.0_ki)*(-(t1*t2*abb41n34+t1*t2*t3))+(2.0_ki)*(t2*abb41n2+t2*ab&
      &b41n32+t2*t3*abb41n45-(t2*t3*abb41n36+t2*abb41n3+t2*abb41n21))+(2.0_ki)*(&
      &abb41n28-((2.0_ki)*t1*abb41n29+abb41n19))*mu2)*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram41(Q, mu2, epspow, res)
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
      ! d41: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram41
end module uussbb_d41h2l1
