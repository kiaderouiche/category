***********************************************************************
*** nusig returns the cross section as obtained from fits to the full
*** results. Note that the tau mass has been neglected in these expressions,
*** hence the results here are flavour independent.
*** Also note that there is no reason to use these results other than
*** for testing purposes.
*** Author: Joakim Edsjo, edsjo@physto.se
***********************************************************************

      real*8 function nusig(Enu,nutype,target,interaction)
      implicit none

      real*8 enu
      character*2 interaction
      character*1 target
     
      integer nutype,nui,targi,inti

c...These are the parameters from neutrino-nucleon fits in the 10 GeV
c...to 10 TeV range. The cross sections are calculated with CTEQ6-DIS
c...parton distribution functions by Joakim Edsjo, edsjo@physto.se
c...Index 1: 1=nu, 2=nubar, 2: 1=p,2=n, 3: 1=CC, 2=NC
c...I.e. array is nu-p-CC, nubar-p-CC,nu-n-CC, nubar-n-CC,
c...              nu-p-NC, nubar-p-NC,nu-n-NC, nubar-n-NC
      real*8 a(2,2,2),b(2,2,2)
      common /nuspar/a,b
      save /nuspar/

      data a/5.43d-3,4.59d-3,1.23d-2,2.19d-3,
     &  2.48d-3,1.22d-3,2.83d-3,1.23d-3/
      data b/0.965d0,0.978d0,0.929d0,1.022d0,
     &  0.953d0,0.989d0,0.948d0,0.989d0/

      if (nutype.eq.1.or.nutype.eq.3.or.nutype.eq.5) then
        nui=1
      else
        nui=2
      endif

      if (target.eq.'p'.or.target.eq.'P') then
        targi=1
      else
        targi=2
      endif

      if (interaction.eq.'CC'.or.interaction.eq.'cc') then
        inti=1
      else
        inti=2
      endif

      nusig=a(nui,targi,inti)*Enu**b(nui,targi,inti)

      return
      end
