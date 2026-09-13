



; metrowerks sample code



	section		rtlib
	org p:
 	
	global Fasmadd

 Fasmadd:
 
	move  	Y1,X0
	add     Y0,X0
	move    X0,Y0
 	rts
 
 	endsec
 
	
; DSP56F801 DSP + GPIO Demonstration

    section     rtlib
    org p:

    global      Fdsp_mac

Fdsp_mac:

        ; ----------------------------------------------------
        ; Copy first argument:
        ;
        ; Y0 = sample
        ;
        ; Move it to X0 because we will use:
        ;
        ;       MAC Y1,X0,A
        ; ----------------------------------------------------

        move        Y0,X0


        ; ----------------------------------------------------
        ; Clear accumulator A.
        ;
        ; A = 0
        ; ----------------------------------------------------

        clr         A


        ; ----------------------------------------------------
        ; MAC:
        ;
        ;       A = A + X0 * Y1
        ;
        ; Therefore:
        ;
        ;       A = sample * coefficient
        ;
        ; ----------------------------------------------------

        MAC         Y1,X0,A


        ; ----------------------------------------------------
        ; Return a 16-bit C int.
        ;
        ; CodeWarrior expects a 16-bit non-address
        ; return value in Y0.
        ;
        ; The low 16 bits of A are A0.
        ; ----------------------------------------------------

        move        A0,Y0

        rts

        endsec