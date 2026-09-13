




/*  metrowerks sample code  */



#include "DSP56F801-802-803-805_pll.h"
#include "DSP56F801_peripheral_regs.h"




#define _32bit_compares 0x0100  // for OMR
#define M56801_argc 0           // main arg
#define mr15 $3F                // frame pointer



// defined in 56801_vector.asm
// extern char *M56801_intVec;     // interrupt table address originally loaded

extern char *M56801_int_Addr;   // exception handler address
extern int  *M56801_argv;       // main arg
extern int  *M56801_arge;       // main arg


// defined in user code
extern main();


// defined in runtime lib
extern fflush();


// defined in linker command files
extern char *_stack_addr;


// defined in rom copy utility
void __romCopy();


// defined in bss clear utility
void __bssClear();


//prototype
void init_M56801_();


