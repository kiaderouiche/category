module     uussbb_kinematics
   use precision, only: ki
   use uussbb_model
   implicit none
   save

   complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)
   private :: i_

   integer, parameter :: num_legs = 6
   integer, parameter :: in_helicities = 4
   integer, parameter :: symmetry_factor = 1
   real(ki), parameter :: es3 = 0.0_ki
   real(ki), parameter :: es1 = 0.0_ki
   real(ki), parameter :: es2 = 0.0_ki
   real(ki), parameter :: es6 = 0.0_ki
   real(ki), parameter :: es5 = 0.0_ki
   real(ki), parameter :: es4 = 0.0_ki
   
   real(ki) :: es234
   real(ki) :: es345
   real(ki) :: es12
   real(ki) :: es56
   real(ki) :: es23
   real(ki) :: es61
   real(ki) :: es123
   real(ki) :: es45
   real(ki) :: es34
   
   complex(ki) :: spak1k2, spbk2k1
   complex(ki) :: spak1k3, spbk3k1
   complex(ki) :: spak1k4, spbk4k1
   complex(ki) :: spak1k5, spbk5k1
   complex(ki) :: spak1k6, spbk6k1
   complex(ki) :: spak2k3, spbk3k2
   complex(ki) :: spak2k4, spbk4k2
   complex(ki) :: spak2k5, spbk5k2
   complex(ki) :: spak2k6, spbk6k2
   complex(ki) :: spak3k4, spbk4k3
   complex(ki) :: spak3k5, spbk5k3
   complex(ki) :: spak3k6, spbk6k3
   complex(ki) :: spak4k5, spbk5k4
   complex(ki) :: spak4k6, spbk6k4
   complex(ki) :: spak5k6, spbk6k5
   
   
   complex(ki), dimension(0:3) :: spvak1k2
   complex(ki), dimension(0:3) :: spvak1k3
   complex(ki), dimension(0:3) :: spvak1k4
   complex(ki), dimension(0:3) :: spvak1k5
   complex(ki), dimension(0:3) :: spvak1k6
   complex(ki), dimension(0:3) :: spvak2k1
   complex(ki), dimension(0:3) :: spvak2k3
   complex(ki), dimension(0:3) :: spvak2k4
   complex(ki), dimension(0:3) :: spvak2k5
   complex(ki), dimension(0:3) :: spvak2k6
   complex(ki), dimension(0:3) :: spvak3k1
   complex(ki), dimension(0:3) :: spvak3k2
   complex(ki), dimension(0:3) :: spvak3k4
   complex(ki), dimension(0:3) :: spvak3k5
   complex(ki), dimension(0:3) :: spvak3k6
   complex(ki), dimension(0:3) :: spvak4k1
   complex(ki), dimension(0:3) :: spvak4k2
   complex(ki), dimension(0:3) :: spvak4k3
   complex(ki), dimension(0:3) :: spvak4k5
   complex(ki), dimension(0:3) :: spvak4k6
   complex(ki), dimension(0:3) :: spvak5k1
   complex(ki), dimension(0:3) :: spvak5k2
   complex(ki), dimension(0:3) :: spvak5k3
   complex(ki), dimension(0:3) :: spvak5k4
   complex(ki), dimension(0:3) :: spvak5k6
   complex(ki), dimension(0:3) :: spvak6k1
   complex(ki), dimension(0:3) :: spvak6k2
   complex(ki), dimension(0:3) :: spvak6k3
   complex(ki), dimension(0:3) :: spvak6k4
   complex(ki), dimension(0:3) :: spvak6k5
   
   real(ki), dimension(4) :: k1
   real(ki), dimension(4) :: k2
   real(ki), dimension(4) :: k3
   real(ki), dimension(4) :: k4
   real(ki), dimension(4) :: k5
   real(ki), dimension(4) :: k6
   

   interface dotproduct
      module procedure dotproduct_rr
      module procedure dotproduct_rc
      module procedure dotproduct_cr
      module procedure dotproduct_cc
   end interface dotproduct

   interface light_cone_splitting
      module procedure light_cone_splitting_iter
      ! module procedure light_cone_splitting_alg
   end interface light_cone_splitting

