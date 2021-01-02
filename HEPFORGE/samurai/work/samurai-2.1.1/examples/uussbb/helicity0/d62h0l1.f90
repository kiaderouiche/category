module     uussbb_d62h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d62h0l1.f9
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
      
      brack = (abb62n1/(es34*es56))
   end  function brack_1
   pure function brack_2(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      complex(ki), dimension(numcs) :: brack
      
      brack = (TR*TR*TR*(c5/NC-c3/NC))
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
      
      t1 = dotproduct(Q, spvak6k3)
      t2 = dotproduct(Q, spvak2k3)
      t3 = dotproduct(Q, spvak5k3)
      t4 = dotproduct(Q, spvak1k3)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak4k5)
      brack = ((2.0_ki)*((abb62n13+abb62n24+abb62n5-(abb62n8+abb62n20+abb62n2))*&
      &mu2+t1*abb62n11+t1*abb62n22+t2*abb62n14+t4*abb62n3+t1*t6*abb62n25+t4*t5*a&
      &bb62n27-(t4*abb62n21*dotproduct(Q, spvak4k1)+t3*t6*abb62n21+t2*t5*abb62n2&
      &1+t1*abb62n21*dotproduct(Q, spvak4k6)+t1*t6*abb62n9+t4*abb62n26+t3*abb62n&
      &16+t1*abb62n6+t1*abb62n17))*i_)
   end  function brack_3
   pure function brack_4(Q, mu2) result(brack)
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
      
      t1 = dotproduct(Q, spvak4k2)
      t2 = dotproduct(Q, spvak4k5)
      t3 = dotproduct(Q, spvak4k6)
      t4 = dotproduct(Q, spvak4k1)
      t5 = dotproduct(Q, spvak1k3)
      t6 = dotproduct(Q, spvak6k3)
      brack = ((2.0_ki)*((abb62n2+abb62n20+abb62n8-(abb62n5+abb62n24+abb62n13))*&
      &mu2+t1*abb62n15+t2*abb62n12+t2*abb62n23+t4*abb62n4+t1*abb62n21*dotproduct&
      &(Q, spvak2k3)+t2*t6*abb62n9+t2*abb62n21*dotproduct(Q, spvak5k3)+t3*t6*abb&
      &62n21+t4*t5*abb62n21-(t2*t6*abb62n25+t1*t5*abb62n27+t3*abb62n19+t2*abb62n&
      &7+t2*abb62n18+t1*abb62n10))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram62(Q, mu2, epspow, res)
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
      ! d62: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram62
end module uussbb_d62h0l1
