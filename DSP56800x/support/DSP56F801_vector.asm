



; metrowerks sample code



	section rtlib
	org	p:
	
M56801_intRoutine:
    debug
    nop
	nop
	rti

M56801_intDef:
    debug
    nop
	nop
	rti
    endsec
    
	section interrupt_vectors_mirror
	org	p:
	
	jmp Finit_M56801_        ; RESET                    ($00)
	jmp M56801_intRoutine    ; COP Watchdog reset       ($02)
    endsec
	
	section interrupt_vectors
	org	p:

	jmp M56801_intRoutine    ; reserved                 ($04)
	jmp M56801_intRoutine    ; illegal instruction      ($06)
	jmp M56801_intRoutine    ; Software interrupt       ($08)
	jmp M56801_intRoutine    ; hardware stack overflow  ($0A)
	jmp M56801_intRoutine    ; OnCE Trap		  		($0C)
	jmp M56801_intRoutine    ; reserved                 ($0E)
	jmp M56801_intRoutine    ; external interrupt A     ($10)
	jmp M56801_intRoutine    ; external interrupt B     ($12)
	jmp M56801_intRoutine    ; reserved		            ($14)
	jmp M56801_intRoutine    ; boot flash interface     ($16)
	jmp M56801_intRoutine    ; program flash interface  ($18)
	jmp M56801_intRoutine    ; data flash interface     ($1A)
	jmp M56801_intRoutine    ; mscan transmitter ready  ($1C)
	jmp M56801_intRoutine    ; mscan receiver full      ($1E)
	jmp M56801_intRoutine    ; mscan error              ($20)
	jmp M56801_intRoutine    ; mscan wakeup             ($22)
	jmp M56801_intRoutine    ; program flash interface 2($24)
	jmp M56801_intRoutine    ; GPIO E                   ($26)
	jmp M56801_intRoutine    ; GPIO D                   ($28)
	jmp M56801_intRoutine    ; reserved                 ($2A)
	jmp M56801_intRoutine    ; GPIO B                   ($2C)
	jmp M56801_intRoutine    ; GPIO A                   ($2E)
	jmp M56801_intRoutine    ; SPI transmitted empty    ($30)
	jmp M56801_intRoutine    ; SPI receiver full/error  ($32)
	jmp M56801_intRoutine    ; Quad decoder #1 home sw  ($34)
	jmp M56801_intRoutine    ; Quad decoder #1 idx pulse($36)
	jmp M56801_intRoutine    ; Quad decoder #0 home sw  ($38)
	jmp M56801_intRoutine    ; Quad decoder #0 idx pulse($3A)
	jmp M56801_intRoutine    ; Timer D Channel 0        ($3C)
	jmp M56801_intRoutine    ; Timer D Channel 1        ($3E)
	jmp M56801_intRoutine    ; Timer D Channel 2        ($40)
	jmp M56801_intRoutine    ; Timer D Channel 3        ($42)
	jmp M56801_intRoutine    ; Timer C Channel 0        ($44)
	jmp M56801_intRoutine    ; Timer C Channel 1        ($46)
	jmp M56801_intRoutine    ; Timer C Channel 2        ($48)
	jmp M56801_intRoutine    ; Timer C Channel 3        ($4a)
	jmp M56801_intRoutine    ; Timer B Channel 0        ($4c)
	jmp M56801_intRoutine    ; Timer B Channel 1        ($4e)
	jmp M56801_intRoutine    ; Timer B Channel 2        ($50)
	jmp M56801_intRoutine    ; Timer B Channel 3        ($52)
	jmp M56801_intRoutine    ; Timer A Channel 0        ($54)
	jmp M56801_intRoutine    ; Timer A Channel 1        ($56)
	jmp M56801_intRoutine    ; Timer A Channel 2        ($58)
	jmp M56801_intRoutine    ; Timer A Channel 3        ($5a)
	jmp M56801_intRoutine    ; SCI #1 Transmit complete ($5c)
	jmp M56801_intRoutine    ; SCI #1 transmitter ready ($5e)
	jmp M56801_intRoutine    ; SCI #1 receiver error    ($60)
	jmp M56801_intRoutine    ; SCI #1 receiver full     ($62)
	jmp M56801_intRoutine    ; SCI #0 Transmit complete ($64)
	jmp M56801_intRoutine    ; SCI #0 transmitter ready ($66)
	jmp M56801_intRoutine    ; SCI #0 receiver error    ($68)
	jmp M56801_intRoutine    ; SCI #0 receiver full     ($6a)
	jmp M56801_intRoutine    ; ADC B Conversion complete($6c)
	jmp M56801_intRoutine    ; ADC A Conversion complete($6e)
	jmp M56801_intRoutine    ; ADC B zero crossing/error($70)
	jmp M56801_intRoutine    ; ADC A zero crossing/error($72)
	jmp M56801_intRoutine    ; Reload PWM B 		    ($74)
	jmp M56801_intRoutine    ; Reload PWM A 		    ($76)
	jmp M56801_intRoutine    ; PWM B Fault	 		    ($78)
	jmp M56801_intRoutine    ; PWM A Fault	 		    ($7a)
	jmp M56801_intRoutine    ; PLL loss of lock		    ($7c)
	jmp M56801_intRoutine    ; low voltage detector	    ($7e)

	endsec	



M56801_OMRSetting equ	$0103

	section		rtlib
	
	org	x:
    global FM56801_int_Addr
FM56801_int_Addr	dc	M56801_intDef  ; Address of the unhandled exception
 
M56801_argc equ	0
	global FM56801_argv
	global FM56801_arge
FM56801_argv:
FM56801_arge:	dc	0


	endsec
	end






