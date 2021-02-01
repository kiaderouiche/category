***********************************************************************
*** Function dsdly is dsigma/dly for neutrino-nucleon interactions
*** It does the same thing as dsdy but differential in ln(y) instead of
*** in y. The x integration is also performed over ln(x) instead of over x
***********************************************************************
      real*8 function dsdly(ly)
      implicit none

      include 'nupar.h'

      real*8 dsdlxdly,ly,xmin
      external dsdlxdly

      real*8 y
      common /nu_int/y
      save /nu_int/

      real*8 alist,blist,rlist,elist,epsrel,result,epsabs,abserr
      integer ier,iord,last,limit,neval
      dimension alist(5000),blist(5000),elist(5000),iord(5000),
     &  rlist(5000)

      logical first
      data first/.true./
      save first

      if (first) then
        call nusetup
        first=.false.
      endif

      y=exp(ly)  ! move to common block

      if (y.le.0.d0.or.y.ge.1.0d0) then
        dsdly=0.0d0
        return
      endif

      epsabs=1.d-50
      epsrel=1.d-5
      limit=5000

      xmin=Qmin**2/(2*Mneutron*Enu*y)

      call dqagseb(dsdlxdly,log(xmin),log(1.d0),
     &  epsabs,epsrel,limit,result,
     &  abserr,neval,
     &  ier,alist,blist,rlist,elist,iord,last)

      dsdly=result  ! the Jacobian y is given in dsdlxdly

      return
      end
