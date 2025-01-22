;$01 position one
;$10 direction (1 up 2 right 3 down 4 left)

START:
    LDA #00
    STA $10
    LDA #$02
    STA $11
    LDA #01
    STA $200
    JMP LOOP

DIR:
    LDA $01
    STA $02
    LDA $10
    STA $03
    LDA $11
    STA $04   

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
   
    LDA $01
    SEC
    SBC #$20
    STA $01
    BCC UPUP
    RTS

UPUP:
    DEC $11
    RTS


DOWN:
    LDA #$00
    STA $FF
    
    LDA $10
    CLC
    ADC #$20

    STA $10
    BCS DOWNDOWN
    RTS

DOWNDOWN:
    INC $11
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
    CPX $1
    BNE CLR
    LDX $03
    CPX $10
    BNE CLR

    LDY $01
    LDA #01
    STA ($10), Y
    RTS

CLR:
    LDY $02
    LDA #00
    STA ($03), Y
    RTS
