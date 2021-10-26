global _start
section .data
    addr db "yellow duck!!!!!", 10 ; 10 is equal to 0x0a (which is 10 in hex)
    len equ $ - addr
section .text
_start:
    mov [addr], byte 'H'   ; moving symbol H to the beginning of our string
    mov [addr+5], byte '!' ;
    mov eax, 4    ; sys_writy system call
    mov ebx, 1    ; stdout file descriptor
    mov ecx, addr ; bytes to write
    mov edx, len  ; number of bytes to write
    int 128       ; perform system call, 128 is equal to 0x80 (which is 80 in hex)
    mov eax, 1    ; sys_exit system call
    mov ebx, 0    ; exit status is 0
    int 128       ; perform system call, 128 is equal to 0x80 (which is 80 in hex)