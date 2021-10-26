global _start

section .text
_start:
    mov ebx, 1
    mov ecx, 7    ; number of iterations, or degree of the 2 number
loopstart:
    add ebx, ebx  ; ebx += ebx
    dec ecx       ; ecx -= 1
    cmp ecx, 0
    jg loopstart
    mov eax, 1
    int 0x80
