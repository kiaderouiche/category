*          -*- mode: fortran -*-
      integer nutype,iparton
      character*2 interaction
      character*1 target
      real*8 enu,mncorr
      common /nupar/enu,mncorr,nutype,iparton,interaction,target
      save /nupar/

      character*40 pdftag
      real*8 Mw,Mz,mtau,mmu,me,GF,Mproton,Mneutron,gev2cm2,s2thw,
     &   d1,d2,d3,gvu,gau,gvd,gad,
     &   pi,Qmin
      common /nuphys/
     &   Mw,Mz,mtau,mmu,me,GF,Mproton,Mneutron,gev2cm2,s2thw,
     &   d1,d2,d3,gvu,gau,gvd,gad,
     &   pi,Qmin,pdftag
      save /nuphys/
