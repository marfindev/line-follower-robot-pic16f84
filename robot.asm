;--------------------------------------------------------------------------------------------
; Line Follower Robot Program
;--------------------------------------------------------------------------------------------
processor 16f84      ; Microcontroller used
status equ 0x03
rp0    equ 0x05
porta  equ 0x05
trisa  equ 0x85
portb  equ 0x06
trisb  equ 0x06
PDel0  equ 0x0c      ; Initial RAM address
PDel1  equ 0x0d
PDel2  equ 0x0e
PDel3  equ 0x0f
PDel4  equ 0x10
Ulang  equ 0x11
PDel5  equ 0x12
PDel6  equ 0x13
PDel7  equ 0x14
PDel8  equ 0x15

org 0x00             ; Start address of the program

Init
bsf status,rp0       ; Go to page 1
clrf trisb           ; PortB as output. RB0=servo1, RB1=servo2
movlw b'00000001'    ; RA0 as input
movwf trisa
bcf status,rp0       ; Return to page 0

;-------------------------------------------------------------------------------------------
; Main Program
;-------------------------------------------------------------------------------------------
Cek_sensor
btfss porta,0        ; Check if sensor is 
                     ; active (high = black line)
goto Belok           ; No, then turn left

Jalan
bsf portb,0          ; Activate servo1 to move straight
call Delay2ms
bcf portb,0
call Delay18ms
bsf portb,1          ; Activate servo2 to move straight
call Delay1ms
bcf portb,1
call Delay18ms
goto Cek_sensor

Belok
bcf portb,0          ; Turn off servo1, to make a turn
bsf portb,1          ; Activate servo2
call Delay1ms
bcf portb,1
call Delay18ms
goto Cek_sensor

;-----------------------------------------------------------------------
Delay1ms             ; Delay 1ms subroutine
;-----------------------------------------------------------------------
movlw     .248       ; 1 set number of repetitions
movwf     PDel0      ; 1 |
PLoop0   clrwdt      ; 1 clear watchdog
decfsz    PDel0, 1   ; 1 + (1) is the time over?
goto      PLoop0     ; 2 no, loop
PDelL1   goto PDelL2 ; 2 cycles delay
PDelL2   clrwdt      ; 1 cycle delay
return               ; 2+2 Done

;--------------------------------------------------------------------
Delay2ms             ; Delay 2ms subroutine
;--------------------------------------------------------------------
movlw     .249       ; 1 set number of repetitions
movwf     PDel4      ; 1 |
PLoopy0   clrwdt     ; 1 clear watchdog
PDelLLLL1 goto PDelLLLL2  ; 2 cycles delay
PDelLLLL2 goto PDelLLLL3  ; 2 cycles delay
PDelLLLL3
decfsz    PDel4, 1   ; 1 + (1) is the time over?
goto      PLoopy0    ; 2 no, loop
PDelLLLL4 goto PDelLLLL5  ; 2 cycles delay
PDelLLLL5 clrwdt     ; 1 cycle delay
return               ; 2+2 Done

;------------------------------------------------------------------------------
Delay18ms            ; Delay 18ms subroutine
;------------------------------------------------------------------------------
movlw     .26        ; 1 set number of repetitions (B)
movwf     PDel1      ; 1 |
PLoop1   movlw .172  ; 1 set number of repetitions (A)
movwf     PDel2      ; 1 |
PLoop2   clrwdt      ; 1 clear watchdog
decfsz    PDel2, 1   ; 1 + (1) is the time over? (A)
goto      PLoop2     ; 2 no, loop
decfsz    PDel1, 1   ; 1 + (1) is the time over? (B)
goto      PLoop1     ; 2 no, loop
PDelLLx1 goto PDelLLx2     ; 2 cycles delay
PDelLLx2 clrwdt      ; 1 cycle delay
return               ; 2+2 Done
;------------------------------------------------------------------------------

end                  ; End of program
