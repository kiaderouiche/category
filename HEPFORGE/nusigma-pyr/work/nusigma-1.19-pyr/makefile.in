NU_ROOT=$(PWD)/

.PHONY: libnusigma mains

all: config libnusigma mains

libnusigma: config
	cd src; make

mains:
	cd mains; make

config: clean
	perl $(NU_ROOT)scr/config.pl $(NU_ROOT)

create_tables:
	bin/nusigma
	bin/nusigmaxfind

clean:
	cd src; make clean
	cd mains; make clean

distclean: clean
	rm -f lib/*
