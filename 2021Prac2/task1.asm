; define a data section
section .data
	prompt db "Enter a 5 digit number: ", 0
	buffer_size equ 5
	prefix db "Number entered is: ", 0; string
	prefix_len equ $ - prefix
	newline db 0xA

; BSS for unit data
section .bss
	input_buffer resb buffer_size ; reserve space for input

; text section
section .text
	global _start

_start:
	;print prompt
	mov rax,1 ;write
	mov rdi, 1 ; stdout
	mov rsi, prompt; ADDRESS OF PROMPT
	mov rdx, 24 ; length of prompt
	syscall

	; read input
	mov rax, 0 ; read
	mov rdi, 0 ; stdin
	mov rsi, input_buffer ; address to store input
	mov rdx, buffer_size ; max num bytes
	syscall
	mov r12, rax ; sav number of bytes read

	; now contains bytes read
	; input string (input_buffer)
	; print prefix string
	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, prefix
	mov rdx, prefix_len
	syscall

	;Print the stored data
	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, input_buffer ; point to buffer
	mov rdx, r12 ; number of bytes as length
	syscall

	;print newline
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx,1
	syscall

	;exit program
	mov rax, 60 ; sys_exit
	xor rdi, rdi ; exit code 0
	syscall
