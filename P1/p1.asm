extern printf

segment .data
	a: dd 1,2,3,4,5,6,7,8,9
	b: dw 10,11,12,13,14
	c: db 15,16,17,18
	d: dq 19,20,21,22,23
	out: dq 0
	fmt: db "sum = %d", 10, 0
	A: dd 320
	B: dd 164
	sum: dd 0
	Q: dd 0
	R: dd 0

segment .text 
	global main

main:
	mov rax, 0
; 1.1
;	lea rcx, [a]
;	mov rax, [rcx]
	
; 1.2
;	lea rcx, [d+16]
;	sub rcx, 36
;	mov rax, [rcx]
; 1.3
	lea rcx, [a]
	mov rdi, 4
	mov rax, [rcx + 8*rdi]
; 1.4
;	lea rcx, [a]
;	add rcx, 8
;	mov rax, [rcx + 44]
; 2.1
;	mov eax, [A]
;	add eax, [B]
;	mov [out], eax
; 2.2
;	xor rax, [B]
; 5.2
;	mov rbx, 0xaaaa
;	shl rbx, 12
;	not rbx
;	and rax, rbx
; 5.3
;	mov rbx, 0xbce
;	shl rbx, 12
;	neg rbx
;	and rax, rbx
; 6
	; rax = rbx >= 6 ? rdx : rcx
;	mov rbx, 0xfffffffffffffffb
;	mov rcx, 7
;	mov rdx, 12
;	cmp rbx, 6
;	cmovl rax, rcx
;	cmovge rax, rdx
; 7
;	mov al, 0xf0
;	neg al
;	mov al, 0xff
;	sub al, 0x0f


	mov [out], rax
;	syscall

	; print sum
	mov rdi, fmt
	mov rsi, [out]
	xor rax, rax
	call printf

	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite align=1
