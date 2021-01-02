module     uussbb_d199h1l1
   ! file:      /home/thomasr/Work/samurai-processes/uussbb/helicity1/d199h1l1.f
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
      
      brack = (TR*TR*TR*(c4+c5/NC-(c3/NC+c2)))
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
      t2 = dotproduct(Q, spvak5k6)
      t3 = dotproduct(Q, k2)
      t4 = dotproduct(Q, k3)
      t5 = dotproduct(Q, spvak2k6)
      t6 = dotproduct(Q, spvak3k6)
      t7 = dotproduct(Q, spvak4k6)
      t8 = dotproduct(Q, spvak1k6)
      brack = (((8.0_ki)*(t2*t4*abb199n1-(t2*t3*abb199n1+t1*t2*abb199n1))+(4.0_k&
      &i)*(t1*abb199n22+t3*abb199n14+t3*abb199n8+t4*abb199n11+t4*abb199n6-(t4*ab&
      &b199n9+t4*abb199n14+t3*abb199n11+t1*abb199n5+t1*abb199n10))+(2.0_ki)*(t5*&
      &abb199n26+t6*abb199n21+abb199n13*dotproduct(Q, spvak3k4)+abb199n18*dotpro&
      &duct(Q, spvak2k5)+t1*t7*abb199n23+t5*abb199n23*dotproduct(Q, spvak4k2)-(t&
      &6*abb199n23*dotproduct(Q, spvak4k3)+t1*t8*abb199n32+abb199n3*dotproduct(Q&
      &, spvak2k3)+abb199n20*dotproduct(Q, spvak3k5)+abb199n2*dotproduct(Q, spva&
      &k3k2)+abb199n12*dotproduct(Q, spvak2k4)+t6*abb199n27+t5*abb199n19))+((2.0&
      &_ki)*(abb199n11+(2.0_ki)*t2*abb199n1+t8*abb199n32-(t7*abb199n23+abb199n9+&
      &abb199n14))+abb199n15+abb199n25+(3.0_ki)*abb199n4+abb199n7-(abb199n28+abb&
      &199n24))*mu2)*i_)
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
      brack = (((2.0_ki)*(t1*t2*t3+t1*t2*abb199n31)+t1*abb199n29+t1*t3*abb199n33&
      &-(t1*t3*abb199n34+t1*t3*abb199n17+t1*abb199n30+t1*abb199n16))*i_)
   end  function brack_4
   pure function brack_5(Q, mu2) result(brack)
      implicit none
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2
      integer :: brack
      
      brack = 0
   end  function brack_5

   pure subroutine diagram199(Q, mu2, epspow, res)
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
      ! d199: if non-zero, there is only one color structure
      acc(1) = acc(1) + (brack_5(Q, mu2))
      res = res + prefactor * acc
   end  subroutine diagram199
end module uussbb_d199h1l1
