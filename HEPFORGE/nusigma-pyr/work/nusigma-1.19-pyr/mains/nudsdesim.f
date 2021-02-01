      program nudsdesim  
      IMPLICIT NONE

********************************************************************
*** Program to extract the differential cross section, dsigma/dEmu
*** where E_mu is the energy of the final state muon (or other lepton).
*** This code does the same thing as dsdemu in nusigmasim, but instead
*** of using Pythia, it uses Joakim's neutrino-nuclon scattering routines.
*** Author: Joakim Edsjo, edsjo@physto.se
*** Date: 2005-11-22
********************************************************************
C------------------------ Common blocks --------------------------------

C------------------------ Variables ------------------------------------

      real*8 enu,enumax,sigmath,sigmanew,emu,le,lang,
     &  he,hang
      integer i,j,nev,nuindex,ne,nui,ntot,ndec,ei,ti
      character nutype*6,inttype*2,targtype*2

      real*8 dsde(0:100),dsdtheta(0:100)
      real*8 thmax,theta,pyp,pi
      parameter(thmax=15.0d0)
      parameter(pi=3.141592653589793238d0)
      
C-----------------------------------------------------------------------


      nui=1

      inttype='CC'

      targtype='p'

      nev=1000000
      enu=100.0d0  ! GeV


c...Now start simulating
      do i=0,100
        dsde(i)=0.0d0  ! reset array
        dsdtheta(i)=0.0d0
      enddo

      do j=1,nev
        call nuNevent(enu,nui,targtype,inttype,
     &    le,lang,he,hang)
        emu=le
        ei=emu/enu*100.0d0
        dsde(ei)=dsde(ei)+1
        theta=lang
        theta=theta*180.0d0/pi  ! convert to degrees
        ti=theta/thmax*100.0d0
        ti=min(ti,100)
        dsdtheta(ti)=dsdtheta(ti)+1
      enddo

      write(*,*) ' '
      write(*,*) 'Neutrino energy: ',enu

c...Write out result
      open(unit=15,file='dat/dsde-nu-p-cc-100-tmp.dat',
     &  status='unknown',form='formatted')
      open(unit=16,file='dat/dsdth-nu-p-cc-100-tmp.dat',
     &  status='unknown',form='formatted')
      do i=0,99
        write(15,*) (dble(i)/100.0d0+0.005d0)*enu,
     &    dsde(i)/nev*100.0d0/Enu
        write(16,*) (dble(i)/100.0d0+1.0d0/200.0d0)*thmax,
     &    dsdtheta(i)/nev*100.0d0/thmax
      enddo
 
      close(15)
      close(16)

      end




