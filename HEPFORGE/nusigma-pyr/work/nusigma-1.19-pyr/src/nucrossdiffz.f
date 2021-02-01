***********************************************************************
*** NuCrossDiffz calculates the differential neutrino-nucleon cross 
*** section (differential in final state lepton energy (in units
*** of the incoming neutrino energy)). This routine does exactly the
*** same thing as NuCrossDiff but returns dsigma/dz instead of dsigma/dEf
*** where z=Ef/E
***
*** Input:  E      Neutrino energy
***         z      Final state lepton energy in units of E, i.e. z=Ef/E
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
***********************************************************************

      real*8 function NuCrossDiffz(E,z,nu,targ,int)
      implicit none

      include 'nupar.h'

      real*8 E,z
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

      if (z.gt.1.0d0) then 
        NuCrossDiffz=0.d0
c        write(*,*) 'Enu=',Enu,'  z=',z,'  y=',(1.0d0-z)
        return
      endif

      NuCrossDiffz=dsdy(1.0d0-z)

      return
      end
