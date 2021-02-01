      program nusigcheck2

***********************************************************************
*** Program nusigcheck checks the accuracy of the interpolations
***
*** Date: 2005-10-17
*** Joakim Edsjo, edsjo@physto.se
***********************************************************************
      implicit none

      include 'nupar.h'
      include 'nuver.h'

      real*8 nusigint,nucross
      real*8 EEnu(61),nupcc(61),r(8),e,
     &  sint,sfull,merr
      integer i,j
      character*128 scratch

      real*8 tmp

      call nusetup

c...Open up data files
      open(unit=41,
     &  file=nudir(1:nri)//'dat/sig-nu-p-cc.dat',status='old',
     &  form='formatted')

      do i=41,41
        read(i,*) scratch
        read(i,*) scratch
        read(i,*) scratch
      enddo

      do i=1,21
        read(41,*) eenu(i),nupcc(i)
      enddo
      
      close(41)

      open(unit=49,
     &  file=nudir(1:nri)//'dat/nusigintcheck.dat',status='unknown',
     &  form='formatted')


c...Now check cross sections
      merr=0.0d0
      do i=1,20
        e=exp((log(eenu(i))+log(eenu(i+1)))/2.0d0)
        write(*,*) '***** Enu = ',e,' GeV *****'

        sint=nusigint(e,1,'p','CC')*1.d36
        sfull=nucross(e,1,'p','CC',2)*1.d36
        r(1)=(sint/sfull-1)*100
        merr=max(merr,abs(r(1)))
        write(*,101) 'nu p cc: ',sfull,sint,r(1)

        sint=nusigint(e,1,'n','CC')*1.d36
        sfull=nucross(e,1,'n','CC',2)*1.d36
        r(2)=(sint/sfull-1)*100
        merr=max(merr,abs(r(2)))
        write(*,101) 'nu n cc: ',sfull,sint,r(2)

        sint=nusigint(e,2,'p','CC')*1.d36
        sfull=nucross(e,2,'p','CC',2)*1.d36
        r(3)=(sint/sfull-1)*100
        merr=max(merr,abs(r(3)))
        write(*,101) 'nu-bar p cc: ',sfull,sint,r(3)

        sint=nusigint(e,2,'n','CC')*1.d36
        sfull=nucross(e,2,'n','CC',2)*1.d36
        r(4)=(sint/sfull-1)*100
        merr=max(merr,abs(r(4)))
        write(*,101) 'nu-bar n cc: ',sfull,sint,r(4)

        sint=nusigint(e,1,'p','NC')*1.d36
        sfull=nucross(e,1,'p','NC',2)*1.d36
        r(5)=(sint/sfull-1)*100
        merr=max(merr,abs(r(5)))
        write(*,101) 'nu p nc: ',sfull,sint,r(5)

        sint=nusigint(e,1,'n','NC')*1.d36
        sfull=nucross(e,1,'n','NC',2)*1.d36
        r(6)=(sint/sfull-1)*100
        merr=max(merr,abs(r(6)))
        write(*,101) 'nu n nc: ',sfull,sint,r(6)

        sint=nusigint(e,2,'p','NC')*1.d36
        sfull=nucross(e,2,'p','NC',2)*1.d36
        r(7)=(sint/sfull-1)*100
        merr=max(merr,abs(r(7)))
        write(*,101) 'nu-bar p nc: ',sfull,sint,r(7)

        sint=nusigint(e,2,'n','NC')*1.d36
        sfull=nucross(e,2,'n','NC',2)*1.d36
        r(8)=(sint/sfull-1)*100
        merr=max(merr,abs(r(8)))
        write(*,101) 'nu-bar n nc: ',sfull,sint,r(8)

 101    format(A13,1x,2(E11.5,1x),F6.2,' %')

        write(*,*) ' '
        write(49,'(9(E12.6,1x))') e,(r(j),j=1,8)
      enddo

      write(*,*) 'The maximum error is ',merr,'%.'
      end

