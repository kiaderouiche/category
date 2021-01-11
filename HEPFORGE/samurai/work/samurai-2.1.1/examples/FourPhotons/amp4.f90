module     amp4
   use precision, only: ki
   use mtopo4
   use vars
   use msamurai
   implicit none
contains
   function amplitude(vecs,pols,scale2)
      implicit none
      real(ki), dimension(4,4), intent(in) :: vecs
      complex(ki), dimension(4,4), intent(in) :: pols
      real(ki), intent(in) :: scale2
      double complex, dimension(-2:0) :: amplitude, tot
      real(ki), dimension(4) :: vec0
      real(ki), dimension(4,4) :: Vi
      real(ki), dimension(4) :: msq
      complex(ki) :: totr
      logical :: ok

      amplitude(:) = 0.0_ki
      tot(:) = 0.0_ki
      vec0(:) = 0.0_ki

      call initvars(vecs,pols)
!      Vi(1,:) = vec0
!      Vi(2,:) = vec2 + Vi(1,:)
!      Vi(3,:) = vec3 + Vi(2,:)
!      Vi(4,:) = vec4 + Vi(3,:)
!      msq(:)=mass*mass


      call InitDenominators(4,Vi,msq,vec0,mass,vec2,mass,vec2 + vec3,&
     &mass,vec2 + vec3 + vec4,mass)

     count4 = 0

      call samurai(topo4,tot,totr,Vi,msq,4,4,1,scale2,ok)
      amplitude(:) = amplitude(:) + tot(:)

   end function amplitude
end module amp4
