global _start

section .text
_start:
    mov ecx, 100
    mov ebx, 42
    mov eax, 1
    cmp ecx, 100 ; compare ecx to 100
    jg skip
    mov ebx, 13
skip:
    int 0x80