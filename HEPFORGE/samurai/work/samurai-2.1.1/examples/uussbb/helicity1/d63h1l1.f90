module     uussbb_d63h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d63h1l1.f9
   ! 0
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
      complex(ki) :: brack
      
      brack = (-1.0_ki)*abb63n1/(es34*es56)*i_
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*NC*(c5-c3))
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
      
      t1 = dotproduct(Q, spvak1k2)
      t2 = dotproduct(Q, Q)
      t3 = dotproduct(Q, k1)
      t4 = dotproduct(Q, spvak1k6)
      t5 = dotproduct(Q, spvak1k3)
      brack = ((4.0_ki)*(t1*abb63n26*dotproduct(Q, k3)+t1*abb63n26*dotproduct(Q,&
      & k4)-(t1*abb63n26*dotproduct(Q, k6)+t1*abb63n26*dotproduct(Q, k5)+t1*abb6&
      &3n26*es56))+(2.0_ki)*(t1*abb63n16+t2*abb63n12+t2*abb63n18+t2*abb63n20+t3*&
      &abb63n12+t3*abb63n18+t3*abb63n20+abb63n2*dotproduct(Q, spvak3k2)+abb63n3*&
      &dotproduct(Q, spvak4k2)+abb63n5*dotproduct(Q, spvak5k2)+t1*abb63n26*es234&
      &+t1*abb63n26*es34+t1*abb63n27*dotproduct(Q, spvak5k6)-(t1*abb63n28*dotpro&
      &duct(Q, spvak4k3)+abb63n4*dotproduct(Q, spvak6k2)+t3*abb63n22+t3*abb63n19&
      &+t3*abb63n15+t2*abb63n22+t2*abb63n19+t2*abb63n15+abb63n21))+(2.0_ki)*(abb&
      &63n15+abb63n19+abb63n22-(abb63n20+abb63n18+abb63n12))*mu2+t1*abb63n25+t4*&
      &abb63n10+t5*abb63n6+abb63n7*dotproduct(Q, spvak1k4)-(abb63n9*dotproduct(Q&
      &, spvak1k5)+t5*abb63n8+t4*abb63n11+t1*abb63n23+t1*abb63n13))
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki) :: brack
      complex(ki) :: t1
      
      t1 = dotproduct(Q, spvak1k2)
      brack = ((2.0_ki)*(t1*abb63n26*es56+t1*abb63n28*dotproduct(Q, spvak4k3)-(t&
      &1*abb63n27*dotproduct(Q, spvak5k6)+t1*abb63n26*es34))+(4.0_ki)*(t1*abb63n&
      &26*dotproduct(Q, k5)+t1*abb63n26*dotproduct(Q, k6)-(t1*abb63n26*dotproduc&
      &t(Q, k4)+t1*abb63n26*dotproduct(Q, k3)))+t1*abb63n14+t1*abb63n23-(t1*abb6&
      &3n24+t1*abb63n17))
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram63(Q, mu2, epspow, res)
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
      ! d63: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram63
end module uussbb_d63h1l1
