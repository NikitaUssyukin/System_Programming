        global printer
        extern resume

        ;; /usr/include/asm/unistd_32.h
sys_write:      equ   4
stdout:         equ   1


section .data

hello:  db 'hello', 10


section .text

printer:
        mov eax, sys_write
        mov ebx, stdout
        mov ecx, hello
        mov edx, 6
        int 80h

        xor ebx, ebx
        call resume             ; resume scheduler

        jmp printer