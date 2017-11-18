all:	AMBEserver

GCC := gcc

CFLAGS := -O2 -DRASPBERRY_PI -Wall
CFLAGS2 := -O2 -Wall 

AMBEserver:	AMBEserver.o
	$(GCC) $(LDFLAGS) -o AMBEserver AMBEserver.o 
	
AMBEserver.o:	AMBEserver.c
	$(GCC) $(CFLAGS2) -c AMBEserver.c

clean:
	$(RM) -f AMBEserver *~ *.bak *.o

install:
	install AMBEserver /usr/bin

init-install:
	install init.d/AMBEserver /etc/init.d
