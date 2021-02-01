FC=gfortran

FC_FLAGS= -O -ffixed-line-length-none -fopenmp

LIB=../lib
INC=../inc

NU_OBJ = Cteq6Pdf-2008.o dsdlxdly.o dsdly.o dsdxdy.o dsdy.o nuNevent.o \
  nucross.o nucrossdiff.o nucrossdiffl.o nucrossdiffz.o nudsdlxdly.o \
  nudsdlxdlymax.o nudsdlxdy.o nudsdxdy.o nusetup.o nusig.o nusigint.o \
  pdf.o

COM_OBJ = $(INC)/nupar.h $(INC)/nuroot.f $(INC)/nuver.f $(INC)/nuver.h


vpath %.a $(LIB)

lib libnusigma libnusigma.a : $(COM_OBJ) makefile $(NU_OBJ) 
	ar rv $(LIB)/libnusigma.a $(NU_OBJ)
	ranlib $(LIB)/libnusigma.a


# -a ANSI only;  -u implicit none;  -U uppercase!=lowercase;
# -w66 no fortran66;  +es >72 cols or 99 cont.lines;

.f.o : 
	$(FC) -c $(FC_FLAGS) -o $*.o $*.f -I$(INC)

.F.o : 
	$(FC) -c $(FC_FLAGS) -o $*.o $*.F -I$(INC)

clean : 
	rm -f *.o *~
