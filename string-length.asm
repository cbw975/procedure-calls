;;; ----------------------------------------------------------------------------------------
;;; Given a string to print (see data section), determine its length, write it to
;;; the console, and then exit.
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
	global  string_length
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
        section	.text	              ; The start of the code portion of the program.

;;; COMPLETE THE string_length FUNCTION.
string_length:
        ; RDI holds a pointer to the first character of the input string. 
        ; => So to traverse that string, need to increment the pointer
        ; if want to compare value *in* the REGISTER (the address of a character in memory), need to dereference: byte[REGISTER]        
        push    rdi             ; pointer to the string --> store register out onto stack
        mov     eax, 0          ; byte count stored as the address in eax
        dec     rdi             ; want to be before first char in string when counting
count_char:
        inc     eax             ; looped through a char => inc (byte count) the address in eax
        inc     rdi             ; traverse to next char in string by incrementing pointer to (char along the) string
        cmp     byte[rdi], 0    ; compare the byte that rdi points to (char) at this address to 0 (end of string delimiter)
        jne     count_char      ; IF not end of string, jump to continue counting characters along the string
        dec     eax             ; ELSE finish counting
        pop     rdi
        ret

;;; ----------------------------------------------------------------------------------------
