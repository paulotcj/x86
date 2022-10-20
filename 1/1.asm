
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  

main:
    mov ah, 0eh
    mov al, 'A'
    int 10h

ret

