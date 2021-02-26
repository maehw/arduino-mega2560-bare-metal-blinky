# Usage

This little blinky example blinks the built-in LED (Arduino pin 13) connected to an Arduino MEGA2560 (which is based on an ATmega2560 MCU). It is not using the Arduino IDE and libraries, but the `gcc-avr` toolchain, `avr-libc` libraries, a pretty bare-metal C program and `avrdude` to flash it to the target.

* `make`: to compile and link `blinky.c`

* `make program`: to flash the program with `avrdude`

# Dependencies

* Installation of `gcc-avr`
* Installation of `avr-libc`
* Installation of `avrdude`

