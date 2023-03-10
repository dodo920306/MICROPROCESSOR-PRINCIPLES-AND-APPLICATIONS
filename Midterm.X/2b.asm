List p=18f4520
    #include<p18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
    org 0x00
    
LIST_INT macro n1, n2, n3, n4, n5, n6, n7
    LFSR 0, 0x400
    MOVLW n1
    MOVWF POSTINC0
    MOVLW n2
    MOVWF POSTINC0
    MOVLW n3
    MOVWF POSTINC0
    MOVLW n4
    MOVWF POSTINC0
    MOVLW n5
    MOVWF POSTINC0
    MOVLW n6
    MOVWF POSTINC0
    MOVLW n7
    MOVWF POSTINC0
endm
    
GOTO Initial
    
MOUNTAIN:
    MOVF POSTDEC0, W
    INCF 0x421
    CPFSLT INDF0
	GOTO MOUNTAIN
MOUNTAIN2:
    MOVF POSTINC1, W
    INCF 0x420
    CPFSLT INDF1
	GOTO MOUNTAIN2
    MOVF 0x20, W, 1
    ADDWF 0x21, W, 1
    SUBLW 0x07
    NEGF WREG
    MOVWF 0x30, 1
    MOVLW 0x01
    DECFSZ 0x430
	MOVLW 0xFF
    DCFSNZ 0x420
	MOVLW 0xFF
    DCFSNZ 0x421
	MOVLW 0xFF
    MOVWF 0x10, 1
    RETURN
    
    
Initial:
    LIST_INT 0xFF, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00
    MOVF POSTDEC0, F
    LFSR 1, 0x400
    MOVLB 0x04
    RCALL MOUNTAIN
end

