### Introduction

This is my take on AMBEServer, which has been edited to add support for the DVMega AMBE 3000 board or other AMBE boards that aren't in the correct mode on bootup due to their hardware configuration.

It works by sending a RESETSOFTCFG packet instead of RESET, overriding the hardware configuration of the AMBE chip.

Its intended to be used with [Analog_Bridge](https://github.com/N4IRS/Analog_Bridge) but may work with other processes that use AMBEServer.

All contributions and feedback are much appreciated, as I am *not* an experienced developer...

**This is a work in progress**

### Building AMBEServer

To build AMBESever, run-

```
make
make install
```

###Usage

```
AMBEserver [-d] [-r] [-s speed] [-p port] [-i tty] [-v] [-x]
```

-d Daemon Mode
-r Forces a hardware reset using a GPIO pin. Intended for a 'hat' on a Raspberry Pi
-s Baud rate (Defaults to 230400)
-p UDP port to listen on (Defaults to 2460)
-i tty of the AMBE Board (Defaults to dev/ttyUSB0)
-v Print version and exit
-x Debug mode

### Current Issues

There are currently a couple of issues that I hope to resolve-

* If the AMBE chip reboots, AMBEServer will need to be restarted.
* If the process interacting with AMBEServer sends a RESET packet, the AMBE chip will go into the incorrect mode and will stay there until AMBEServer is restarted. 

### Acknowledgments

Thanks to-
G4KLX / NH6Z / K7VE / DL5DI - AMBEServer  
N80HU - Makefile inspiration  

### License

This code is licensed under GPL 2.0 or later, as per the original code which can be found [here](https://github.com/dl5di/OpenDV)
