;;; ----------------------------------------------------------------------------------------
;;; Given a string to print (see data section), determine its length, write it to
;;; the console, and then exit.
;;;
;;; To assemble and run:
;;;
;;;     $ nasm -felf64 -gdwarf neo-hello.asm
;;;     $ gcc -o neo-hello neo-hello.o
;;;     $ ./neo-hello
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
	global  main
	extern  string_length
;;; ----------------------------------------------------------------------------------------


	
;;; ----------------------------------------------------------------------------------------
        section	.text	              ; The start of the code portion of the program.
	
main:                                 ; Called by the C library stub code.
	;; CALL string_length () TO GET THE LENGTH OF THE MESSAGE TO PRINT.
	mov		rdi, greetings		; pointer to string (1st arg to string_length)
	sub		rsp, 8				; padding to the stack so rsp % 16 = 0
	call	string_length		; call string_length (also adds 8 byte address to return to stack)
	add		rsp, 8				; restore rsp

	;; Use the length provided to print the message.
	mov		rdx, rax			; rdx gets the number of bytes to write.
	mov     rax, 1				; rax gets the system call code for "write".
    mov     rdi, 1              ; rdi gets the file handle for stdout (console).
    mov     rsi, greetings      ; rsi gets the address of the string below.
    syscall	                    ; Call kernel, triggering the write.  The registers carry the arguments.

	ret		   	    ; End of main().  Stub code will exit the process.

;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
        section   .data		         ; The start of the data portion of the program.

greetings:			         ; Labels the string of bytes to be written.
	db        "Hello, World", 10, 0  ; The message, with the byte values for "newline"
                                      	 ; and the null terminator appended.
;;; ----------------------------------------------------------------------------------------
