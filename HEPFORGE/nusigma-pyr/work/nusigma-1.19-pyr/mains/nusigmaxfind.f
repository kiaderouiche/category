      program nusigmaxfind

***********************************************************************
*** Program nusigmaxfind calculates the neutrino-nucleon cross sections
*** with a given parton distribution function (currently CTEQ6).
*** Both charged and neutral current cross sections on neutrons
*** and protons respectively are calculated. 
***
*** The routine scans through all cross sections for neutrino energies
*** from 1 GeV to 10^12 GeV to find the maximum of the differential cross
*** sections (differential in both ln(x) and y). 
*** This maximum is then used in Monte Carlo applications
*** where events are chosen according to the differential cross sections
*** calculated by dsdlxdly.
***
*** Date: 2005-11-22
*** Joakim Edsjo, edsjo@physto.se
***********************************************************************
      implicit none

      include 'nupar.h'
      include 'nuver.h'

      real*8 E,Nudsdlxdly,x,lx,ly,y,tmp,xmax,ymax,xmin
      integer i,ndec,ntot,j,k,l,nx,ny
      parameter(ndec=5,   ! number of points per decade
     &          ntot=12,   ! number of decades
     &          nx=1000,    ! number of points in x
     &          ny=1000)    ! number of points in y

      real*8 dsdlxdlymax(2,2,2,0:ntot*ndec)


      call nusetup

c...Open up data files
      open(unit=41,file='dat/dsdlxdlymax-nu-p-cc.dat',
     &  status='unknown',form='formatted')
      open(unit=42,file='dat/dsdlxdlymax-nu-n-cc.dat',
     &  status='unknown',form='formatted')
      open(unit=43,file='dat/dsdlxdlymax-nubar-p-cc.dat',
     &  status='unknown',form='formatted')
      open(unit=44,file='dat/dsdlxdlymax-nubar-n-cc.dat',
     &  status='unknown',form='formatted')
      open(unit=45,file='dat/dsdlxdlymax-nu-p-nc.dat',
     &  status='unknown',form='formatted')
      open(unit=46,file='dat/dsdlxdlymax-nu-n-nc.dat',
     &  status='unknown',form='formatted')
      open(unit=47,file='dat/dsdlxdlymax-nubar-p-nc.dat',
     &  status='unknown',form='formatted')
      open(unit=48,file='dat/dsdlxdlymax-nubar-n-nc.dat',
     &  status='unknown',form='formatted')

c...Write header
      do i=41,48
        write(i,98) 'Generated with ',nuversion
        write(i,98) 'PDF used: ',pdftag
        write(i,99) 'Qmin = ',Qmin
      enddo
 98   format('#',1x,10A)
 99   format('#',1x,A,E12.6)


      do j=1,2
        do k=1,2
          do l=1,2
            do i=0,ntot*ndec
              dsdlxdlymax(j,k,l,i)=0.0d0
            enddo
          enddo
        enddo
      enddo

c...Loop over energies

      do i=0,ntot*ndec
        E=10**(dble(i)/dble(ndec))
        write(*,*) 'Now finding max at step ',i,' at energy ',
     &    E,' GeV'

c...Indices of dsdlxdlymax are nui (1=nu, 2=nubar),targi (1=p, 2=n),
c...inti(1=CC, 2=NC)
        do j=0,ny
          ly=log(1d-4)*dble(j)/dble(ny)
          y=exp(ly)
          xmin=Qmin**2/(2*Mneutron*E*y)
          if (xmin.ge.1.0d0) goto 20
          do k=0,nx-1
            lx=log(xmin)*(dble(k)+0.5d0)/dble(nx)

            tmp=Nudsdlxdly(E,lx,ly,1,'p','CC')
            if (tmp.gt.dsdlxdlymax(1,1,1,i)) then
              dsdlxdlymax(1,1,1,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,1,'n','CC')
            if (tmp.gt.dsdlxdlymax(1,2,1,i)) then
              dsdlxdlymax(1,2,1,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,2,'p','CC')
            if (tmp.gt.dsdlxdlymax(2,1,1,i)) then
              dsdlxdlymax(2,1,1,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,2,'n','CC')
            if (tmp.gt.dsdlxdlymax(2,2,1,i)) then
              dsdlxdlymax(2,2,1,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,1,'p','NC')
            if (tmp.gt.dsdlxdlymax(1,1,2,i)) then
              dsdlxdlymax(1,1,2,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,1,'n','NC')
            if (tmp.gt.dsdlxdlymax(1,2,2,i)) then
              dsdlxdlymax(1,2,2,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,2,'p','NC')
            if (tmp.gt.dsdlxdlymax(2,1,2,i)) then
              dsdlxdlymax(2,1,2,i)=tmp
            endif

            tmp=Nudsdlxdly(E,lx,ly,2,'n','NC')
            if (tmp.gt.dsdlxdlymax(2,2,2,i)) then
              dsdlxdlymax(2,2,2,i)=tmp
            endif

          enddo
 20       continue
        enddo
      enddo


      write(*,*) 'Writing results to files...'
      do i=0,ntot*ndec
        E=10**(dble(i)/dble(ndec))
        write(41,*) E,dsdlxdlymax(1,1,1,i)
        write(42,*) E,dsdlxdlymax(1,2,1,i)
        write(43,*) E,dsdlxdlymax(2,1,1,i)
        write(44,*) E,dsdlxdlymax(2,2,1,i)
        write(45,*) E,dsdlxdlymax(1,1,2,i)
        write(46,*) E,dsdlxdlymax(1,2,2,i)
        write(47,*) E,dsdlxdlymax(2,1,2,i)
        write(48,*) E,dsdlxdlymax(2,2,2,i)
      enddo
      write(*,*) 'Done.'
      end


