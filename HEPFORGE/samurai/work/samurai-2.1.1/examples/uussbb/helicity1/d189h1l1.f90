module     uussbb_d189h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d189h1l1.f
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
      
      brack = (1.0_ki)/es34
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*((NC-(1.0_ki)/NC)*c3+c5/NC-c4))
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
      
      t1 = dotproduct(Q, Q)
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, k1)
      t4 = dotproduct(Q, k5)
      t5 = dotproduct(Q, spvak4k1)
      t6 = dotproduct(Q, spvak4k5)
      t7 = dotproduct(Q, spvak4k6)
      t8 = dotproduct(Q, spvak4k2)
      brack = (((8.0_ki)*(t1*t2*abb189n27+t2*t4*abb189n27-t2*t3*abb189n27)+(4.0_&
      &ki)*(t3*abb189n6+t4*abb189n17+t4*abb189n26-(t4*abb189n6+t4*abb189n23+t3*a&
      &bb189n25+t3*abb189n2+t1*abb189n22))+(2.0_ki)*(t1*abb189n24+t5*abb189n10+t&
      &6*abb189n21+abb189n18*dotproduct(Q, spvak3k5)+abb189n8*dotproduct(Q, spva&
      &k3k1)+t5*abb189n20*dotproduct(Q, spvak1k6)-(t6*abb189n20*dotproduct(Q, sp&
      &vak5k6)+t1*t8*abb189n28+t1*t7*abb189n20+abb189n3*dotproduct(Q, spvak1k5)+&
      &abb189n12*dotproduct(Q, spvak6k1)+abb189n11*dotproduct(Q, spvak5k1)+abb18&
      &9n1*dotproduct(Q, spvak6k5)+t6*abb189n19+t5*abb189n9))+((2.0_ki)*(t7*abb1&
      &89n20+t8*abb189n28-((2.0_ki)*t2*abb189n27+abb189n26+abb189n2+abb189n16))+&
      &abb189n13+(3.0_ki)*abb189n23+abb189n29-abb189n4)*mu2)*i_)
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
      t2 = dotproduct(Q, spvak4k3)
      t3 = dotproduct(Q, spvak5k6)
      brack = (((2.0_ki)*(t1*t2*abb189n15-t1*t2*t3)+t1*abb189n14+t1*t3*abb189n7-&
      &(t1*t3*abb189n30+t1*abb189n5))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram189(Q, mu2, epspow, res)
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
      ! d189: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram189
end module uussbb_d189h1l1
