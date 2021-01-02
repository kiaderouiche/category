module     uussbb_d42h0l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity0/d42h0l1.f9
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
      
      brack = (abb42n1/es34)
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
      
      t1 = dotproduct(Q, spvak1k3)
      t2 = dotproduct(Q, spvak2k3)
      t3 = dotproduct(Q, spvak6k3)
      t4 = dotproduct(Q, spvak4k5)
      t5 = dotproduct(Q, spvak4k2)
      t6 = dotproduct(Q, spvak1k2)
      t7 = dotproduct(Q, Q)
      t8 = t1*abb42n22
      brack = (((4.0_ki)*(t1*abb42n11+t2*abb42n13+t1*abb42n22*dotproduct(Q, k6)+&
      &t3*t4*abb42n10+t3*t6*abb42n26+t3*abb42n6*es61-(t3*abb42n6*es234+t3*t4*t6+&
      &t2*t5*abb42n14+t1*t5*abb42n12+t3*abb42n9+t1*abb42n2))+(2.0_ki)*(t1*abb42n&
      &5+t7*abb42n15+t1*t4*abb42n23+t1*t5*abb42n19+t1*abb42n14*dotproduct(Q, spv&
      &ak4k1)+t1*abb42n18*dotproduct(Q, spvak6k2)+t1*abb42n20*dotproduct(Q, spva&
      &k6k5)+t1*abb42n22*es345+t1*abb42n6*dotproduct(Q, spvak6k1)-(t5*t7*abb42n1&
      &7+t1*t7*abb42n22+t1*abb42n21))+((4.0_ki)*(abb42n4-t6*abb42n24)+(2.0_ki)*(&
      &t8+abb42n3+t5*abb42n17-abb42n16))*mu2+(2.0_ki)*((2.0_ki)*t3*abb42n6-t8)*e&
      &s56)*i_)
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
      t2 = dotproduct(Q, spvak4k5)
      t3 = dotproduct(Q, spvak6k3)
      brack = ((4.0_ki)*((t1*abb42n24-abb42n7)*mu2+t1*t2*t3+t1*t2*abb42n25-(t2*t&
      &3*abb42n10+t2*abb42n8))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram42(Q, mu2, epspow, res)
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
      ! d42: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram42
end module uussbb_d42h0l1
