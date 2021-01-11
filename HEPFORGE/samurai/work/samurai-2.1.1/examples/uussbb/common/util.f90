module     uussbb_util
   use precision, only: ki
   implicit none
contains

   pure function cond(cnd, brack, Q, mu2)
      implicit none
      logical, intent(in) :: cnd
      complex(ki), dimension(4), intent(in) :: Q
      complex(ki), intent(in) :: mu2

      complex(ki) :: cond

      interface
         pure function brack(inner_Q, inner_mu2)
            use precision, only: ki
            implicit none
            complex(ki), dimension(4), intent(in) :: inner_Q
            complex(ki), intent(in) :: inner_mu2
            complex(ki) :: brack
         end  function brack
      end interface

      if (cnd) then
         cond = brack(Q, mu2)
      else
         cond = (0.0_ki, 0.0_ki)
      end if
   end  function cond
end module uussbb_util
