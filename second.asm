START:
    LDA #01
    STA $20F
    JMP LOOP

LOOP:
    LDA #$73
    CMP $FF
    BEQ NEWPIX
    JMP LOOP

NEWPIX:
    LDA #$00
    STA $FF
    LDX $01
    LDA #00
    STA $20F,X
    TXA
    ADC #32
    STA $01
    TAX
    LDA #$01
    STA $20F,X
    RTS
