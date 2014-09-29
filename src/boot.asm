[ORG 0x7c00]
   xor ax, ax
   mov ds, ax


   push bp
   mov bp,sp

   call cls
   push 0x01         ; coluna 1
   push 0x0c         ; linha 12
   call set_pos
   push msg          ; "meu bootloader"
   call print
   push 0x1e         ; coluna 30
   push 0x0e         ; linha 14
   call set_pos
   push msg2         ; "carregando kernel"
   call print

   call loadkernel
   jmp 0x000:0x7E00

cls:
    push bp
    mov bp,sp

    ;mov ax, 0x0700
    ;mov al, 0x0000
    ;mov bh, 0x07
    ;mov ch, 0x0000
    ;mov dx, 0x184F

    mov ah,0x07
    mov al,0x00
    mov bh,0x07
    mov cx,0x00
    mov dh,0x18
    mov dl,0x4F

    int 0x10

    leave   
    ;pop bp
    ret

set_pos:
    push bp
    mov bp,sp

    mov ah,0x02 ; http://www.ctyme.com/intr/rb-0087.htm
    mov bh,0x00 ; número da pagina (página 0)
    mov dh,[bp+4] ; linha
    mov dl,[bp+6] ; coluna

    int 0x10 ; interrupção

    leave
    ;pop bp
    ret

print:
    push bp
    mov bp,sp

    mov si, [ebp+4]
    jmp ch_loop
    ch_loop:lodsb
       or al, al
       jz done
       mov ah, 0x0E
       int 0x10
       jmp ch_loop

    done:
    leave
    ;pop bp
    ret

loadkernel:
    push bp
    mov bp,sp

    mov ah,0x02 ; leia setor na memória
    mov al,0x01 ; pega o estado da última operação
    mov ch,0x00
    mov cl,0x02
    mov dh,0x00
    mov dl,0x00     ; do floppy a
    mov bx,0x7E0    ; segmento de destinação
    mov es,bx
    mov bx, 0x0000

    int 0x13

    leave
    ;pop bp
    ret

msg    db 'Meu bootloader', 13, 10, 0
msg2   db 'Carregando kernel', 13, 10, 0
msg3   db 'Meu SO', 13, 10, 0

   times 510-($-$$) db 0
   db 0x55
   db 0xAA

   call cls
   push 0x01
   push 0x02
   call set_pos
   push msg3
   call print

hang:
   jmp hang

; break point
; xchg bx, bx
