***********************************************************************
*** Function dsdxdy is d2sigma/dxdy for neutrino-nucleon interactions
*** Note: y is trasferred from the common block /nu_int/
*** The isoscalar algorithm is from MMC by Dima and Wolfgang, the rest
*** is Joakim's.
*** Modified: 2007-09-04 to add tau mass suppression of CC nu_tau 
*** interaction (for p and n targets, Dimas isoscalar expression still
*** assumes the tau mass is zero).
*** The tau mass corrections are taken from Levy, hep-ph/0407371v2
*** Author: Joakim Edsjo, edsjo@physto.se
***********************************************************************
      real*8 function dsdxdy(x)

      implicit none

      real*8 pdf
      real*8 x,s,delta,h,deltan,mlepton
      real*8 Q2,Q,Mn,Mprop,F2,F3,inu,Qpdf,Ctq6Pdf,struct
      integer rnut
      logical first
      data first/.true./
      save first

      include 'nupar.h'

      real*8 y
      common /nu_int/y
      save /nu_int/

      if (first) then
        call nusetup
        first=.false.
      endif
      
      if (target.eq.'p') then     ! proton
        Mn=Mproton
      elseif (target.eq.'n') then ! neutron
        Mn=Mneutron
      elseif (target.eq.'N') then ! isoscalar
        Mn=0.5d0*(Mproton+Mneutron)
      else
        write(*,*) 'ERROR in dsdxdy: wrong target: ',target
        stop
      endif

      if (nutype.eq.1.or.nutype.eq.3.or.nutype.eq.5) then ! neutrino
        inu=1.0d0
        rnut=1 ! reduced neutrino code (1=nu, 2=nu-bar)
      else
        inu=-1.0d0
        rnut=2 ! reduced neutrino code (1=nu, 2=nu-bar)
      endif    
 

      Q2=x*y*2*Mn*Enu
      Q=sqrt(Q2)

      if (Q.lt.Qmin) then
        dsdxdy=0.0d0
        return
      endif

      Qpdf=max(Q,Qmin)
  

c...Note, due to isospin symmetry, the neutron pdf's are the same as those
c...for the proton, except that u<->d, ubar<->dbar

c...Charged current
      if (interaction.eq.'cc'.or.interaction.eq.'CC') then
        if (nutype.eq.1.or.nutype.eq.2) then ! add electron mass correction
           mlepton=me
        elseif (nutype.eq.3.or.nutype.eq.4) then ! add muon mass correction
           mlepton=mmu
        elseif (nutype.eq.5.or.nutype.eq.6) then ! add tau mass correction
           mlepton=mtau
        endif
c          s=Mn**2+2.0d0*Mn*Enu
        delta=mlepton**2/(2.0d0*Mn*Enu)  ! mtau**2/(s-Mn**2)
