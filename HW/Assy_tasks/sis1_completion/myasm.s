section .data                    	; data section, read-write
        an:    DD 0              	; this is a temporary var

section .text                    	; our code is always in the .text section
        global do_Str          	; makes the function appear in global scope
        extern printf            	; tell linker that printf is defined elsewhere 							; (not used in the program)

do_Str:                        	; functions are defined as labels
        push    ebp              	; save Base Pointer (bp) original value
        mov     ebp, esp         	; use base pointer to access stack contents
        pushad                   	; push all variables onto stack
        mov ecx, dword [ebp+8]	; get function argument

;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE STARTS HERE ;;;;;;;;;;;;;;;; 

	mov	dword [an], 0		; initialize answer
	checking_loop:
                
                ; .is_left_bracket
                cmp byte [ecx], '('
                je .change_left_bracket
                jg .is_right_bracket
                jmp .inc_an

                .change_left_bracket:
                inc dword [an]
                add dword [ecx], 20
                jmp .continue

                .is_right_bracket:
                cmp byte [ecx], ')'
                je .change_right_bracket
                jg .if_num
                jmp .inc_an

                .change_right_bracket:
                inc dword [an]
                add dword [ecx], 21
                jmp .continue

                .inc_an:
                inc dword [an]
                jmp .continue   

                .if_num:
                cmp byte [ecx], '0'
                jge .elseif_num
                jmp .inc_an

                .elseif_num:
                cmp byte [ecx], '9'
                jle .inc_an
                jmp .if_capital_letter 

                ; .nums_inc:
                ; inc dword [an]
                ; jmp .continue

                .if_capital_letter:
                cmp byte [ecx], 'A'
                jge .elseif_capital_letter
                jmp .inc_an

                .elseif_capital_letter:
                cmp byte [ecx], 'Z'
                jle .continue
                jmp .if_miniscule_letter

                .if_miniscule_letter:
                cmp byte [ecx], 'a'
                jge .elseif_miniscule_letter
                jmp .inc_an

                .elseif_miniscule_letter:
                cmp byte [ecx], 'z'
                jle .capitalize_letter
                jmp .if_other_symbol

                .capitalize_letter:
                sub dword [ecx], 32
                jmp .continue

                .if_other_symbol:
                cmp byte [ecx], 32
                jge .elseif_other_symbol
                jmp .continue
                
                .elseif_other_symbol:
                cmp byte [ecx], 126
                jle .inc_an
                jmp .continue

                .continue:
                        inc	ecx              		; increment pointer
                        cmp	byte [ecx], 0    		; check if byte pointed to is zero
                        jnz	checking_loop       		; keep looping until it is null terminated
                        dec     dword [an]


;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE ENDS HERE ;;;;;;;;;;;;;;;; 

         popad                    ; restore all previously used registers
         mov     eax, [an]         ; return an (returned values are in eax)
         mov     esp, ebp
         pop     ebp
         ret 
		 