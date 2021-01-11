module     uussbb_matrix
   use precision, only: ki
   use msamurai, only: initsamurai
   use uussbb_config
   use uussbb_kinematics, only: &
       in_helicities, symmetry_factor
   use uussbb_model, only: Nf, &
   & samurai_method, samurai_scalar
   use uussbb_functions, only: init_functions
   use uussbb_color, only: TR, CA, CF, numcs, incolors, &
   & init_color
   
   use uussbb_init0, only: init_event0 => init_event
   use uussbb_diagramsh0l0, only: amplitude0l0 => amplitude
   use uussbb_diagramsh0l1, only: samplitudeh0l1 => samplitude
   use uussbb_init1, only: init_event1 => init_event
   use uussbb_diagramsh1l0, only: amplitude1l0 => amplitude
   use uussbb_diagramsh1l1, only: samplitudeh1l1 => samplitude
   use uussbb_init2, only: init_event2 => init_event
   use uussbb_diagramsh2l0, only: amplitude2l0 => amplitude
   use uussbb_diagramsh2l1, only: samplitudeh2l1 => samplitude

   implicit none
   save

   integer :: renormalisation = 1

   interface     square
      module procedure square_0l_0l
      module procedure square_0l_1l
      module procedure square_0l_0l_mat
   end interface square

   private :: square_0l_0l, square_0l_0l_mat, square_0l_1l, uv_aux
contains
   subroutine     initgolem()
      implicit none
      call initsamurai('diag',samurai_scalar,0,0)
      call init_functions()
      call init_color()
   end subroutine initgolem

   function     samplitudel1(vecs,scale2,ok) result(amp)
      implicit none
      real(ki), dimension(6, 4), intent(in) :: vecs
      logical, intent(out) :: ok
      double precision, intent(in) :: scale2
      real(ki), dimension(-2:0) :: amp, heli_amp
      logical :: my_ok

      amp(:) = 0.0_ki
      ok = .true.
      call init_event0(vecs)
      heli_amp = samplitudeh0l1(scale2,my_ok)
      ok = ok .and. my_ok
      amp = amp + heli_amp
!      call init_event1(vecs)
!      heli_amp = samplitudeh1l1(scale2,my_ok)
!      ok = ok .and. my_ok
!      amp = amp + heli_amp
!      call init_event2(vecs)
!      heli_amp = samplitudeh2l1(scale2,my_ok)
!      ok = ok .and. my_ok
!      amp = amp + heli_amp
      if (include_helicity_avg_factor) then
         amp = amp / real(in_helicities, ki)
      end if
      if (include_color_avg_factor) then
         amp = amp / incolors
      end if
      if (include_symmetry_factor) then
         amp = amp / real(symmetry_factor, ki)
      end if
   end function samplitudel1

   subroutine     samplitude(vecs, scale2, amp)
      implicit none
      real(ki), dimension(6, 4), intent(in) :: vecs
      double precision, intent(in) :: scale2
      double precision, dimension(4), intent(out) :: amp
      logical :: ok

      ! used for m=0 QCD renormalisation
      integer :: n
      real(ki) :: beta0
      logical, parameter :: gs = .true.
      logical, parameter :: GG = .true.
      logical, parameter :: gw = .false.
      logical, parameter :: e  = .false.
      logical, parameter :: EE = .false.

      amp(1)   = samplitudel0(vecs)
      amp((/4,3,2/)) = samplitudel1(vecs, scale2,ok)

      select case (renormalisation)
      case (0)
         ! no renormalisation
      case (1)
         n = uv_aux(gs,4,6)
         beta0 = (11.0_ki * CA - 4.0_ki * TR * NF) / 6.0_ki
         amp(3) = amp(3) - n * beta0 * amp(1)
      case default
         ! not implemented
         print*, "In uussbb_matrix:"
         print*, "  invalid value for renormalisation=", renormalisation
         stop
      end select
   end subroutine samplitude

   function     samplitudel0(vecs) result(amp)
      implicit none
      real(ki), dimension(6, 4), intent(in) :: vecs
      real(ki) :: amp, heli_amp
      complex(ki), dimension(numcs) :: color_vector

      amp = 0.0_ki
      call init_event0(vecs)
      color_vector = amplitude0l0()
      heli_amp = square(color_vector)
      amp = amp + heli_amp
!      call init_event1(vecs)
!      color_vector = amplitude1l0()
!      heli_amp = square(color_vector)
!      amp = amp + heli_amp
!      call init_event2(vecs)
!      color_vector = amplitude2l0()
!      heli_amp = square(color_vector)
!      amp = amp + heli_amp
      if (include_helicity_avg_factor) then
         amp = amp / real(in_helicities, ki)
      end if
      if (include_color_avg_factor) then
         amp = amp / incolors
      end if
      if (include_symmetry_factor) then
         amp = amp / real(symmetry_factor, ki)
      end if
   end function samplitudel0

   pure function square_0l_0l(color_vector) result(amp)
      use uussbb_color, only: cmat => CC
      implicit none
      complex(ki), dimension(numcs), intent(in) :: color_vector
      real(ki) :: amp
      complex(ki), dimension(numcs) :: v1, v2

      v1 = matmul(cmat, color_vector)
      v2 = conjg(color_vector)
      amp = real(sum(v1(:) * v2(:)))
   end function  square_0l_0l

   pure function square_0l_1l(color_vector1, color_vector2) result(amp)
      use uussbb_color, only: cmat => CC
      implicit none
      complex(ki), dimension(numcs), intent(in) :: color_vector1
      complex(ki), dimension(numcs), intent(in) :: color_vector2
      real(ki) :: amp
      complex(ki), dimension(numcs) :: v1, v2

      v1 = matmul(cmat, color_vector1)
      v2 = conjg(color_vector2)
      amp = 2.0_ki * real(sum(v1(:) * v2(:)))
   end function  square_0l_1l

   pure function square_0l_0l_mat(color_vector, cmat) result(amp)
      implicit none
      complex(ki), dimension(numcs), intent(in) :: color_vector
      complex(ki), dimension(numcs,numcs), intent(in) :: cmat
      real(ki) :: amp
      complex(ki), dimension(numcs) :: v1, v2

      v1 = matmul(cmat, color_vector)
      v2 = conjg(color_vector)
      amp = real(sum(v1(:) * v2(:)))
   end function  square_0l_0l_mat

   pure function uv_aux(is_gs, order0, order1) result(n)
      implicit none
      logical, intent(in) :: is_gs
      integer, intent(in) :: order0, order1
      integer :: n

      if (is_gs) then
              ! the user knows what he does
              n = order0
      elseif (order1 > order0) then
              ! no QCD corrections -> no QCD renormalization
              n = 0
      else
              n = - 2 - order0 + 1 + 1 + 1 + 1 + 1 + 1
              if (n .lt. 0) then
                      n = 0
              end if
      end if
   end  function uv_aux



end module uussbb_matrix
