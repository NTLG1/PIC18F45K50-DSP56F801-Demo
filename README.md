# Embedded Systems & DSP Firmware R&D | PIC18F45K50 & DSP56F801 Architecture Study

-   Bare-Metal PIC Firmware Development: Engineered bare-metal C firmware for PIC18F45K50 using XC8 compiler, configuring internal oscillators (16MHz/48MHz PLL), GPIO latches (LATB/TRISB), and configuration bits (#pragma config).
-   Custom Assembly DSP Acceleration: Wrote hand-optimized DSP56800 Assembly (dsp_mac) to execute single-cycle Q15 fractional multiplication and addition using the hardware MAC unit and 36-bit accumulators (A1/A0/A2), interfacing directly with C runtime calling conventions (Y0/Y1 registers).
-   Low-Level Memory & Register Architecture: Configured memory-mapped I/O registers using volatile C pointers (GPIOA_BASE at 0x0FB0) and analyzed Harvard architecture memory layouts across Program (P) and Data (X) Flash/RAM spaces.
-   Linker Map & Runtime Debugging: Performed low-level disassembly and linker map analysis (.map / .xMAP) to audit memory footprint, trace reset vectors, verify heap/stack placement, and validate runtime C-startup routines (xromxram copying and zeroBSS).
