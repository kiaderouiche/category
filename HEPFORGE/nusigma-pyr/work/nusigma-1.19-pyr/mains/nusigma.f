      program nusigma

***********************************************************************
*** Program nusigma calculates the neutrino-nucleon cross sections
*** with a given parton distribution function (currently CTEQ6).
*** Both charged and neutral current cross sections on neutrons
*** and protons respectively are calculated. The cross sections on neutrons
*** and protons are calculated with routines written by Joakim Edsjo.
*** The isoscalar cross sections are calculated written by Joakim Edsjo,
*** but based on java-routines from Dima Chirkin and Wolfgang Rodhe (MMC).
*** The isoscalar routines are only implemented for testing purposes.
***
*** Date: 2005-11-23
*** Joakim Edsjo, edsjo@physto.se
***********************************************************************
      implicit none

      include 'nupar.h'
      include 'nuver.h'

      real*8 NuCross,sigmae,sigmam,sigmat,E
      integer i,ndec,ntot,how


      call nusetup

c...Open up data files
      open(unit=41,file='dat/sig-nu-p-cc.dat',status='unknown',
     &  form='formatted')
      open(unit=42,file='dat/sig-nu-n-cc.dat',status='unknown',
     &  form='formatted')
      open(unit=43,file='dat/sig-nubar-p-cc.dat',status='unknown',
     &  form='formatted')
      open(unit=44,file='dat/sig-nubar-n-cc.dat',status='unknown',
     &  form='formatted')
      open(unit=45,file='dat/sig-nu-p-nc.dat',status='unknown',
     &  form='formatted')
      open(unit=46,file='dat/sig-nu-n-nc.dat',status='unknown',
     &  form='formatted')
      open(unit=47,file='dat/sig-nubar-p-nc.dat',status='unknown',
     &  form='formatted')
      open(unit=48,file='dat/sig-nubar-n-nc.dat',status='unknown',
     &  form='formatted')

c...Write header
      do i=41,48
        write(i,98) 'Generated with ',nuversion
        write(i,98) 'PDF used: ',pdftag
        write(i,99) 'Qmin = ',Qmin
      enddo
 98   format('#',1x,10A)
 99   format('#',1x,A,E12.6)
 100  format(4(1x,E12.6))

c...Loop over cross energies
      ntot=12  ! upper decade (10^ntot GeV)
      ndec=5  ! number of points per decade
      do i=0,ntot*ndec
        E=10**(dble(i)/dble(ndec))

        sigmae=NuCross(E,1,'p','CC',2)
c        sigmam=NuCross(E,3,'p','CC',2)
        sigmam=sigmae ! these are the same
        sigmat=NuCross(E,5,'p','CC',2)
        write(41,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,1,'n','CC',2)
c        sigmam=NuCross(E,3,'n','CC',2)
        sigmam=sigmae ! these are the same
        sigmat=NuCross(E,5,'n','CC',2)
        write(42,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,2,'p','CC',2)
c        sigmam=NuCross(E,4,'p','CC',2)
        sigmam=sigmae ! these are the same
        sigmat=NuCross(E,6,'p','CC',2)
        write(43,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,2,'n','CC',2)
c        sigmam=NuCross(E,4,'n','CC',2)
        sigmam=sigmae ! these are the same
        sigmat=NuCross(E,6,'n','CC',2)
        write(44,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,1,'p','NC',2)
c        sigmam=NuCross(E,3,'p','NC',2)
c        sigmat=NuCross(E,5,'p','NC',2)
        sigmam=sigmae ! these are the same
        sigmat=sigmae ! these are the same
        write(45,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,1,'n','NC',2)
c        sigmam=NuCross(E,3,'n','NC',2)
c        sigmat=NuCross(E,5,'n','NC',2)
        sigmam=sigmae ! these are the same
        sigmat=sigmae ! these are the same
        write(46,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,2,'p','NC',2)
c        sigmam=NuCross(E,4,'p','NC',2)
c        sigmat=NuCross(E,6,'p','NC',2)
        sigmam=sigmae ! these are the same
        sigmat=sigmae ! these are the same
        write(47,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        sigmae=NuCross(E,2,'n','NC',2)
c        sigmam=NuCross(E,4,'n','NC',2)
c        sigmat=NuCross(E,6,'n','NC',2)
        sigmam=sigmae ! these are the same
        sigmat=sigmae ! these are the same
        write(48,100) e,sigmae*1d36,sigmam*1d36,sigmat*1d36

        write(*,*) 'Iteration ',i,' at energy ',E,' GeV done.'

      enddo

      end


