module     uussbb_d200h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d200h0l1.f
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
      t3 = dotproduct(Q, spvak6k5)
      t4 = dotproduct(Q, spvak6k2)
      t5 = dotproduct(Q, spvak1k2)
      t6 = dotproduct(Q, Q)
      t7 = dotproduct(Q, spvak4k5)
      t8 = dotproduct(Q, spvak4k2)
      t9 = dotproduct(Q, spvak4k6)
      brack = (((4.0_ki)*(t2*t3*t5-(t2*t3*abb200n15+t1*t4*abb200n16+t1*abb200n13&
      &))+(2.0_ki)*(t2*abb200n10+t2*abb200n14+t6*abb200n13+t7*abb200n17+t8*abb20&
      &0n2+t9*abb200n23+t2*t5*abb200n33+t2*t7*abb200n25+t4*t6*abb200n16+t4*t7*ab&
      &b200n18+t4*t8*abb200n3+t4*t9*abb200n28+t5*t7*abb200n8-(t7*abb200n28*dotpr&
      &oduct(Q, spvak5k2)+t6*t7*abb200n22+t4*t7*abb200n29+t2*t5*abb200n34+t2*t5*&
      &abb200n20+t2*t4*abb200n5+t7*abb200n6+t7*abb200n24+t2*abb200n4+t2*abb200n1&
      &2))+((2.0_ki)*(abb200n9+t7*abb200n22-(t4*abb200n16+(2.0_ki)*t3*abb200n1+a&
      &bb200n11))+abb200n27-(abb200n7+abb200n26+abb200n21))*mu2)*i_)
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
      t2 = dotproduct(Q, spvak6k5)
      t3 = dotproduct(Q, spvak4k3)
      brack = (((2.0_ki)*(-(t1*t2*abb200n32+t1*t2*t3))+t1*abb200n19+t1*abb200n31&
      &+t1*t3*abb200n20+t1*t3*abb200n34-(t1*t3*abb200n33+t1*abb200n30))*i_)
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
end module uussbb_d200h0l1
