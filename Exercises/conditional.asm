
extern printf

segment .data
fmt db "sum = %d", 10, 0


segment .text
	global main

main:
	; compute absolute val of rax
	mov rbx, rax ; save original value
	neg rax ; negate rax
	cmovl rax, rbx ; replace rax if negative

	; load num from memory, subtract 100, replace dif with 0 if dif < 0
	; basically ->
	; rax = MAX(0, [x] - 100 )
	mov rbx, 0 ; rbx = 0
	mov rax, [x] ; get x from memory
	sub rax, 100 ; subtract 100 from x
	cmovl rax, rbx ; set rax to rbx(0) if rax is < 0

	xor rax, rax
	ret
