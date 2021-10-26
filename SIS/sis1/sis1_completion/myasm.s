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
                
                ; Check if left bracket
                cmp byte [ecx], '('
                je .changeLeftBracket
                jg .isRightBracket
                jmp .ifOtherSymbol

                .changeLeftBracket:
                inc dword [an]
                mov dword [ecx], '<'
                jmp .continue

                .isRightBracket:
                cmp byte [ecx], ')'
                je .changeRightBracket
                jg .checkLetters
                jmp .ifOtherSymbol

                .changeRightBracket:
                inc dword [an]
                mov dword [ecx], '>'
                jmp .continue

                .incAn:
                inc dword [an]
                jmp .continue   

                .ifNum:
                cmp byte [ecx], '0'
                jge .NumIsGreater
                jmp .ifOtherSymbol

                .elseIfNum:
                cmp byte [ecx], '9'
                jle .incAn
                jmp .checkLetters 

                .NumbersInc:
                inc dword [an]
                jmp .continue

                .checkLetters:
                cmp byte [ecx], 'a'
                jge .letterIsGreater
                jmp .continue

                .letterIsGreater:
                cmp byte [ecx], 'z'
                jle .lettersInc
                jmp .continue

                .lettersInc:
                sub dword [ecx], 32
                jmp .continue

                .ifOtherSymbol
                cmp byte [ecx], 32
                jge .elseIfOtherSymbol
                jmp .continue
                
                .elseIfOtherSymbol
                cmp byte [ecx], 126
                jle .incAn

                .continue:
                inc	ecx              		; increment pointer
                        cmp	byte [ecx], 0    		; check if byte pointed to is zero
                        jnz	checking_loop       		; keep looping until it is null terminated

                ; Destroying Stack

		inc ecx      	    ; increment pointer
		cmp byte [ecx], 0   ; check if byte pointed to is zero
		jnz checking_loop   ; keep looping until it is null terminated


;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE ENDS HERE ;;;;;;;;;;;;;;;; 

         popad                    ; restore all previously used registers
         mov     eax,[an]         ; return an (returned values are in eax)
         mov     esp, ebp
         pop     ebp
         ret 
		 