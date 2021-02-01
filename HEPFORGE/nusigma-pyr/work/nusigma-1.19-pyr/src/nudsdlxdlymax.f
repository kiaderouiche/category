***********************************************************************
*** function nudsdlxdlymax returns the maximum of the differential neutrino
*** nucleon spectrum (differential in ln(x) and ln(y)). It uses tables
*** calculted by nusig2cmaxfind.f and interpolates these to return the
*** maximum as a function of incoming neutrino energy. This is used
*** in MonteCarlo simulations simulations where events are chosen from the
*** differential spectrum. Note that the maxima are found for electron
*** or muon neutrinos as the tau neutrinos are the same or smaller (due
*** to the tau mass suppression).
*** Input neutrino energy: 1 GeV to 10^12 GeV.
*** The cross section is calculated with the CTEQ6-DIS parton distribution.
***********************************************************************

      real*8 function nudsdlxdlymax(E,nutype,target,interaction)

      implicit none
      include 'nuver.h'

      real*8 e,ep
      character*80 scratch
      character*2 interaction
      character*1 target
     
      integer nutype,nui,targi,inti,i,j,k,l,ei,rnut
      integer ntot,ndec
c...Note: ndec and ntot have to match the settings in nusigmaxfind
      parameter (ndec=5,  ! number of points per decade
     &           ntot=12) ! number of decades

c...These are the filenames
c...Index 1: 1=nu, 2=nubar, 2: 1=p,2=n, 3: 1=CC, 2=NC
c...I.e. array is nu-p-CC, nubar-p-CC,nu-n-CC, nubar-n-CC,
c...              nu-p-NC, nubar-p-NC,nu-n-NC, nubar-n-NC
      character*128 nufile(2,2,2)
      character*200 file
      real*8 enu(0:ntot*ndec),nuds2lmax(0:ntot*ndec,2,2,2)
      common /nuds2lpar/nufile,nuds2lmax,enu
      save /nuds2lpar/

      data nufile/'dat/dsdlxdlymax-nu-p-cc.dat',
     &  'dat/dsdlxdlymax-nubar-p-cc.dat',
     &  'dat/dsdlxdlymax-nu-n-cc.dat',
     &  'dat/dsdlxdlymax-nubar-n-cc.dat',
     &  'dat/dsdlxdlymax-nu-p-nc.dat',
     &  'dat/dsdlxdlymax-nubar-p-nc.dat',
     &  'dat/dsdlxdlymax-nu-n-nc.dat',
     &  'dat/dsdlxdlymax-nubar-n-nc.dat'/

      logical first
      data first/.true./
      save first

      if (nutype.eq.1.or.nutype.eq.3.or.nutype.eq.5) then ! neutrino
         rnut=1
      else ! anti-neutrino
         rnut=2
      endif

c...On first call, read files
      if (first) then
        do i=1,2
          do j=1,2
            do k=1,2
              file=nudir(1:nri)//nufile(i,j,k)
              open(unit=50,file=file,status='old',
     &          form='formatted')
              read(50,*) scratch  ! read header line 1
              read(50,*) scratch  ! read header line 2
              read(50,*) scratch  ! read header line 3
              do l=0,ntot*ndec
                read(50,*) enu(l),nuds2lmax(l,i,j,k)
              enddo
              close(50)
            enddo
          enddo
        enddo
        first=.false.
      endif

      if (rnut.eq.1) then
        nui=1
      else
        nui=2
      endif

      if (target.eq.'p') then
        targi=1
      else
        targi=2
      endif

      if (interaction.eq.'CC'.or.interaction.eq.'cc') then
        inti=1
      else
        inti=2
      endif

c...The energy bins are ndec per decade starting at 1 GeV. Find which bin
c...we are in and interpolate (in log-log-space).
      ei=int(log10(e)*ndec)
      ep=log10(e)*ndec-ei

      if (e.ge.enu(0).and.e.lt.enu(ntot*ndec)) then
        nudsdlxdlymax=
     &    10**(log10(nuds2lmax(ei,nui,targi,inti))*(1.0d0-ep)
     &    +log10(nuds2lmax(ei+1,nui,targi,inti))*ep)
      else
        nudsdlxdlymax=0.0d0
      endif
 

      return
      end
