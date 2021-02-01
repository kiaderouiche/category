***********************************************************************
*** Function dsdy is dsigma/dy for neutrino-nucleon interactions
***********************************************************************
      real*8 function dsdy(yy)
      implicit none

      include 'nupar.h'

      real*8 dsdxdy,yy,xmin
      external dsdxdy

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

      if (yy.le.0.d0.or.yy.ge.1.0d0) then
        dsdy=0.0d0
        return
      endif

      y=yy  ! move to common block

      epsabs=1.d-50
      epsrel=1.d-5
      limit=5000

      xmin=Qmin**2/(2*Mneutron*Enu*y)

      call dqagseb(dsdxdy,xmin,1.d0,epsabs,epsrel,limit,result,
     &  abserr,neval,
     &  ier,alist,blist,rlist,elist,iord,last)

      dsdy=result

      return
      end
