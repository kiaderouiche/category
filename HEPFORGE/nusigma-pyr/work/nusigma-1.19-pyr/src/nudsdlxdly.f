***********************************************************************
*** function nudsdlxdly is the same as nudsdxdy but with the differential
*** in x replaced by a differential in ln(x) and the differential
*** in y replaced by a differential in ln(y).
***********************************************************************

      real*8 function Nudsdlxdly(E,lx,ly,nu,targ,int)
      implicit none
      real*8 E,lx,xx,ly,yy,Nudsdxdy
      integer nu
      character*1 targ
      character*2 int

c...The xx at the end is the Jacobian from x->ln(x)
c...The yy at the end is teh Jacobian from y->ln(y)
      xx=exp(lx)
      yy=exp(ly)
      nudsdlxdly=nudsdxdy(E,xx,yy,nu,targ,int)*xx*yy
      return
      end
