***********************************************************************
*** function nusigint returns the total neutrino-nucleon cross section
*** in the energy range 1 GeV to 10^12 GeV.
*** The cross section is calculated with the CTEQ6-DIS parton distribution
*** functions (calculated with nusigma.f) and interpolated here.
*** Input:  E            Neutrino energy (GeV)
***         nutype       Neutrino type
***                      1 = nu_e
***                      2 = nu_e-bar
***                      3 = nu_mu
***                      4 = nu_mu-bar
***                      5 = nu_tau
***                      6 = nu_tau-bar
***         target       Target ('p' for proton, 'n' for neutron)
***         interaction  Interaction type ('CC'=charged current, 
***                      'NC'=neutral current)
*** Output: the cross section in units of cm^2
*** Modified: 2007-09-04 to allow for tau mass suppression of
*** nu_tau CC cross sections
***********************************************************************

      real*8 function nusigint(E,nutype,target,interaction)

      implicit none

      include 'nuver.h'

      real*8 e,ep
      character*2 interaction
      character*1 target
     
      integer nutype,nui,targi,inti,i,j,k,l,ei

c...These are the filenames
c...Index 1: 1=nu, 2=nubar
c...  2: 1=p,2=n
c...  3: 1=CC, 2=NC
c...I.e. array is nu-p-CC, nubar-p-CC,nu-n-CC, nubar-n-CC,
c...              nu-p-NC, nubar-p-NC,nu-n-NC, nubar-n-NC
c...In each file, there are the cross sections for the three different
c...flavours. Second index in nus is the nutype (1-6).
      character*128 nufile(2,2,2)
      character*200 file
      character*80 scratch
      real*8 enu(0:60),nus(0:60,6,2,2)
      common /nuspar/nufile,nus,enu
      save /nuspar/

      data nufile/'dat/sig-nu-p-cc.dat','dat/sig-nubar-p-cc.dat',
     &  'dat/sig-nu-n-cc.dat','dat/sig-nubar-n-cc.dat',
     &  'dat/sig-nu-p-nc.dat','dat/sig-nubar-p-nc.dat',
     &  'dat/sig-nu-n-nc.dat','dat/sig-nubar-n-nc.dat'/

      logical first
      data first/.true./
      save first

c...On first call, read files
      if (first) then
        call nusetup
        write(*,*) 'Loading files from ',nudir(1:nri)
        do i=1,2
          do j=1,2
            do k=1,2
              file=nudir(1:nri)//nufile(i,j,k)
              open(unit=50,file=file,status='old',
     &          form='formatted')
              read(50,*) scratch ! read header line 1
              read(50,*) scratch ! read header line 2
              read(50,*) scratch ! read header line 3
              do l=0,60
                read(50,*) enu(l),
     &             nus(l,i,j,k),nus(l,i+2,j,k),nus(l,i+4,j,k)
                nus(l,i,j,k)=nus(l,i,j,k)*1.d-36 ! pb->cm^2
                nus(l,i+2,j,k)=nus(l,i+2,j,k)*1.d-36 ! pb->cm^2
                nus(l,i+4,j,k)=nus(l,i+4,j,k)*1.d-36 ! pb->cm^2
              enddo
              close(50)
            enddo
          enddo
        enddo
        first=.false.
      endif

      nui=nutype

      if (target.eq.'p'.or.target.eq.'P') then
        targi=1
      else
        targi=2
      Endif

      if (interaction.eq.'CC'.or.interaction.eq.'cc') then
        inti=1
      else
        inti=2
      endif

c...The energy bins are 5 per decade starting at 1 GeV. Find which bin
c...we are in and interpolate (in log-log-space).
      ei=int(log10(e)*5)
      ep=log10(e)*5-ei

      if (e.ge.enu(0).and.e.lt.enu(60)) then
        nusigint=10**(log10(nus(ei,nui,targi,inti))*(1.0d0-ep)
     &    +log10(nus(ei+1,nui,targi,inti))*ep)
      else
        nusigint=0.0d0
      endif
 
      return
      end
