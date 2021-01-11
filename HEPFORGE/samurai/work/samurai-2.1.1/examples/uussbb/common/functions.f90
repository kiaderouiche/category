module     uussbb_functions
   use uussbb_model
   implicit none
contains
   subroutine     init_functions()
      implicit none
      
      NA = (NC*NC-(1.0_ki))
         end subroutine init_functions

   pure function cond_real(det, ex1, ex2) result(ex)
      implicit none
      real(ki), intent(in) :: det, ex1, ex2
      real(ki) :: ex
      if (det > 0.0_ki) then
         ex = ex1
      else
         ex = ex2
      end if
   end  function cond_real

   function     fhf2(tb, mu, mq3, mu3, md3, at, ab, mg2, mg3, ma, mt, mb, tp)
      real(ki), intent(in) :: tb, mu, mq3, mu3, md3, at, ab
      real(ki), intent(in) :: mg2, mg3, ma, mt, mb, tp
      real(ki) :: fhf2
      integer :: sw

      if ((mq3 .eq. 0.0_ki) .and. (mu3 .eq. 0.0_ki)) then
         fhf2 = 0.0_ki
      else
         sw = floor(tp + 0.50_ki)
	 if ((sw .lt. 1) .or. (sw .gt. 5)) then
	    print*, "fhf1: wrong selector"
	    stop
	 end if

	 ! Routine not included in golem !!
         !!!fhf2 = fhf2f(tb, mu, mq3, mu3, md3, at - mu/tb, ab - mu*tb, &
	 !!!     &   mg2, mg3, ma, mt, mb, sw)
	 ! If you uncomment the above, comment out the line below !!
	 fhf2 = 0.0_ki
      end if
   end function fhf2

   pure function sort4(m1, m2, m3, m4, n)
      implicit none
      real(ki), intent(in) :: m1, m2, m3, m4
      integer, intent(in) :: n
      real(ki) :: sort4

      real(ki), dimension(4) :: m
      logical :: f
      integer :: i
      real(ki) :: tmp

      m(1) = m1
      m(2) = m2
      m(3) = m3
      m(4) = m4

      ! Bubble Sort
      do
      	 f = .false.

	 do i=1,3
	    if (abs(m(i)) .gt. abs(m(i+1))) then
	       tmp = m(i)
	       m(i) = m(i+1)
	       m(i+1) = tmp
	       f = .true.
	    end if
         end do

         if (.not. f) exit
      end do

      sort4 = m(n)
   end  function sort4

end module uussbb_functions
