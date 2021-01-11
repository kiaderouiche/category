module     uussbb_d200h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d200h1l1.f
   ! 90
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
      real(ki) :: brack
      
      brack = (1.0_ki)/es56
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*((NC-(1.0_ki)/NC)*c3+c5/NC-c6))
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
      
      t1 = dotproduct(Q, k4)
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak5k6)
      t4 = dotproduct(Q, spvak5k2)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, Q)
      t7 = dotproduct(Q, spvak4k5)
      t8 = dotproduct(Q, spvak4k2)
      t9 = dotproduct(Q, spvak4k6)
      brack = (((4.0_ki)*(t2*t3*t5-(t2*t3*abb200n14+t1*t4*abb200n15+t1*abb200n12&
      &))+(2.0_ki)*(t2*abb200n13+t2*abb200n9+t6*abb200n12+t7*abb200n19+t8*abb200&
      &n2+t9*abb200n26+t2*t5*abb200n32+t2*t9*abb200n21+t4*t6*abb200n15+t4*t7*abb&
      &200n25+t4*t8*abb200n3+t4*t9*abb200n28+t5*t9*abb200n7-(t9*abb200n25*dotpro&
      &duct(Q, spvak6k2)+t6*t9*abb200n18+t4*t9*abb200n24+t2*t5*abb200n33+t2*t5*a&
      &bb200n17+t2*t4*abb200n5+t9*abb200n20+t2*abb200n4+t2*abb200n11))+((2.0_ki)&
      &*(abb200n8+t9*abb200n18-(t4*abb200n15+(2.0_ki)*t3*abb200n1+abb200n10))+ab&
      &b200n22+abb200n27-(abb200n6+abb200n23))*mu2)*i_)
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
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, spvak4k3)
      brack = (((2.0_ki)*(-(t1*t2*abb200n31+t1*t2*t3))+t1*abb200n16+t1*abb200n30&
      &+t1*t3*abb200n17+t1*t3*abb200n33-(t1*t3*abb200n32+t1*abb200n29))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram200(Q, mu2, epspow, res)
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
      ! d200: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram200
end module uussbb_d200h1l1
