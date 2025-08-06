; a=151,b=310,sum=0
; a=a+9
; sum = a + b + 10

extern printf

segment .data
a	dq	151
b	dq 	310
sum 	dq	0
fmt db "sum = %d", 10, 0


segment .text
	global main

main:

	mov rax, 9 ; set rax to 9
	add [a], rax ; add rax to a
	mov rax, [b] ; move b to rax
	add rax, 10 ; add 10 to rax
	add rax, [a] ; add contents of a
	mov [sum], rax ; save sum in sum


	; print sum
	mov rdi, fmt
	mov rsi, [sum]
	xor rax, rax
	call printf

	xor rax, rax
	ret

		


