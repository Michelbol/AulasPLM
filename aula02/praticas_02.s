.section .data
#output: .ascii "O ID do fabricante eh 'xxxxxxxxxxxx'\n"
output: .ascii "O fabricante 'xxxxxxxxxxxx' foi identificado\n"
.section .text
.globl _start
_start:
movl $0, %eax
cpuid
movl $output,%edi
movl %ebx, 14(%edi) # posicao 23 da area apontada
movl %edx, 18(%edi) # posicao 27 da area apontada
movl %ecx, 22(%edi) # posicao 31 da area apontada
movl $4, %eax
movl $1, %ebx
movl $output, %ecx
movl $45, %edx
int $0x80
movl $1, %eax
movl $0, %ebx
int $0x80
