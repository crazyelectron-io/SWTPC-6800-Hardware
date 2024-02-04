        NAM     INTCLK
* CLOCK PROGRAM FOR MP-T INTERRUPT TIMER
* DISPLAYS TIME IN 12 HOUR FORMAT 12:24.56
*
* MEMORY ADDRESS $A002 AND $A003 HOLD ADDRESS
* OF THE MP-T PORT, DEFAULT IS #5 OR $8010
*
* ADDRESS $A000 AND $A001 MUST BE LOADED WITH
* INTERUPT SREVICE ROUTINE WHICH IS $013D
*       
        ORG     $0100
        SEI
        LDS     #$A042 
        LDX     #$0020
        JSR     PDATA1
        LDX     #$0060
        JSR     PDATA1
        LDX     #$0061
        LDA     A #$0D
        JSR     OUTEEE
LOOP1   JSR     INEEE
        STA     A 0,X
        CPX     #$0068
        BEQ     CONFIG
        INX
        BRA     LOOP1
CONFIG  LDX     $A002
        LDA     A #$FF
        STA     A 2,X
        LDA     A #$3D
        STA     A 3,X
        LDA     A #$80
        STA     A 2,X
        LDA     A #$06
        STA     A 2,X
        NOP
        CLI
LOOP2   NOP
        BRA     LOOP2

INTSER  LDX     $A002
        LDA     A 2,X
        LDX     #$0060
        LDA     A #$39
        LDA     B #$30
        CMP     A 8,X
        BEQ     SKIP2
        INC     8,X
        BRA     DISPLY
SKIP2   STA     B 8,X
        LDA     A #$35
        CMP     A 7,X
        BEQ     SKIP3
        INC     7,X
        BRA     DISPLY
SKIP3   STA     B 7,X
        LDA     A #$39
        CMP     A 5,X
        BEQ     SKIP4
        INC     5,X
        BRA     DISPLY
SKIP4   STA     B 5,X
        LDA     A #$35
        CMP     A 4,X
        BEQ     SKIP5
        INC     4,X
        BRA     DISPLY
SKIP5   STA     B 4,X
        LDA     A #$32
        LDA     B #$39
        CMP     A 2,X
        BEQ     SKIP6
        CMP     B 2,X
        BEQ     SKIP8
        INC     2,X
        BRA     DISPLY
SKIP6   LDA     A #$31
        CMP     A 1,X
        BEQ     SKIP7
        INC     2,X
        BRA     DISPLY
SKIP7   STA     A 2,X
        LDA     B #$20
        STA     B 1,X
        BRA     DISPLY
SKIP8   LDA     A #$30
        LDA     B #$31
        STA     A 2,X
        STA     B 1,X
DISPLY  LDX     #$0060
        JSR     PDATA1 
        RTI

        ORG     $0020
        FCB     $10,$16,$0D,$00,$00,$00
        FCC     /SWTPC 6800 COMPUTER SYSTEM TIME:/
        FCB     $0D,$0A,$00,$00,$00,$04

        ORG     $0060
        FCB     $0D
        FCC     /HH:MM.SS /
        FCB     $04
       
        ORG     $A048
        FDB     $0100

        ORG     $A000
        FDB     $8010
       
        ORG     $A002
        FDB     $013D

INEEE   EQU     $E1AC
PDATA1  EQU     $E07E
OUTEEE  EQU     $E1D1

       §END
