***********************************************************************
*** subroutine nuNevent simulates one neutrino nucleon scattering
*** event and returns the resulting lepton energy and angle as well as
*** the hadronic energy and angle. To do this, the
*** cross section differential in ln(x) and ln(y) is used. The maximum
*** of the differential cross section has to be calculated beforehand
*** by the program nusigmaxfind, which creates tables of maxima in dat/.
*** These tables are then read and interpolated by nudsdlxdlymax which
*** returns the maximum for any given energy and interaction type.
***
*** Inputs
***   E           - neutrino energy in GeV (1 GeV to 10^12 GeV)
***   nu          - Neutrino type
***                 1 = nu_e
***                 2 = nu_e-bar
***                 3 = nu_mu
***                 4 = nu_mu-bar
***                 5 = nu_tau
***                 6 = nu_tau-bar
***   targ        - 'p'=proton, 'n'=neutron
***   inter       - 'CC'=charged current, 'NC' = neutral current
*** The cross section is calculated with the CTEQ6-DIS parton distribution.
*** Outputs
***   le          - lepton energy (in GeV) (total, including rest mass)
***   lang        - lepton angle (radians)
***   he          - hadronic jet energy (in GeV)
***   hang        - hadronic jet angle (radians)
***********************************************************************

      subroutine nuNevent(E,nu,targ,inter,
     &  le,lang,he,hang)

      implicit none

      include 'nupar.h'

      real*8 e,nudsdlxdlymax,nudsdlxdly,z,ds,fudge,nudsdlxdy
      real*8 le,lang,he,hang,mh,s,pl,ml,k
      real*8 h,delta,deltan
      real*8 s2thalf,xmin,x,y,lx,ly,lymin,M,dsmax,ymin,
     &  xmin0,lxmin0,lxmin,ph
      double precision pyr
      parameter(fudge=1.1d0) ! fudge factor for max of cross section
      character*2 inter
      character*1 targ

      integer nerr,maxerr
      parameter(maxerr=25)
      data nerr/0/
      save nerr

      logical first
      data first/.true./
      save first
     
      integer nu,gen

c      real*8 lmass(3) ! lepton masses
c      data lmass/0.511d-3,105.66d-3,1.777d0/

c----------------------------------------------------------------------

      if (first) then
        call nusetup ! initialize masses etc
        call SetCtq6(2)  ! Select DIS set
        first=.false.
      endif

c      Qmin=0.2260d0 ! should match setting use in creating max tables
      Qmin=0.3d0  ! to avoid extraplation problems at low Q

c...Lowest value of y
      ymin=1.d-4
      lymin=log(ymin)
c...Lowest value of x (reduce if you get warning messages from this routine)
      xmin0=1.d-6               ! lowest allowed x
      lxmin0=log(xmin0)

c...Select event
c...Select y
 10   ly=lymin*pyr(0)
      y=exp(ly)

c...Select x
c...Note: We need to generate x between xmin0 and 1 (and not between
c...xmin and 1) to get even sampling of the log(x)-log(y)-space
      xmin=Qmin**2/(2*Mneutron*E*y)
      if (xmin.lt.xmin0) then
         nerr=nerr+1
         if (nerr.le.maxerr) then
            write(*,*) 'WARNING in nuNevent:',
     &        ' too high xmin0 = ',xmin0,' at E=',E,' GeV.'
            write(*,*) 'Lower xmin0 to generate events correctly at',
     &        ' high energies.'
         endif
         if (nerr.eq.maxerr) then
            write(*,*) 'This warning has been printed ',nerr,' times.'
            write(*,*) 'Further warnings will not be printed.'
         endif
      endif
      lxmin=log(xmin)
      lx=pyr(0)*lxmin0
      ds=Nudsdlxdly(E,lx,ly,nu,targ,inter)
      dsmax=nudsdlxdlymax(E,nu,targ,inter)
      if (ds.gt.dsmax*fudge) then
        write(*,*) 'WARNING in nuNevent:',
     &    ' incorrect max of cross section.'
        write(*,*) 'nu=',nu,'  targ=',targ,
     &    '  inter=',inter
        write(*,*) 'E=',E,'  x=',exp(lx),'  y=',y
        write(*,*) 'ds=',ds,'  dsmax=',dsmax,'  xmin=',xmin
        write(*,*) 'Increase fudge factor to at least ',
     &    ds/dsmax
      endif

      if (dsmax*pyr(0).gt.ds) goto 10  ! skip event, generate new one

