
extern printf

section .data
    input_buffer db 256 dup(0)
    a dd 0
    b dd 0
    op db 0
    sum     dd 0
    fmt_a     db "a= %d", 10, 0
    fmt_b     db "b= %d", 10, 0
    fmt_op     db "op= %c", 10, 0
    parsemode db 0 ; 0 = a, 1 = b

section .bss
    input_length resb 1

section .text
    global main

main:
    ; Read input from stdin (file descriptor 0) into input_buffer
    mov eax, 0                ; sys_read
    mov edi, 0                ; stdin (fd 0)
    mov rsi, input_buffer     ; buffer address
    mov edx, 255              ; max bytes
    syscall

    ; eax now contains number of bytes read
    mov [input_length], al    ; store length

    ; Null-terminate the string
    movzx rcx, byte [input_length]
    mov byte [input_buffer + rcx], 0

    xor rcx, rcx ; i = 0
readstring:
    mov al, byte [input_buffer + rcx] ; al = buffer[i]
    ; check condition
    cmp al, 0 ;lower bound
    je end
    cmp al, 10
    je end

    ; check if digit
    cmp al, '0'
    jl handle_operator
    cmp al, '9'
    jg handle_operator
    cmp al, ' '
    je parse_continue

    ; parse digit
    mov bl, [parsemode]
    cmp bl, 0
    je parse_a
    jne parse_b

handle_operator:
    mov [op], al
    mov byte [parsemode], 1
    jmp parse_continue

parse_a:
    sub al, '0'
    movzx eax, al
    mov ebx, [a]
    imul ebx, ebx, 10
    add ebx, eax
    mov [a], ebx
    jmp parse_continue

parse_b:
    sub al, '0' ;;ascii to number
    movzx eax, al 
    mov ebx, [b] ; current val
    imul ebx, ebx, 10 ; multiply by 10
    add ebx, eax ; add digit
    mov [b], ebx ; store back to memory
    jmp parse_continue

    

; continue loop
parse_continue:
    ; increment
    inc rcx
    jmp readstring
    
    
        
end:

    ;print a
    mov rdi, fmt_a
    mov esi, [a]
    xor rax, rax
    call printf

    ;print op
    mov rdi, fmt_op
    movzx esi, byte [op]
    xor rax, rax
    call printf

    ;print b
    mov rdi, fmt_b
    mov esi, [b]
    xor rax, rax
    call printf


    ; Exit
    xor edi, edi
    mov eax, 60               ; sys_exit
    syscall

