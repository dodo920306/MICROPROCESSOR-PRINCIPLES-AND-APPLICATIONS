List p=18f4520
#include<p18f4520.inc>
    CONFIG OSC = INTIO67
    CONFIG WDT = OFF
org 0x00
    
Initalization:
    MOVLW 0x10
    MOVWF 0x00
    MOVLW 0x11
    MOVWF 0x01
    MOVLW 0x12
    MOVWF 0x02
    MOVLW 0xFF
    MOVWF 0x03
    MOVLW 0x20
    MOVWF 0x10
    MOVLW 0x21
    MOVWF 0x11
    MOVLW 0x22
    MOVWF 0x12
    MOVLW 0xFF
    MOVWF 0x13
    CLRF 0x20
    CLRF 0x21
    CLRF 0x22
    CLRF 0x23
    LFSR 0, 0x003
    LFSR 1, 0x013
    LFSR 2, 0x023
    MOVLW 0x04
    MOVWF 0x30
Start:
    CLRF WREG
    BTFSC STATUS, C
	MOVLW 0x01
    ADDWF POSTDEC0, W
    ADDWF POSTDEC1, W
    MOVWF POSTDEC2
    DECFSZ 0x30
	GOTO Start
end
	

