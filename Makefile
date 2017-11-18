all:	AMBEserver

GCC := gcc

CFLAGS := -O2 -DRASPBERRY_PI -Wall
CFLAGS2 := -O2 -Wall 

AMBEserver:	GitVersion.h AMBEserver.o
	$(GCC) $(LDFLAGS) -o AMBEserver AMBEserver.o 
	
AMBEserver.o:	AMBEserver.c
	$(GCC) $(CFLAGS2) -c AMBEserver.c

clean:
	$(RM) -f AMBEserver *~ *.bak *.o GitVersion.h

install:
	install AMBEserver /usr/bin

init-install:
	install init.d/AMBEserver /etc/init.d


GitVersion.h:
ifneq ("$(wildcard .git/index)","")
	echo "const char *gitversion = \"$(shell git rev-parse HEAD)\";" > $@
else
	echo "const char *gitversion = \"0000000000000000000000000000000000000000\";" > $@
endif
