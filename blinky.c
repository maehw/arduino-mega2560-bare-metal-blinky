/* 
 * File: blinky.c
 * Description: Toggels pin PB7 every second (which maps to Arduino pin 13, i.e. the on-board LED of the Arduino MEGA2560)
 */
 
#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRB |= (1<<DDB7);
    while (1) 
    {
        PORTB |= (1<<PORTB7);
        _delay_ms(1000);
        PORTB &= ~ (1<<PORTB7);
        _delay_ms(1000);
    }
}
