***********************************************************************
*** NuCrossDiffl calculates the differential neutrino-nucleon cross 
*** section (differential in final state lepton energy). It does the
*** same thing as NuCrossDiff, but internally it uses cross sections
*** differential in ln(x) and ln(y) instead of x and y.
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
*** Author: Joakim Edsjo, edsjo@physto.se
***********************************************************************

      real*8 function NuCrossDiffl(E,Ef,nu,targ,int)
      implicit none

      include 'nupar.h'

      real*8 E,Ef
      integer nu
      character*1 targ
      character*2 int

      real*8 dsdly
      external dsdly

c...Transfer to common blocks
      Enu=E
      nutype=nu
      target=targ
      interaction=int

      if (Ef.ge.Enu) then 
        NuCrossDiffl=0.d0
c        write(*,*) 'Enu=',E,'  Ef=',Ef,'  y=',(1.0d0-Ef/Enu)
        return
      endif

c...The last factor (1.0d0-Ef/Enu) is the Jacobian y
      NuCrossDiffl=dsdly(log(1.0d0-Ef/Enu))/Enu/(1.0d0-Ef/enu)

      return
      end
