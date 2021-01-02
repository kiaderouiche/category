module     amp4
   use precision, only: ki
   use mtopo4
   use msamurai
   use vars

contains

   function amplitude(vecs, pol5, scale2)
      implicit none
      real(ki), dimension(5,4), intent(in) :: vecs
      complex(ki), dimension(4), intent(in) :: pol5
      real(ki), intent(in) :: scale2

      real(ki), dimension(4) :: vec0
      real(ki), dimension(4,4) :: Vi
      real(ki), dimension(4) :: msq
      complex(ki), dimension(3) :: amplitude, tot
      complex(ki) :: totr
      logical :: ok

      vec0(:) = 0.0_ki
      amplitude(:) = 0.0_ki
      tot(:) = 0.0_ki

      call initvars(vecs,pol5)
      Vi(1,:) = vec0
      Vi(2,:) = vec2 + Vi(1,:)
      Vi(3,:) = vec5 + Vi(2,:)
      Vi(4,:) = vec1 + Vi(3,:)
      msq(:)=mass*mass

      call samurai(topo4,tot,totr,Vi,msq,4,4,1,scale2,ok)

!--- finite renormalization in DR with Anticommuting gamma5
      tot(3)=tot(3)-0.5_ki

      amplitude(:) = tot(:)

   end function amplitude
end module amp4

