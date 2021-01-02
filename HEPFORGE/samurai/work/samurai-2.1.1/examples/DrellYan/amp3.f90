module     amp3
   use precision, only: ki
   use msamurai
   use mtopo3
   implicit none

contains

   function amplitude(vecs,scale2)
      implicit none
      real(ki), dimension(4,4), intent(in) :: vecs
      real(ki), intent(in) :: scale2
      complex(ki), dimension(-2:0) :: amp, amplitude, tot0, tot1
      real(ki), dimension(4) :: vec0
      real(ki), dimension(3,4) :: Vi
      real(ki), dimension(3) :: msq
      complex(ki) :: a1, a2, a3, t1, t2, t3, totr
      logical :: ok

      amplitude(:) = 0.0_ki
      vec0(:) = 0.0_ki

      call initvars(vecs)
      Vi(1,:) = vec0
      Vi(2,:) = vec3 + Vi(1,:)
      Vi(3,:) = vec1 + vec2 + Vi(2,:)
      msq(:)=mass*mass

      tot0(:) = 0.0_ki
      call samurai(topo0,tot0,totr,Vi,msq,3,3,1,scale2,ok)

      tot1(:) = 0.0_ki
      call samurai(topo1,tot1,totr,Vi,msq,3,3,1,scale2,ok)


      t1= tot1(-2)
      t2= tot1(-1)
      t3= tot1(0)

      a1= tot0(-2)
      a2= tot0(-1)
      a3= tot0(0)

      amplitude(-2)=a1
      amplitude(-1)=a2+t1
      amplitude( 0)=a3+t2

   end function amplitude
end module amp3
