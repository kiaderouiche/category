      program nudsde

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
*** This routine returns the differntial cross section dsigma/dEmuon
*** where Emuon is the energy of the final state lepton.
***
*** Date: 2005-10-21
*** Joakim Edsjo, edsjo@physto.se
***********************************************************************
      implicit none

      include 'nupar.h'

      real*8 NuCross,sigma,E,NuCrossDiff,Emu,sum,NuCrossDiffl
      integer i,ndec,ntot,j,k,l

      real*8 dsde(0:100,2,2,2)

      call nusetup

c...Open up data files
      open(unit=41,file='dat/dsde-nu-p-cc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=42,file='dat/dsde-nu-n-cc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=43,file='dat/dsde-nubar-p-cc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=44,file='dat/dsde-nubar-n-cc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=45,file='dat/dsde-nu-p-nc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=46,file='dat/dsde-nu-n-nc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=47,file='dat/dsde-nubar-p-nc-100.dat',
     &  status='unknown',form='formatted')
      open(unit=48,file='dat/dsde-nubar-n-nc-100.dat',
     &  status='unknown',form='formatted')


      E=100.0d0
      do i=0,100
        do j=1,2
          do k=1,2
            do l=1,2
              dsde(i,j,k,l)=0.0d0
            enddo
          enddo
        enddo
      enddo

c...Indices of dsde are nui (1=nu, 2=nubar),targi (1=p, 2=n),
c...inti(1=CC, 2=NC)
      do i=0,99
        Emu=(dble(i)/100.0d0+0.005)*E
        dsde(i,1,1,1)=Nucrossdiffl(E,Emu,1,'p','CC')
        dsde(i,1,2,1)=Nucrossdiffl(E,Emu,1,'n','CC')
        dsde(i,2,1,1)=Nucrossdiffl(E,Emu,2,'p','CC')
        dsde(i,2,2,1)=Nucrossdiffl(E,Emu,2,'n','CC')
        dsde(i,1,1,2)=Nucrossdiffl(E,Emu,1,'p','NC')
        dsde(i,1,2,2)=Nucrossdiffl(E,Emu,1,'n','NC')
        dsde(i,2,1,2)=Nucrossdiffl(E,Emu,2,'p','NC')
        dsde(i,2,2,2)=Nucrossdiffl(E,Emu,2,'n','NC')
      enddo

c...Normalize
      do i=1,2
        do j=1,2
          do k=1,2
            sum=0.0d0
            do l=0,99
              sum=sum+dsde(l,i,j,k)
            enddo
c            write(*,*) 'sum = ',sum*1.d36
            do l=0,99
              dsde(l,i,j,k)=dsde(l,i,j,k)/sum
            enddo
          enddo
        enddo
      enddo

      do i=0,99
        emu=(dble(i)/100.0d0+0.005d0)*E
        write(41,*) emu,dsde(i,1,1,1)*100/E
        write(42,*) emu,dsde(i,1,2,1)*100/E
        write(43,*) emu,dsde(i,2,1,1)*100/E
        write(44,*) emu,dsde(i,2,2,1)*100/E
        write(45,*) emu,dsde(i,1,1,2)*100/E
        write(46,*) emu,dsde(i,1,2,2)*100/E
        write(47,*) emu,dsde(i,2,1,2)*100/E
        write(48,*) emu,dsde(i,2,2,2)*100/E

      enddo

      end


