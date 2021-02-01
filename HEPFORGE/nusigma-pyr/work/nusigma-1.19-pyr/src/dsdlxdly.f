***********************************************************************
*** Function dsdlxdly is the same as dsdxdy but with ln(x) and ln(y)
*** as arguments instad of x and y. It returns the differential cross
*** section differential in ln(x) and ln(y)
*** y is transferred in a common block
***********************************************************************
      real*8 function dsdlxdly(lx)
      real*8 x,lx,dsdxdy

      real*8 y
      common /nu_int/y
      save /nu_int/

      x=exp(lx)
c...Get the differential cross section. y is transferred through
c...common blocks
      dsdlxdly=dsdxdy(x)*x*y  ! x is the Jacobian of x->ln(x), same for y
      return
      end
