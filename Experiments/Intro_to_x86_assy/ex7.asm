global _start

_start:
    call func 
    mov eax, 1
    mov ebx, 0
    int 128

func:
    push ebp
    mov ebp, esp
    mov ebp, esp
    sub esp, 3
    mov [esp], byte 'H'
    mov [esp+1], byte 'i'
    mov [esp+3], byte 10
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 3
    int 128
    mov esp, ebp
    pop ebp
    ret

