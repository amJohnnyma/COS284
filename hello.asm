section .data
	msg db "Hello world!", 0xA ; message with a new line
	len equ $ - msg ; message length

section .text 
	global _start

_start:
	mov rax, 1 ; write
	mov rdi, 1 ; file descriptor
	mov rsi, msg ; msg to write
	mov rdx, len ; msg length
	syscall

	mov rax, 60 ; exit
	xor rdi, rdi ; exit code 0
	syscall
	
