***********************************************************************
*** function nudsdlxdy is the same as nudsdxdy but with the differential
*** in x replaced by a differential in ln(x).
***********************************************************************

      real*8 function Nudsdlxdy(E,lx,yy,nu,targ,int)
      implicit none
      real*8 E,lx,xx,yy,Nudsdxdy
      integer nu
      character*1 targ
      character*2 int

c...The xx at the end is the Jacobian from x->ln(x)
      xx=exp(lx)
      nudsdlxdy=nudsdxdy(E,xx,yy,nu,targ,int)*xx
      return
      end
