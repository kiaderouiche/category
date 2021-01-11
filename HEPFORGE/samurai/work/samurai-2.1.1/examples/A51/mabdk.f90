module mabdk
  use precision
  use constants
  use kinematic
  use vars
  implicit none

contains

   function abdk(h, vecs, scale2)
      implicit none
      integer :: h
      real(ki), dimension(5,4), intent(in) :: vecs
      real(ki), intent(in) :: scale2
      complex(ki), dimension(3) :: abdk
      real(ki), dimension(4) :: v1, v2, v3, v4, v5, v15
      complex(ki) :: A51lo, FF, l12, l23, z12, z13, z15, z23, z34, z45

      if (h.eq.-1) then

      v1(:) = vec1(:)
      v2(:) = vec5(:)
      v3(:) = vec2(:)
      v4(:) = vec4(:)
      v5(:) = vec3(:)
      v15(:)= v1(:) + v5(:)

      z12=zb(v1,v2)
      z13=zb(v1,v3)
      z15=za(v1,v5)
      z23=zb(v2,v3)
      z34=zb(v3,v4)
      z45=zb(v4,v5)

      elseif (h.eq.+1) then

      v1(:) = vec2(:)
      v2(:) = vec5(:)
      v3(:) = vec1(:)
      v4(:) = vec3(:)
      v5(:) = vec4(:)
      v15(:)= v1(:) + v5(:)

      z12=za(v1,v2)
      z13=za(v1,v3)
      z15=zb(v1,v5)
      z23=za(v2,v3)
      z34=za(v3,v4)
      z45=za(v4,v5)

      endif


      A51lo =-im*z34**2/(z12*z23*z45)

      l12=Lnrat(scale2,-two*dotproduct(v1,v2))
      l23=Lnrat(scale2,-two*dotproduct(v2,v3))

      FF=im*A51lo&
     & *(Lsm1(-two*dotproduct(v1,v2),-two*dotproduct(v4,v5),&
     &        -two*dotproduct(v2,v3),-two*dotproduct(v4,v5))&
     & -(z13*z15*z45)/z34/two/dotproduct(v4,v5)&
     &  *L0(-two*dotproduct(v2,v3),-two*dotproduct(v4,v5))&
     & +0.5_ki*(z13*z15*z45)**2/z34**2/&
     & four/dotproduct(v4,v5)**2&
     & *L1(-two*dotproduct(v2,v3),-two*dotproduct(v4,v5)))

      abdk(1) = -2.0_ki*A51lo

      abdk(2) = -(1.5_ki + l12 + l23)*A51lo

      abdk(3) = -(0.5_ki*l12**2+0.5_ki*l23**2+1.5_ki*l23+3.0_ki)*im*A51lo&
     & -FF

      abdk(3) = -im*abdk(3)

      abdk(:) = abdk(:)/A51lo

   end function abdk

!--- functions below adapted from MCFM

    function L0(x,y)
      implicit none
      complex(ki) :: L0
      real(ki) :: x,y,denom
      denom=one-x/y
      L0=Lnrat(x,y)/dcmplx(denom)
end function L0


    function L1(x,y)
      implicit none
      real(ki) :: x,y,denom
      complex(ki) :: L1
      denom=one-x/y
      L1=(L0(x,y)+cone)/dcmplx(denom)
end function L1

    function Lsm1(x1,y1,x2,y2)
      implicit none
      real(ki) :: x1,x2,y1,y2,r1,r2,omr1,omr2,ddilog
      complex(ki) :: dilog1,dilog2,Lsm1
      r1=x1/y1
      r2=x2/y2
      omr1=one-r1
      omr2=one-r2
      if (omr1 .gt. one) then 
         dilog1=dcmplx(pi*pi/six-ddilog(r1))-Lnrat(x1,y1)*dcmplx(log(omr1))
      else
         dilog1=dcmplx(ddilog(omr1))
      endif
      if (omr2 .gt. one) then 
         dilog2=dcmplx(pi*pi/six-ddilog(r2))-Lnrat(x2,y2)*dcmplx(log(omr2))
      else
         dilog2=dcmplx(ddilog(omr2))
      endif
      Lsm1=dilog1+dilog2+Lnrat(x1,y1)*Lnrat(x2,y2)-dcmplx(pi*pi/six)
end function Lsm1


    function Lnrat(x,y)
      implicit none
      real(ki) :: x,y,htheta
      complex(ki) :: Lnrat
!--- define Heaviside theta function (=1 for x>0) and (0 for x < 0)
      htheta(x)=half+half*sign(one,x)
      Lnrat=dcmplx(dlog(abs(x/y)))-impi*dcmplx((htheta(-x)-htheta(-y)))
end function Lnrat

end module mabdk
