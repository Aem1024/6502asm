ADD: LDA $00 ;first byte in memory
     ADC #01 ;add one
     STA $00 ;store it
     JSR SUB ;jump to subroutine
     JMP ADD ;loop

SUB: LDA $01
     ADC #01
     STA $01
     RTS
