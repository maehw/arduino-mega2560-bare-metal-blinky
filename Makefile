TARGET=blinky
MCU=atmega2560
SOURCES=blinky.c

CC=/usr/bin/avr-gcc
CFLAGS=-c -Os

PROGRAMMER=wiring
PORT=-P/dev/ttyACM0
BAUD=-b115200

OBJECTS=$(SOURCES:.c=.o)
LDFLAGS=

all: hex

hex: $(TARGET).hex

$(TARGET).hex: $(TARGET).elf
	avr-objcopy -O ihex -j .data -j .text $(TARGET).elf $(TARGET).hex

$(TARGET).elf: $(OBJECTS)
	avr-gcc $(LDFLAGS) -mmcu=$(MCU) $(OBJECTS) -o $(TARGET).elf

.c.o:
	$(CC) $(CFLAGS) -mmcu=$(MCU) $< -o $@

program:
	avrdude -v -p$(MCU) $(PORT) $(BAUD) -c$(PROGRAMMER) -D -Uflash:w:$(TARGET).hex:i

clean_tmp:
	rm -rf *.o
	rm -rf *.elf

clean:
	rm -rf *.o
	rm -rf *.elf
	rm -rf *.hex
