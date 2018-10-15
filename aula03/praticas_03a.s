.section .data
output: .ascii "O ID do fabricante eh 'xxxxxxxxxxxx'\n"
outrput2: .asciz "zzzzzzzzzzzzzzzzzzzzz\n"
.section .text
.globl _start
_start:
movl $0, %eax
cpuid
movl $output,%edi
movl %ebx, 23(%edi) # posição 23 da area apontada
movl %edx, 27(%edi) # posição 27 da area apontada
movl %ecx, 31(%edi) # posição 31 da area apontada
pushl $output
call printf
addl $4, %esp
pushl $0
call exit