c...Check kinematical limits
c...Condition (7) from Levy. hep-ph/0407371
        h=x*y+delta
        deltan=Mn**2/(2.0d0*Mn*Enu)
        if ((1.d0+x*deltan)*h**2-(x+delta)*h+x*delta.gt.0) then
          dsdxdy=0.0d0
          return
        endif

        Mprop=Mw
        if (target.eq.'p'.and.rnut.eq.1) then  ! nu-p
          struct=   ! (d+s+b) + (ubar+cbar)*(1-y)^2
     &      2*x*(Ctq6Pdf(2,x,Qpdf)+Ctq6Pdf(3,x,Qpdf)+Ctq6Pdf(5,x,Qpdf))
     &      *(1.0d0-delta/x)
     &      +2*x*(Ctq6Pdf(-1,x,Qpdf)+Ctq6Pdf(-4,x,Qpdf))
     &      *(1-y)*(1-y-delta/x)
        elseif (target.eq.'p'.and.rnut.eq.2) then ! nubar-p
          struct=  ! (u+c)*(1-y)**2 + (dbar-sbar-bbar)
     &      2*x*(Ctq6Pdf(1,x,Qpdf)+Ctq6Pdf(4,x,Qpdf))
     &      *(1-y)*(1-y-delta/x)
     &     +2*x*(Ctq6Pdf(-2,x,Qpdf)+Ctq6Pdf(-3,x,Qpdf)
     &       +Ctq6Pdf(-5,x,Qpdf))*(1.0d0-delta/x)
        elseif (target.eq.'n'.and.rnut.eq.1) then  ! nu-n
          struct=   ! (u+s+b) + (dbar+cbar)*(1-y)^2
     &      2*x*(Ctq6Pdf(1,x,Qpdf)+Ctq6Pdf(3,x,Qpdf)+Ctq6Pdf(5,x,Qpdf))
     &      *(1.0d0-delta/x)
     &     +2*x*(Ctq6Pdf(-2,x,Qpdf)+Ctq6Pdf(-4,x,Qpdf))
     &     *(1-y)*(1-y-delta/x)
        elseif (target.eq.'n'.and.rnut.eq.2) then ! nubar-n
          struct=  ! (u+c)*(1-y)**2 + (dbar-sbar-bbar)
     &      2*x*(Ctq6Pdf(2,x,Qpdf)+Ctq6Pdf(4,x,Qpdf))
     &      *(1-y)*(1-y-delta/x)
     &     +2*x*(Ctq6Pdf(-1,x,Qpdf)+Ctq6Pdf(-3,x,Qpdf)
     &       +Ctq6Pdf(-5,x,Qpdf))*(1.0d0-delta/x)
        elseif (target.eq.'N') then ! not tau mass corrected below
          F2=pdf(2,x,Qpdf)
          F3=pdf(1,x,Qpdf)+inu*pdf(3,x,Qpdf)
          struct=((1-(y-y**2/2.0d0))*F2+inu*(y-y**2/2.0d0)*F3)
        else
          write(*,*) 'Error in dsdxdy: wrong target and nutype'
          write(*,*) 'Interaction: ',interaction
          write(*,*) 'Target: ',target
          write(*,*) 'Nutype: ',nutype
          stop
        endif

c...Neutral current        
      else
c...check kinematical limit
        mlepton=0.d0
c          s=Mn**2+2.0d0*Mn*Enu
        delta=mlepton**2/(2.0d0*Mn*Enu)  ! 0 for NC
