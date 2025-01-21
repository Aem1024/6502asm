;$01 position one
;$10 direction (1 up 2 right 3 down 4 left)

START:
    LDA #01
    STA $200
    JMP LOOP

DIR:
    LDA $01
    STA $02

    LDA #$64
    CMP $FF
    BEQ RIGHT

    LDA #$73
    CMP $FF
    BEQ DOWN

    LDA #$77
    CMP $FF
    BEQ UP

    LDA #$61
    CMP $FF
    BEQ LEFT

    RTS 

UP: 
    LDA #$00
    STA $FF
   
    SEC
    LDA $01
    SBC #$20
    STA $01
    RTS

DOWN:
    LDA #$00
    STA $FF

    LDA #$1F
    ADC $01
    STA $01
    RTS

LEFT:
    LDA #$00
    STA $FF
  
    DEC $01
    RTS

RIGHT:
    LDA #$00
    STA $FF

    INC $01
    RTS
    
LOOP:
    JSR DIR
    JSR DRAW
    JMP LOOP

DRAW:
    LDX $02
    CPX $01
    BNE CLR

    LDX $01
    LDA #01
    STA $200,X
    RTS

CLR:
    LDX $02
    LDA #00
    STA $200,X
    RTS