c...OK, now calculate kinematical variables
      x=exp(lx)
      le=(1-y)*E
      if (targ.eq.'p') then
        M=Mproton
      else
        M=Mneutron
      endif

c...Define outgoing lepton masses
      if (inter.eq.'CC'.or.inter.eq.'CC') then ! CC
         if (nu.eq.1.or.nu.eq.2) then ! add electron mass correction
            ml=me
         elseif (nutype.eq.3.or.nutype.eq.4) then ! add muon mass correction
            ml=mmu
         elseif (nutype.eq.5.or.nutype.eq.6) then ! add tau mass correction
            ml=mtau
         endif
      else ! NC
         ml=0.d0
      endif

c...check that these are OK (not all x and y are OK).
c...Condition (7) from Levy. hep-ph/0407371
c...Note, we do not need to check this here as it is done in dsdxdy.f
c      delta=ml**2/(2.0d0*M*E)  ! ml**2/(s-M**2)
c...Condition (7) from Levy. hep-ph/0407371
c      h=x*y+delta
c      deltan=M**2/(2.0d0*M*E)
c      if ((1.d0+x*deltan)*h**2-(x+delta)*h+x*delta.gt.0) then
c        write(*,*) 
c     &   'INFORMATION in nuNevent: kinematically disallowed.'
c        write(*,*) 'Generating new event'
c        goto 10 ! generate new event
c      endif

c...Old approximate code
c      s2thalf=M*x*y/(2.d0*le)  ! JE CHECK
c      lang=asin(min(sqrt(s2thalf),1.0d0))*2.0d0

c      he=e+M-le  ! Total energy of hadronic remnant
c      ph=sqrt(max(he**2-M**2,0.0d0)) ! momentum of hadronic remnant
c      hang=asin(max(-le*sin(lang)/ph,-1.0d0)) 

c...New accurate code
c...CMS energy
      s=M**2+2.d0*M*E
c...Invariant mass of hadronic remnant
      mh=sqrt(max(y*(1.d0-x)*(s-M**2)+M**2,0.d0))

c...Three-momentum of outgoing lepton
      pl=sqrt(max(le**2-ml**2,0.d0))

c      if (pl.eq.0.d0) then
c         write(*,*) 'WARNING in nuNevent. pl=0.'
c         write(*,*) 'Argument is ',le**2-ml**2
c         write(*,*) 'Should not get here.'
c         goto 10 ! generate new event
c      endif

c...Three-momentum of outgoing hadronic shower
      k=sqrt(max((E+M-le)**2-mh**2,0.d0))

c      if (k.eq.0.d0) then
c         write(*,*) 'WARNING in nuNevent. k=0.'
c         write(*,*) 'Argument is ',(E+M-le)**2-mh**2
c         write(*,*) 'Should not get here.'
c         goto 10 ! generate new event
c      endif


c...Scattering angle of outgoing lepton
      s2thalf=(k**2-(E-pl)**2)/(4.d0*pl*E)
      lang=asin(min(sqrt(s2thalf),1.0d0))*2.0d0

c      if (s2thalf.gt.1.d0) then
c         write(*,*) 'WARNING in nuNevent. s2thalf > 1.'
c         write(*,*) 'Should not get here.'
c         goto 10
c      endif

c...Scattering angle of outgoing hadronic shower
      hang=-asin(min(pl/k*sin(lang),1.d0))

c...Energy of hadronic shower
      he=e+M-le

      return
      end
