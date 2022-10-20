
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  

jmp main

message: db 'Hello World',0 ;data bytes

print:              ;start of routine
    mov ah, 0eh     ;identifier of the function number we want to call inside the video routine
                    ; notice this register AH is working with AL and after calling 'int 10h
                    ;basically we are calling the BIOS video routine (10h) and passing AH + AL with
                    ; the data 'function being called' + 'data to display' -> '0eh' + 'H' ...

._loop:
    lodsb           ;load the contents of SI into AL, by moving one byte forward
    cmp al, 0       ;is AL equal to zero?
    je .done        ;if so, jump  to .done - nothing else to show on screen
    int 10h         ;interact: call bios subroutine (10h) to print to screen (video routine)
    jmp ._loop      ;loop
.done:
    ret             ;return

main:
    mov si, message ;point the SI register to the begining of the label 'message'
    call print      ;call print routine

ret                 ;return

