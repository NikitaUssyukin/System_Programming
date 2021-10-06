
%define	STK_UNIT	4

%macro	Iamalive	0
	push	Str1
	call	printf
	add	esp, STK_UNIT
%endmacro

%macro	my_printf	2
section	.rodata
%%Str2:	db	%2 , 10, 0
section	.text
	push	%1
	push	%%Str2
	call	printf
	add	esp, STK_UNIT*2
%endmacro

section .rodata
Str1:	db	'I am alive', 10, 0
num1:	dd	15

section .text
	align 16
	global my_func
	extern printf

my_func:
	pusha
	Iamalive

	my_printf	dword [num1], "The number is %ld"
	my_printf	dword [num1], "The number again is %ld"

	popa
	ret


