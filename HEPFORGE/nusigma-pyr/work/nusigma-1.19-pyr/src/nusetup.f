***********************************************************************
*** Set up neutrino calculations by calculating needed factors
***********************************************************************
      subroutine nusetup

      include 'nupar.h'
      include 'nuver.h'

      real*8 d12,d22,d32,d42
      integer i
      
      data Mw/80.41d0/              ! GeV
      data Mz/91.188d0/             ! GeV
      data mtau/1.77682d0/          ! GeV (PDG 2012)
      data mmu/0.105658d0/          ! GeV (PDG 2012)
      data me/0.510999d-3/          ! GeV (PDG 2012)
      data GF/1.16639d-5/           ! GeV^-2
      data Mproton/0.938272d0/      ! GeV
      data Mneutron/0.939566d0/     ! GeV
      data gev2cm2/3.89379658d-28/  ! (197.327053d-16)**2
      data s2thw/0.23124d0/
      data pi/3.141592653589793238d0/

      logical first
      data first/.true./
      save first

      include 'nuver.f'
      include 'nuroot.f'

      if (first) then
        first=.false.
      else
        return
      endif

      write(*,*) 'Initializing ',nuversion

      nudir=nuinstall // '/'     ! transfer parameter to variable


c... determine how long nudir is
      do i=128,1,-1
        if (nudir(i:i).ne.' ') then
          nri=i
          goto 20
        endif
      enddo
 20   continue

      d12=(0.5d0-2.0d0*s2thw/3.0d0)**2
      d22=(-0.5d0+s2thw/3.0d0)**2
      d32=(-2.0d0*s2thw/3.0d0)**2
      d42=(s2thw/3.0d0)**2

      d1=d12+d22+d32+d42
      d2=d12+d32-d22-d42
      d3=d12+d22-d32-d42

      gvu=0.5d0-4.0d0/3.0d0*s2thw
      gau=0.5d0
      gvd=-0.5d0+2.0d0/3.0d0*s2thw
      gad=-0.5d0

c...Include Mn/Enu correction in NC cross section or not
      mncorr=0.0d0 ! do not include it
c      mncorr=1.0d0 ! do include it (CHECK IT FIRST IF YOU DO)


c...Set up CTEQ6 library
c      call SetCtq6(1)  ! general set
c      Qmin=0.2262d0    ! Minimal Q for set 1 (M)

      call SetCtq6(2)  ! DIS set
c      Qmin=0.2260d0    ! Minimal Q for set 2 (DIS)
      Qmin=0.3d0      ! To avoid extrapolation artefacts at lower Q
      pdftag='CTEQ6-DIS (set 2)' ! explain which pdf is used

c      call SetCtq6(400) ! Cteq6.6M set
cc      Qmin=0.3d0
c      Qmin=0.45d0
c      pdftag='CTEQ6.6M (set 400)' ! explain which pdf is used

      return
      end
