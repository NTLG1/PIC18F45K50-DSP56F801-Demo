/*
 * File:   main.c
 * Author: Windows
 *
 * Created on August 4, 2026, 4:58 PM
 */


#include <xc.h>

// Example configuration bits
#pragma config WDTEN = OFF
#pragma config FOSC = INTOSCIO

#define _XTAL_FREQ 16000000UL // Set as Unsigned Long to prevent compiler math truncation

static void oscillator_init(void)
{
    // Force the internal oscillator to run at 16 MHz 
    OSCCONbits.IRCF = 7;
}

void main(void)
{
    oscillator_init();
    TRISBbits.TRISB0 = 0; // Make RB0 an output

    while (1)
    {
        LATBbits.LATB0 = 1;
        __delay_ms(500);

        LATBbits.LATB0 = 0;
        __delay_ms(500);
    }
}