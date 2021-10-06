     1                                  
     2                                  %define	STK_UNIT	4
     3                                  
     4                                  %macro	Iamalive	0
     5                                  	push	Str1
     6                                  	call	printf
     7                                  	add	esp, STK_UNIT
     8                                  %endmacro
     9                                  
    10                                  %macro	my_printf	2
    11                                  section	.rodata
    12                                  %%Str2:	db	%2 , 10, 0
    13                                  section	.text
    14                                  	push	%1
    15                                  	push	%%Str2
    16                                  	call	printf
    17                                  	add	esp, STK_UNIT*2
    18                                  %endmacro
    19                                  
    20                                  section .rodata
    21 00000000 4920616D20616C6976-     Str1:	db	'I am alive', 10, 0
    22 00000009 650A00             
    23 0000000C 0F000000                num1:	dd	15
    24                                  
    25                                  section .text
    26                                  	align 16
    27                                  	global my_func
    28                                  	extern printf
    29                                  
    30                                  my_func:
    31 00000000 60                      	pusha
    32                                  	Iamalive
    33 00000001 68[00000000]        <1>  push Str1
    34 00000006 E8(00000000)        <1>  call printf
    35 0000000B 81C404000000        <1>  add esp, STK_UNIT
    36                                  
    37                                  	my_printf	dword [num1], "The number is %ld"
    38                              <1> section .rodata
    39 00000010 546865206E756D6265- <1> %%Str2: db %2 , 10, 0
    40 00000019 7220697320256C640A- <1>
    41 00000022 00                  <1>
    42                              <1> section .text
    43 00000011 FF35[0C000000]      <1>  push %1
    44 00000017 68[10000000]        <1>  push %%Str2
    45 0000001C E8(00000000)        <1>  call printf
    46 00000021 81C408000000        <1>  add esp, STK_UNIT*2
    47                                  	my_printf	dword [num1], "The number again is %ld"
    48                              <1> section .rodata
    49 00000023 546865206E756D6265- <1> %%Str2: db %2 , 10, 0
    50 0000002C 7220616761696E2069- <1>
    51 00000035 7320256C640A00      <1>
    52                              <1> section .text
    53 00000027 FF35[0C000000]      <1>  push %1
    54 0000002D 68[23000000]        <1>  push %%Str2
    55 00000032 E8(00000000)        <1>  call printf
    56 00000037 81C408000000        <1>  add esp, STK_UNIT*2
    57                                  
    58 0000003D 61                      	popa
    59 0000003E C3                      	ret
    60                                  
    61                                  
