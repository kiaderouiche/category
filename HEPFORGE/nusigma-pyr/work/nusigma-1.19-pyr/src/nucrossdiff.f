***********************************************************************
*** NuCrossDiff calculates the differential neutrino-nucleon cross 
*** section (differential in final state lepton energy).
***
*** Input:  E      Neutrino energy (GeV)
***         Ef     Final state lepton energy (GeV)
***         nu     Neutrino type
***                1 = nu_e
***                2 = nu_e-bar
***                3 = nu_mu
***                4 = nu_mu-bar
***                5 = nu_tau
***                6 = nu_tau-bar
***         targ   Target ('p' for proton, 'n' for neutron, 
***                'N' for isoscalar)
***         int    Interaction type ('CC'=charged current, 
***                'NC'=neutral current)
*** Output: NuCrossDiff   Diff cross section in cm^2 GeV^-1
*** Modified 2007-09-04 to add tau mass suppression of nu_tau nucleon
*** charged current cross section.
*** Author: Joakim Edsjo, edsjo@physto.se
***********************************************************************

      real*8 function NuCrossDiff(E,Ef,nu,targ,int)
      implicit none

      include 'nupar.h'

      real*8 E,Ef
      integer nu
      character*1 targ
      character*2 int

      real*8 dsdy
      external dsdy

c...Transfer to common blocks
      Enu=E
      nutype=nu
      target=targ
      interaction=int

      if (Ef.gt.Enu) then 
        NuCrossDiff=0.d0
c        write(*,*) 'Enu=',E,'  Ef=',Ef,'  y=',(1.0d0-Ef/Enu)
        return
      endif

      NuCrossDiff=dsdy(1.0d0-Ef/Enu)/Enu

      return
      end
