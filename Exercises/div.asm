; returns quotient and remainder
; signed and unsieged idiv, div
; both forms have divided stored in rdx:rax (or register equivalent)
; quotient in rax, remainder in rdx
extern printf

segment .data
a 	dq 	105
b 	dq 	100
sum 	dq	0
fmt db "sum = %d", 10, 0


segment .text
	global main

main:

	mov rax, [x] ; x is dividend, load into rax
	mov rdx, 0 ; 0 out rdx, rdx:rax == rax (higher order bit)
	idiv qword [y] ; divide rax by y
	mov [quot], rax ; store quotient
	mov [rem], rdx ; store remainder

	; print sum
	mov rdi, fmt
	mov rsi, [sum]
	xor rax, rax
	call printf

	xor rax, rax
	ret
