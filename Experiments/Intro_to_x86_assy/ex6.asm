global _start

_start:
    sub esp, 4
    mov [esp], byte 'H'
    mov [esp+1], byte 'e'
    mov [esp+2], byte 'y'
    mov [esp+3], byte '!'
    mov [esp+4], byte 10
    mov eax, 4   
    mov ebx, 1
    mov ecx, esp  ; pointer to bytes to write
    mov edx, 5    ; number of bytes to write
    int 128
    mov eax, 1
    mov ebx, 0
    int 128