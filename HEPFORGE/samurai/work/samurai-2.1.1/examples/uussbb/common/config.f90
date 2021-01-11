module     uussbb_config
   use precision, only: ki
   implicit none

   logical, parameter :: debug_lo_diagrams  = .true.
   logical, parameter :: debug_nlo_diagrams = .false.

   ! If true, the calculation includes terms proportional to eps^2
   ! multiplying double poles.
   ! These terms are supposed to cancel in QCD.
   logical, parameter :: include_eps2_terms = .true.

   ! If true, the calculation includes terms proportional to eps
   ! multiplying double and single poles.
   ! These terms are necessary in 't Hooft-Veltman scheme
   logical, parameter :: include_eps_terms = .true.

   logical, parameter :: include_color_avg_factor = .true.
   logical, parameter :: include_helicity_avg_factor = .true.
   logical, parameter :: include_symmetry_factor = .true.

contains
   subroutine     inspect_lo_diagram(values, d, h, unit)
      use uussbb_color, only: numcs
      implicit none

      complex(ki), dimension(numcs), intent(in) :: values
      integer, intent(in) :: d, h
      integer, intent(in), optional :: unit

      integer :: ch, i

      if(present(unit)) then
              ch = unit
      else
              ch = 5
      end if

      do i=1,numcs
         write(ch,'(A11,I6,A1,I3,A1,I3,A9,G23.16,A1,G23.16,A2)') &
            & "evt.set_lo(", d, ",", i-1, ",", h, &
            & ",complex(", real(values(i)), ",", aimag(values(i)), "))"
      end do
   end subroutine inspect_lo_diagram

   subroutine     inspect_nlo_diagram(values, d, h, unit)
      use uussbb_color, only: numcs
      implicit none

      complex(ki), dimension(-2:0), intent(in) :: values
      integer, intent(in) :: d, h
      integer, intent(in), optional :: unit

      integer :: ch

      if(present(unit)) then
              ch = unit
      else
              ch = 5
      end if

      write(ch,'(A12,I6,A1,I3,A11,G23.16,A1,G23.16,A2)') &
         & "evt.set_nlo(", d, ",", h, &
         & ",2,complex(", real(values(-2)), ",", aimag(values(-2)), "))"
      write(ch,'(A12,I6,A1,I3,A11,G23.16,A1,G23.16,A2)') &
         & "evt.set_nlo(", d, ",", h, &
         & ",1,complex(", real(values(-1)), ",", aimag(values(-1)), "))"
      write(ch,'(A12,I6,A1,I3,A11,G23.16,A1,G23.16,A2)') &
         & "evt.set_nlo(", d, ",", h, &
         & ",0,complex(", real(values(0)), ",", aimag(values(0)), "))"
   end subroutine inspect_nlo_diagram

end module uussbb_config