contains
   subroutine     inspect_kinematics(unit)
      implicit none
      integer, optional, intent(in) :: unit
      real(ki), dimension(4) :: zero
      integer :: ch

      if (present(unit)) then
         ch = unit
      else
         ch = 5
      end if
      zero(:) = 0.0_ki
      
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "k1.k1", "=", &
      & dotproduct(k1,k1)
      zero = zero + k1
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "k2.k2", "=", &
      & dotproduct(k2,k2)
      zero = zero + k2
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "k3.k3", "=", &
      & dotproduct(k3,k3)
      zero = zero - k3
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "k4.k4", "=", &
      & dotproduct(k4,k4)
      zero = zero - k4
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "k5.k5", "=", &
      & dotproduct(k5,k5)
      zero = zero - k5
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "k6.k6", "=", &
      & dotproduct(k6,k6)
      zero = zero - k6
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "err(zero)", "=", maxval(abs(zero))
      
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es234", "=", es234
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es345", "=", es345
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es12", "=", es12
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es56", "=", es56
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es23", "=", es23
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es61", "=", es61
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es123", "=", es123
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es45", "=", es45
      write(ch,"(A1,1x,A10,1x,A1,1x,G38.32)") &
      & "#", "es34", "=", es34
   end subroutine inspect_kinematics

   subroutine     init_mandelstam(vecs)
      implicit none
      real(ki), dimension(num_legs,4), intent(in) :: vecs
      
      k1 = vecs(1,:)
      k2 = vecs(2,:)
      k3 = vecs(3,:)
      k4 = vecs(4,:)
      k5 = vecs(5,:)
      k6 = vecs(6,:)
      
      es234 = 2.0_ki*dotproduct(vecs(2,:), -vecs(3,:))&
            & + 2.0_ki*dotproduct(vecs(2,:), -vecs(4,:))&
            & + 2.0_ki*dotproduct(-vecs(3,:), -vecs(4,:))
      es345 = 2.0_ki*dotproduct(-vecs(3,:), -vecs(4,:))&
            & + 2.0_ki*dotproduct(-vecs(3,:), -vecs(5,:))&
            & + 2.0_ki*dotproduct(-vecs(4,:), -vecs(5,:))
      es12 = 2.0_ki*dotproduct(vecs(1,:), vecs(2,:))
      es56 = 2.0_ki*dotproduct(-vecs(5,:), -vecs(6,:))
      es23 = 2.0_ki*dotproduct(vecs(2,:), -vecs(3,:))
      es61 = 2.0_ki*dotproduct(-vecs(6,:), vecs(1,:))
      es123 = 2.0_ki*dotproduct(vecs(1,:), vecs(2,:))&
            & + 2.0_ki*dotproduct(vecs(1,:), -vecs(3,:))&
            & + 2.0_ki*dotproduct(vecs(2,:), -vecs(3,:))
      es45 = 2.0_ki*dotproduct(-vecs(4,:), -vecs(5,:))
      es34 = 2.0_ki*dotproduct(-vecs(3,:), -vecs(4,:))
   end subroutine init_mandelstam

   subroutine     init_sp(vecs)
      implicit none
      real(ki), dimension(num_legs,4), intent(in) :: vecs
      spak1k2 = Spaa(vecs(1,:), vecs(2,:))
      spbk2k1 = Spbb(vecs(2,:), vecs(1,:))
      spak1k3 = Spaa(vecs(1,:), vecs(3,:))
      spbk3k1 = Spbb(vecs(3,:), vecs(1,:))
      spak1k4 = Spaa(vecs(1,:), vecs(4,:))
      spbk4k1 = Spbb(vecs(4,:), vecs(1,:))
      spak1k5 = Spaa(vecs(1,:), vecs(5,:))
      spbk5k1 = Spbb(vecs(5,:), vecs(1,:))
      spak1k6 = Spaa(vecs(1,:), vecs(6,:))
      spbk6k1 = Spbb(vecs(6,:), vecs(1,:))
      spak2k3 = Spaa(vecs(2,:), vecs(3,:))
      spbk3k2 = Spbb(vecs(3,:), vecs(2,:))
      spak2k4 = Spaa(vecs(2,:), vecs(4,:))
      spbk4k2 = Spbb(vecs(4,:), vecs(2,:))
      spak2k5 = Spaa(vecs(2,:), vecs(5,:))
      spbk5k2 = Spbb(vecs(5,:), vecs(2,:))
      spak2k6 = Spaa(vecs(2,:), vecs(6,:))
      spbk6k2 = Spbb(vecs(6,:), vecs(2,:))
      spak3k4 = Spaa(vecs(3,:), vecs(4,:))
      spbk4k3 = Spbb(vecs(4,:), vecs(3,:))
      spak3k5 = Spaa(vecs(3,:), vecs(5,:))
      spbk5k3 = Spbb(vecs(5,:), vecs(3,:))
      spak3k6 = Spaa(vecs(3,:), vecs(6,:))
      spbk6k3 = Spbb(vecs(6,:), vecs(3,:))
      spak4k5 = Spaa(vecs(4,:), vecs(5,:))
      spbk5k4 = Spbb(vecs(5,:), vecs(4,:))
      spak4k6 = Spaa(vecs(4,:), vecs(6,:))
      spbk6k4 = Spbb(vecs(6,:), vecs(4,:))
      spak5k6 = Spaa(vecs(5,:), vecs(6,:))
      spbk6k5 = Spbb(vecs(6,:), vecs(5,:))
      spvak1k2 = Spab3_vec(vecs(1,:), vecs(2,:))
      spvak1k3 = Spab3_vec(vecs(1,:), vecs(3,:))
      spvak1k4 = Spab3_vec(vecs(1,:), vecs(4,:))
      spvak1k5 = Spab3_vec(vecs(1,:), vecs(5,:))
      spvak1k6 = Spab3_vec(vecs(1,:), vecs(6,:))
      spvak2k1 = Spab3_vec(vecs(2,:), vecs(1,:))
      spvak2k3 = Spab3_vec(vecs(2,:), vecs(3,:))
      spvak2k4 = Spab3_vec(vecs(2,:), vecs(4,:))
      spvak2k5 = Spab3_vec(vecs(2,:), vecs(5,:))
      spvak2k6 = Spab3_vec(vecs(2,:), vecs(6,:))
      spvak3k1 = Spab3_vec(vecs(3,:), vecs(1,:))
      spvak3k2 = Spab3_vec(vecs(3,:), vecs(2,:))
      spvak3k4 = Spab3_vec(vecs(3,:), vecs(4,:))
      spvak3k5 = Spab3_vec(vecs(3,:), vecs(5,:))
      spvak3k6 = Spab3_vec(vecs(3,:), vecs(6,:))
      spvak4k1 = Spab3_vec(vecs(4,:), vecs(1,:))
      spvak4k2 = Spab3_vec(vecs(4,:), vecs(2,:))
      spvak4k3 = Spab3_vec(vecs(4,:), vecs(3,:))
      spvak4k5 = Spab3_vec(vecs(4,:), vecs(5,:))
      spvak4k6 = Spab3_vec(vecs(4,:), vecs(6,:))
      spvak5k1 = Spab3_vec(vecs(5,:), vecs(1,:))
      spvak5k2 = Spab3_vec(vecs(5,:), vecs(2,:))
      spvak5k3 = Spab3_vec(vecs(5,:), vecs(3,:))
      spvak5k4 = Spab3_vec(vecs(5,:), vecs(4,:))
      spvak5k6 = Spab3_vec(vecs(5,:), vecs(6,:))
      spvak6k1 = Spab3_vec(vecs(6,:), vecs(1,:))
      spvak6k2 = Spab3_vec(vecs(6,:), vecs(2,:))
      spvak6k3 = Spab3_vec(vecs(6,:), vecs(3,:))
      spvak6k4 = Spab3_vec(vecs(6,:), vecs(4,:))
      spvak6k5 = Spab3_vec(vecs(6,:), vecs(5,:))
   end subroutine init_sp

   pure subroutine light_cone_decomposition(vec, lvec, vref, mass)
      implicit none
      real(ki), dimension(4), intent(in) :: vec, vref
      real(ki), dimension(4), intent(out) :: lvec
      real(ki), intent(in) :: mass

      real(ki) :: alpha

      alpha = 2.0_ki * dotproduct(vec, vref)

      if (abs(alpha) < 1.0E+3_ki * epsilon(1.0_ki)) then
         lvec = vec
      else
         lvec = vec - mass * mass / alpha * vref
      end if
   end  subroutine light_cone_decomposition

   pure subroutine light_cone_splitting_iter(pI, pJ, li, lj, mI, mJ)
      ! Iteratively applies
      !   li = pI - mI^2/(2*pI.lj) * lj
      !   lj = pJ - mJ^2/(2*pJ.li) * li

      implicit none
      real(ki), dimension(4), intent(in) :: pI, pJ
      real(ki), dimension(4), intent(out) :: li, lj
      real(ki), intent(in) :: mI, mJ

      integer :: i
      real(ki) :: mmI, mmJ, lipJ, pIlj

      mmI = mI*mI
      mmJ = mJ*mJ

      lj = pJ
      do i = 1, 10
         pIlj = 2.0_ki * dotproduct(pI, lj)
         li = pI - mmI/pIlj * lj
         lipJ = 2.0_ki * dotproduct(li, pJ)
         lj = pJ - mmJ/lipJ * li
      end do
   end  subroutine light_cone_splitting_iter

   pure subroutine light_cone_splitting_alg(pI, pJ, li, lj, mI, mJ)
      ! Splits pI (pI.pI=mI*mI) and pJ (pJ.pJ=mJ*mJ)
      ! into a pair li (li.li=0) and lj (lj.lj=0).
      !
      ! To achieve this, the equation (pI+alpha*pJ)**2 == 0 is solved:
      !   alpha**2 * pJ.pJ + 2 * alpha * pI.pJ + pI.pI == 0
      !   mJ**2 * (alpha**2 + 2 * alpha * t + u**2) == 0
      ! with
      !   t = pI.pJ / mJ**2
      !   u**2 = mI**2/mJ**2
      !
      ! ==> alpha = - t +/- sqrt(det)
      !     det   = t**2 - u**2

      implicit none
      real(ki), dimension(4), intent(in) :: pI, pJ
      real(ki), dimension(4), intent(out) :: li, lj
      real(ki), intent(in) :: mI, mJ

      real(ki) :: det, t, u, pq

      pq = dotproduct(pI/mI, pJ/mJ)

      u = mI/mJ
      t = pq * u

      det = (1.0_ki+1.0_ki/pq)*(1.0_ki-1.0_ki/pq)
      if (det > 0.0_ki) then
         det = sqrt(1.0_ki+1.0_ki/pq)*sqrt(1.0_ki-1.0_ki/pq)

         li = pI - t * (1.0_ki + det) * pJ
         lj = pI - t * (1.0_ki - det) * pJ
      else
         li(:) = 0.0_ki
         lj(:) = 0.0_ki
      end if
   end  subroutine light_cone_splitting_alg

   pure function Spbb(p, q)
      implicit none
      real(ki), dimension(4), intent(in) :: p, q
      complex(ki) :: Spbb
      Spbb = sign(1.0_ki, dotproduct(p, q)) * conjg(Spaa(q, p))
   end  function Spbb

   pure function Spab3(k1, Q, k2)
      implicit none
      complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)

      real(ki), dimension(4), intent(in) :: k1, k2
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki) :: Spab3

      real(ki), dimension(4) :: R, J

      R = real(Q)
      J = aimag(Q)

      Spab3 = Spab3_mcfm(k1, R, k2) + i_ * Spab3_mcfm(k1, J, k2)
   end  function Spab3

   pure function Spab3_vec(k1, k2)
      implicit none
      complex(ki), parameter :: i_ = (0.0_ki, 1.0_ki)

      real(ki), dimension(4), intent(in) :: k1, k2
      complex(ki), dimension(0:3) :: Spab3_vec

      Spab3_vec(0) =   Spab3_mcfm(k1, &
         & (/1.0_ki, 0.0_ki, 0.0_ki, 0.0_ki/), k2)
      Spab3_vec(1) = - Spab3_mcfm(k1, &
         & (/0.0_ki, 1.0_ki, 0.0_ki, 0.0_ki/), k2)
      Spab3_vec(2) = - Spab3_mcfm(k1, &
         & (/0.0_ki, 0.0_ki, 1.0_ki, 0.0_ki/), k2)
      Spab3_vec(3) = - Spab3_mcfm(k1, &
         & (/0.0_ki, 0.0_ki, 0.0_ki, 1.0_ki/), k2)
   end  function Spab3_vec

   pure function Spaa(k1, k2)
      ! This routine has been copied from mcfm and adapted to our setup
      implicit none
      real(ki), dimension(0:3), intent(in) :: k1, k2
      complex(ki) :: Spaa

      real(ki) :: rt1, rt2
      complex(ki) :: c231, c232, f1, f2
