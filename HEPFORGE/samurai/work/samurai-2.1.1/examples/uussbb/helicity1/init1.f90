module     uussbb_init1
   use precision, only: ki
   use uussbb_color, only: numcs
   use uussbb_kinematics
   use uussbb_model
   implicit none

contains

subroutine     init_event(vecs)
   implicit none
   real(ki), dimension(num_legs,4), intent(in) :: vecs
   call init_mandelstam(vecs)
   call init_sp(vecs)
end subroutine init_event

end module uussbb_init1
