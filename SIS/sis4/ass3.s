        global _start
        extern init_co, start_co, resume
        extern scheduler, printer


        ;; /usr/include/asm/unistd_32.h
sys_exit:       equ   1


section .data


section .text

_start:
        enter 0, 0

        xor ebx, ebx            ; scheduler is co-routine 0
        mov edx, scheduler
        mov ecx, [ebp + 4]      ; ecx = argc
        call init_co            ; initialize scheduler state

        inc ebx                 ; printer i co-routine 1
        mov edx, printer
        call init_co            ; initialize printer state


        xor ebx, ebx            ; starting co-routine = scheduler
        call start_co           ; start co-routines


        ;; exit
        mov eax, sys_exit
        xor ebx, ebx
        int 80h