!---if one of the vectors happens to be zero this routine fails.
!-----positive energy case
         if (k1(0) .gt. 0.0_ki) then
            rt1=sqrt(k1(0)+k1(1))
            c231=cmplx(k1(3),-k1(2), ki)
            f1=1.0_ki
         else
!-----negative energy case
            rt1=sqrt(-k1(0)-k1(1))
            c231=cmplx(-k1(3),k1(2), ki)
            f1=(0.0_ki, 1.0_ki)
         endif
!-----positive energy case
         if (k2(0) .gt. 0.0_ki) then
            rt2=sqrt(k2(0)+k2(1))
            c232=cmplx(k2(3),-k2(2), ki)
            f2=1.0_ki
         else
!-----negative energy case
            rt2=sqrt(-k2(0)-k2(1))
            c232=cmplx(-k2(3),k2(2), ki)
            f2=(0.0_ki, 1.0_ki)
         endif

         Spaa = -f2*f1*(c232*rt1/rt2-c231*rt2/rt1)
   end  function Spaa

   pure function Spab3_mcfm(k1, Q, k2)
      ! This routine has been copied from mcfm and adapted to our setup
      implicit none
      real(ki), dimension(0:3), intent(in) :: k1, k2
      real(ki), dimension(0:3), intent(in) :: Q
      complex(ki) :: Spab3_mcfm

      real(ki) :: kp, km
      complex(ki) :: kr, kl
      complex(ki) :: pr1, pr2, pl1, pl2
      complex(ki) :: f1, f2
      real(ki) :: flip1, flip2, rt1, rt2

      !--setup components for vector which is contracted in
      kp=+Q(0)+Q(1)
      km=+Q(0)-Q(1)
      kr=cmplx(+Q(3),-Q(2),ki)
      kl=cmplx(+Q(3),+Q(2),ki)

      !---if one of the vectors happens to be zero this routine fails.
      if(all(abs(Q) < 1.0E+2_ki * epsilon(1.0_ki))) then
         Spab3_mcfm = 0.0_ki
         return
      end if

      !-----positive energy case
      if (k1(0) .gt. 0.0_ki) then
         flip1=1.0_ki
         f1=1.0_ki
      else
         flip1=-1.0_ki
         f1=(0.0_ki, 1.0_ki)
      endif
      rt1=sqrt(flip1*(k1(0)+k1(1)))
      pr1=cmplx(flip1*k1(3),-flip1*k1(2), ki)
      pl1=conjg(pr1)

      if (k2(0) .gt. 0.0_ki) then
         flip2=1.0_ki
         f2=1.0_ki
      else
         flip2=-1.0_ki
         f2=(0.0_ki, 1.0_ki)
      endif
      rt2=sqrt(flip2*(k2(0)+k2(1)))
      pr2=cmplx(flip2*k2(3),-flip2*k2(2), ki)
      pl2=conjg(pr2)

      Spab3_mcfm=f1*f2*(&
     &     pr1/rt1*(pl2*kp/rt2-kl*rt2)&
     &    +rt1*(rt2*km-kr*pl2/rt2))
   end  function Spab3_mcfm

   pure function Spba3(k1, Q, k2)
      implicit none
      real(ki), dimension(4), intent(in) :: k1, k2
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki) :: Spba3

      Spba3 = Spab3(k2, Q, k1)
   end  function Spba3

   pure function dotproduct_rr(p, q)
      implicit none
      real(ki), dimension(4), intent(in) :: p, q
      real(ki) :: dotproduct_rr
      dotproduct_rr = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
   end  function dotproduct_rr

   pure function dotproduct_cc(p, q)
      implicit none
      complex(ki), dimension(4), intent(in) :: p, q
      complex(ki) :: dotproduct_cc
      dotproduct_cc = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
   end  function dotproduct_cc

   pure function dotproduct_rc(p, q)
      implicit none
      real(ki), dimension(4), intent(in) :: p
      complex(ki), dimension(4), intent(in) :: q
      complex(ki) :: dotproduct_rc
      dotproduct_rc = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
   end  function dotproduct_rc

   pure function dotproduct_cr(p, q)
      implicit none
      complex(ki), dimension(4), intent(in) :: p
      real(ki), dimension(4), intent(in) :: q
      complex(ki) :: dotproduct_cr
      dotproduct_cr = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
   end  function dotproduct_cr
end module uussbb_kinematics
