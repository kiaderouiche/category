      program nusigcheck

***********************************************************************
*** Program nusigcheck checks the accuracy of the fits
***
*** Date: 2005-10-17
*** Joakim Edsjo, edsjo@physto.se
***********************************************************************
      implicit none

      real*8 nusig
      real*8 Enu(61),nupcc(61),nupnc(61),nuncc(61),nunnc(61),
     &  anupcc(61),anupnc(61),anuncc(61),anunnc(61),r(8)
      integer i,j
      character*128 scratch

      real*8 tmp

c...Open up data files
      open(unit=41,file='dat/sig-nu-p-cc.dat',status='old',
     &  form='formatted')
      open(unit=42,file='dat/sig-nu-n-cc.dat',status='old',
     &  form='formatted')
      open(unit=43,file='dat/sig-nubar-p-cc.dat',status='old',
     &  form='formatted')
      open(unit=44,file='dat/sig-nubar-n-cc.dat',status='old',
     &  form='formatted')
      open(unit=45,file='dat/sig-nu-p-nc.dat',status='old',
     &  form='formatted')
      open(unit=46,file='dat/sig-nu-n-nc.dat',status='old',
     &  form='formatted')
      open(unit=47,file='dat/sig-nubar-p-nc.dat',status='old',
     &  form='formatted')
      open(unit=48,file='dat/sig-nubar-n-nc.dat',status='old',
     &  form='formatted')

      do i=41,48
        read(i,*) scratch
        read(i,*) scratch
        read(i,*) scratch
      enddo

      do i=1,21
        read(41,*) enu(i),nupcc(i)
        read(42,*) enu(i),nuncc(i)
        read(43,*) enu(i),anupcc(i)
        read(44,*) enu(i),anuncc(i)
        read(45,*) enu(i),nupnc(i)
        read(46,*) enu(i),nunnc(i)
        read(47,*) enu(i),anupnc(i)
        read(48,*) enu(i),anunnc(i)
      enddo
      
      close(41)
      close(42)
      close(43)
      close(44)
      close(45)
      close(46)
      close(47)
      close(48)


      open(unit=49,file='dat/nusigcheck.dat',status='unknown',
     &  form='formatted')
c...Now check cross sections

      do i=1,21
        write(*,*) '***** Enu = ',enu(i),' GeV *****'

        tmp=nusig(enu(i),1,'p','CC')
        r(1)=(tmp/nupcc(i)-1)*100
        write(*,101) 'nu p cc: ',nupcc(i),tmp,r(1)

        tmp=nusig(enu(i),1,'n','CC')
        r(2)=(tmp/nuncc(i)-1)*100
        write(*,101) 'nu n cc: ',nuncc(i),tmp,r(2)

        tmp=nusig(enu(i),2,'p','CC')
        r(3)=(tmp/anupcc(i)-1)*100
        write(*,101) 'nu-bar p cc: ',anupcc(i),tmp,r(3)

        tmp=nusig(enu(i),2,'n','CC')
        r(4)=(tmp/anuncc(i)-1)*100
        write(*,101) 'nu-bar n cc: ',anuncc(i),tmp,r(4)

        tmp=nusig(enu(i),1,'p','NC')
        r(5)=(tmp/nupnc(i)-1)*100
        write(*,101) 'nu p nc: ',nupnc(i),tmp,r(5)

        tmp=nusig(enu(i),1,'n','NC')
        r(6)=(tmp/nunnc(i)-1)*100
        write(*,101) 'nu n nc: ',nunnc(i),tmp,r(6)

        tmp=nusig(enu(i),2,'p','NC')
        r(7)=(tmp/anupnc(i)-1)*100
        write(*,101) 'nu-bar p nc: ',anupnc(i),tmp,r(7)

        tmp=nusig(enu(i),2,'n','NC')
        r(8)=(tmp/anunnc(i)-1)*100
        write(*,101) 'nu-bar n nc: ',anunnc(i),tmp,r(8)

 101    format(A13,1x,2(E11.5,1x),F6.2,' %')

        write(*,*) ' '
        write(49,'(9(E12.6,1x))') enu(i),(r(j),j=1,8)
      enddo

      end