c...Check kinematical limits
c...Condition (7) from Levy. hep-ph/0407371
        h=x*y+delta
        deltan=Mn**2/(2.0d0*Mn*Enu)
        if ((1.d0+x*deltan)*h**2-(x+delta)*h+x*delta.gt.0) then
          dsdxdy=0.0d0
          return
        endif

        Mprop=Mz
        if (target.eq.'p'.and.rnut.eq.1) then   ! nu-p
          struct=(Ctq6Pdf(1,x,Qpdf)+Ctq6pdf(4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu+gau)**2+(gvu-gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nu - uptype
          struct=struct+(Ctq6Pdf(2,x,Qpdf)+Ctq6pdf(3,x,Qpdf)
     &      +Ctq6Pdf(5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd+gad)**2+(gvd-gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nu - downtype
          struct=struct+(Ctq6Pdf(-1,x,Qpdf)+Ctq6Pdf(-4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu-gau)**2+(gvu+gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nu - uptype-bar
          struct=struct+(Ctq6Pdf(-2,x,Qpdf)+Ctq6Pdf(-3,x,Qpdf)
     &      +Ctq6Pdf(-5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd-gad)**2+(gvd+gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nu - downtype-bar
        elseif (target.eq.'p'.and.rnut.eq.2) then ! nubar - p
          struct=(Ctq6Pdf(-1,x,Qpdf)+Ctq6pdf(-4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu+gau)**2+(gvu-gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nubar - uptype-bar
          struct=struct+(Ctq6Pdf(-2,x,Qpdf)+Ctq6pdf(-3,x,Qpdf)
     &      +Ctq6Pdf(-5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd+gad)**2+(gvd-gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nubar - downtype-bar
          struct=struct+(Ctq6Pdf(1,x,Qpdf)+Ctq6Pdf(4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu-gau)**2+(gvu+gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nubar - uptype
          struct=struct+(Ctq6Pdf(2,x,Qpdf)+Ctq6Pdf(3,x,Qpdf)
     &      +Ctq6Pdf(5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd-gad)**2+(gvd+gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nubar - downtype
        elseif (target.eq.'n'.and.rnut.eq.1) then  ! nu - n
          struct=(Ctq6Pdf(2,x,Qpdf)+Ctq6pdf(4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu+gau)**2+(gvu-gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nu - uptype
          struct=struct+(Ctq6Pdf(1,x,Qpdf)+Ctq6pdf(3,x,Qpdf)
     &      +Ctq6Pdf(5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd+gad)**2+(gvd-gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nu - downtype
          struct=struct+(Ctq6Pdf(-2,x,Qpdf)+Ctq6Pdf(-4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu-gau)**2+(gvu+gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nu - uptype-bar
          struct=struct+(Ctq6Pdf(-1,x,Qpdf)+Ctq6Pdf(-3,x,Qpdf)
     &      +Ctq6Pdf(-5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd-gad)**2+(gvd+gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nu - downtype-bar
        elseif (target.eq.'n'.and.rnut.eq.2) then ! nubar - n
          struct=(Ctq6Pdf(-2,x,Qpdf)+Ctq6pdf(-4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu+gau)**2+(gvu-gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nubar - uptype-bar
          struct=struct+(Ctq6Pdf(-1,x,Qpdf)+Ctq6pdf(-3,x,Qpdf)
     &      +Ctq6Pdf(-5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd+gad)**2+(gvd-gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nubar - downtype-bar
          struct=struct+(Ctq6Pdf(2,x,Qpdf)+Ctq6Pdf(4,x,Qpdf))
     &      *0.5d0*x
     &      *((gvu-gau)**2+(gvu+gau)**2*(1-y)**2
     &         +Mn/Enu*(gau**2-gvu**2)*y*mncorr)  ! nubar - uptype
          struct=struct+(Ctq6Pdf(1,x,Qpdf)+Ctq6Pdf(3,x,Qpdf)
     &      +Ctq6Pdf(5,x,Qpdf))
     &      *0.5d0*x
     &      *((gvd-gad)**2+(gvd+gad)**2*(1-y)**2
     &         +Mn/Enu*(gad**2-gvd**2)*y*mncorr)  ! nubar - downtype
        elseif (target.eq.'N') then
          F2=pdf(2,x,Qpdf)*d1-pdf(3,x,Qpdf)*d2
          F3=pdf(1,x,Qpdf)*d3
          struct=((1-(y-y**2/2.0d0))*F2+inu*(y-y**2/2.0d0)*F3)
        else
          write(*,*) 'Error in dsdxdy: wrong target and nutype'
          write(*,*) 'Interaction: ',interaction
          write(*,*) 'Target: ',target
          write(*,*) 'Nutype: ',nutype
          stop
        endif

      endif

      dsdxdy=GF**2*Mn*Enu/pi*(Mprop**2/(Q2+Mprop**2))**2
      dsdxdy=dsdxdy*struct


c...Change units from  GeV^-2 to cm^2
      dsdxdy=dsdxdy*gev2cm2

c      write(*,*) 'x=',x,'  y=',y,'  dsdxdy=',dsdxdy

c      if (abs(y-0.1d0).lt.0.01d0) then
c        write(*,*) x,dsdxdy
c        if (dsdxdy.lt.1.d-42) then
c          write(*,*) 'Q=',Q,'  x=',x,'  y=',y
c          write(*,*) 'F2=',F2,'  F3=',F3          
c        endif
c      endif

      return
      end
