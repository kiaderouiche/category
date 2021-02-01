***********************************************************************
*** function pdf returns a set of linear combinations of pdfs used
*** in neutrino cross section calculations. What is returned is
*** x times the sum of pdfs.
*** Note: this routine assumes isoscalar target (i.e. mix between
*** protons and neutrons) and is only used for reference.
***********************************************************************
      real*8 function pdf(case,x,Q)

      include 'nupar.h'

      integer case,i
      real*8 x,Q,sum
      real*8 Ctq6Pdf

c...Isoscalar target
      if (case.eq.1) then  ! q-q~
        sum=0.0d0
        do i=1,5
          sum=sum+Ctq6Pdf(i,x,Q)-Ctq6Pdf(-i,x,Q)
        enddo
      elseif (case.eq.2) then ! q+q~
        sum=0.0d0
        do i=1,5
          sum=sum+Ctq6Pdf(i,x,Q)+Ctq6Pdf(-i,x,Q)
        enddo
      elseif (case.eq.3) then ! 2(s-c+b)
        sum=2.0d0*(Ctq6Pdf(3,x,Q)-Ctq6Pdf(4,x,Q)+Ctq6Pdf(5,x,Q))
      else
        write(*,*) 'ERROR in pdf: wronge case=',case
        stop
      endif


      pdf=x*sum

c      if (abs(pdf).lt.1.d-42.and.case.eq.2) then
c        write(*,*) 'pdf = ',pdf
c        write(*,*) 'case = ',case,'  x=',x,'  Q=',Q
c        write(*,*) 'Ctq6pdf(i,x,Q) = ',(ctq6pdf(i,x,q),i=1,5)
c        write(*,*) 'Ctq6pdf(-i,x,Q) = ',(ctq6pdf(-i,x,q),i=1,5)
c      endif

      return
      end
