***********************************************************************
*** Nudsdxdy is a wrapper file for dsdxdy that sets common block
*** variables and calls dsdxdy
***
*** Input:  E      Neutrino energy
***         x      Bjorken-x
***         y      Bjorken-y
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
*** Output: Differential cross section in cm^2
***********************************************************************

      real*8 function Nudsdxdy(E,xx,yy,nu,targ,int)
      implicit none

      include 'nupar.h'

      real*8 y
      common /nu_int/y
      save /nu_int/

      real*8 E,xx,yy
      integer nu
      character*1 targ
      character*2 int

      real*8 dsdxdy

c...Transfer to common blocks
      Enu=E
      nutype=nu
      target=targ
      interaction=int
      y=yy

      Nudsdxdy=dsdxdy(xx)

      return
      end
