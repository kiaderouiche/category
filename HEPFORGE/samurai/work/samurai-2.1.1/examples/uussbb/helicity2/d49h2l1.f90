module     uussbb_d49h2l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity2/d49h2l1.f9
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
      
      brack = (-1.0_ki)*abb49n1/es34*i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c6+NC*c5-(c4+c2)))
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
      complex(ki) :: t15
      complex(ki) :: t16
      complex(ki) :: t17
      complex(ki) :: t18
      complex(ki) :: t19
      complex(ki) :: t20
      complex(ki) :: t21
      complex(ki) :: t22
      complex(ki) :: t23
      complex(ki) :: t24
      complex(ki) :: t25
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak3k4)
      t4 = dotproduct(Q, k1)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, k5)
      t7 = dotproduct(Q, k2)
      t8 = dotproduct(Q, k3)
      t9 = dotproduct(Q, k4)
      t10 = dotproduct(Q, spvak2k4)
      t11 = dotproduct(Q, spvak3k1)
      t12 = dotproduct(Q, k6)
      t13 = dotproduct(Q, spvak3k2)
      t14 = dotproduct(Q, spvak1k6)
      t15 = dotproduct(Q, spvak3k6)
      t16 = dotproduct(Q, spvak1k4)
      t17 = dotproduct(Q, spvak5k2)
      t18 = t5*abb49n64
      t19 = t16*abb49n58
      t20 = t2*abb49n17
      t21 = t13*abb49n35
      t22 = t3*abb49n33
      t23 = (2.0_ki)*t22
      t24 = dotproduct(Q, spvak5k4)
      t25 = dotproduct(Q, spvak1k3)
      brack = ((3.0_ki)*(t1*abb49n2+t2*abb49n25+t1*t3*abb49n33+t1*t5*abb49n64-((&
      &2.0_ki)*t3*t4*abb49n33+t2*t5*abb49n63+t2*abb49n21+t1*abb49n5))+(4.0_ki)*(&
      &t4*abb49n31+t6*abb49n24+t6*abb49n44+t9*abb49n41+t2*t3*t5+(2.0_ki)*t3*t7*a&
      &bb49n33+t5*t8*abb49n64-(t5*t9*abb49n64+t5*t6*abb49n64+t2*t3*abb49n49+t8*a&
      &bb49n40+t7*abb49n29+t1*abb49n42))+(2.0_ki)*(abb49n26+t10*abb49n18+t14*abb&
      &49n4+t14*abb49n53+t2*abb49n45+t5*abb49n62+t11*t5*abb49n35+t12*t16*abb49n5&
      &8+t13*t5*abb49n55+t15*t5*abb49n69+t16*t4*abb49n58+t16*t6*abb49n58+t16*t7*&
      &abb49n58+t16*t8*abb49n58+t16*t9*abb49n58+t2*t5*abb49n54+t2*t6*abb49n17+t3&
      &*t5*abb49n68-(t3*t6*abb49n33+t2*t5*abb49n67+t17*t3*abb49n36+t16*t5*abb49n&
      &51+t10*t5*abb49n58+t1*t16*abb49n58+abb49n6*dotproduct(Q, spvak2k1)+abb49n&
      &13*dotproduct(Q, spvak2k6)+abb49n12*dotproduct(Q, spvak2k3)+t6*abb49n28+t&
      &3*abb49n47+t16*abb49n57+t15*abb49n48+t14*abb49n8+t13*abb49n37+t12*abb49n2&
      &8+t11*abb49n20+abb49n38+abb49n23))+((4.0_ki)*(abb49n43-t18)+(2.0_ki)*(t20&
      &-t21))*es345+((2.0_ki)*(t18-abb49n39)+t19)*es45+((4.0_ki)*(t18-abb49n43)+&
      &(2.0_ki)*(t21-t20))*es34+((4.0_ki)*(t22-abb49n27)+(2.0_ki)*(t19+abb49n2-a&
      &bb49n32)+t20)*es56+(2.0_ki)*(abb49n30-(t23+t21))*es234+(2.0_ki)*(t21+t23-&
      &abb49n30)*es61+((2.0_ki)*(t19+(2.0_ki)*abb49n42)+(3.0_ki)*(abb49n5-(abb49&
      &n2+t22+t18))+t20+abb49n15-abb49n9)*mu2+t1*abb49n9+t16*abb49n52+t16*abb49n&
      &59+t17*abb49n11+t17*abb49n34+t24*abb49n16+t25*abb49n56+abb49n14*dotproduc&
      &t(Q, spvak5k3)+abb49n7*dotproduct(Q, spvak5k1)+t14*t3*abb49n61+t24*t5*abb&
      &49n65-(t25*t3*abb49n58+t16*t3*abb49n60+t1*t2*abb49n17+t24*abb49n19+t24*ab&
      &b49n10+t17*abb49n3+t17*abb49n22+t1*abb49n15))
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
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak1k2)
      brack = ((2.0_ki)*(t2*t3*abb49n66-t2*abb49n46)+(4.0_ki)*(t1*t2*abb49n50-t1&
      &*t2*t3))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram49(Q, mu2, epspow, res)
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
      ! d49: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram49
end module uussbb_d49h2l1
