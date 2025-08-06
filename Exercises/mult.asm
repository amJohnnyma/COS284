; use of mul (one operand, other op is rax for 64 bit (else eax 32 bit, ax 16 bit etc.))
; the result is stored in rdx:rax, edx:eax, dx:ax (higher order in first register)
; Most of the time it will be in rax, but rdx will get changed to 0's if fits in 64 bits
; byte * byte stored in ax

extern printf

segment .data
a 	dq 	105
b 	dq 	100
sum 	dq	0
fmt db "sum = %d", 10, 0


segment .text
	global main

main:


	mov rax, [a]
	mul qword [b] ; a * b will be in rdx:rax
	mov eax, [c]
	mul dword, [d] ; c * d will be in edx:eax

	; if multiplication larger than register then use mul to not lose data
	imul rax, 100 ; multiply rax by 100
	imul r8, [x] ; multiply r8 by x
	imul r9, r10 ; multiply r9 by r10
	imul r8, r9, 11 ; store r9 * 11 in r8 ; 3rd operand must be constant

	; print sum
	mov rdi, fmt
	mov rsi, [sum]
	xor rax, rax
	call printf

	xor rax, rax
	ret
