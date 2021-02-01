      Subroutine readf65
*
*      Example of a COMIS subroutine to create a Ntuple interactively.
*      Data is read from a standard binary result file
*      as defined in ../iolib.
*
*   Joakim Edsjo, edsjo@physto.se
*
* Create the ntuple by executing call mknt.f from PAW
*
      integer flag

      real x,y,ds
      common/sigma/x,y,ds

*
      lout=42
      id=1
c      include 'resopen.f'

*** Open hbook file ***
      call hropen(lout,'DS','./dsdxdy.hbook',
     &  'N',4096,istat)

*** Make sure we can handle big files
      call rzquot(200000)

*** Define blocks etc ***
      call hbnt(id,'DS',' ')
      call hbname(id,'sigma',x,'x:r*4,y:r*4,ds:r*4')

      open(unit=65,file='fort.65',form='formatted',
     &  status='old')

 10   continue
      read(65,*,end=1000) x,y,ds
      if (flag.eq.1) goto 1000 

      call hfnt(id)
      go to 10
*
 1000 call hrout(id,icycle,' ')
      call hrend('DS')

      close(65)
      close(lout)

      end

