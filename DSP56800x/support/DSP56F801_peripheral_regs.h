



/*  metrowerks sample code  */



// ----------------------------------------------------------
// Peripheral register definitions for M56801

#define IPR    		0xFFFB  	// Interrupt priority register

#define COP_BASE 	0x0F30   	// COP base address
#define COPCTL 		COP_BASE	// COP control regiser
#define COPTO 		COP_BASE+1	// COP timeout regiser
#define COPSRV 		COP_BASE+2	// COP service regiser

#define SPI_BASE	0x0F20		// SPI Base address
#define SPSCR		SPI_BASE	// SPI Status & Control register
#define SPDSR		SPI_BASE+1	// SPI data size register
#define SPDRR		SPI_BASE+2	// SPI data receive register
#define SPDTR		SPI_BASE+3	// SPI data transmit register



