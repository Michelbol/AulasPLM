.section .data
saida:
.asciz "Teste %d: O valor do registrador eh: %X\n\n"
saida2:
.asciz "Teste %d: Os valores dos regs sao: %X e %X\n\n"
saida3:
.asciz "Teste %d: EAX = %X ; EBX = ; %X ECX = %X ; EDX = %X ; ESI = %X ; EDI = %X\n\n"
.section .text
.globl _start
_start:
movl $0x12345678, %eax
pushl %eax
pushl $1
pushl $saida
call printf
movw $0x1234, %ax
pushw %ax
movw $0xABCD, %ax
pushw %ax
pushl $1
pushl $saida
call printf
movb $0xAA, %ah
movb $0xBB, %al
pushw %ax
movb $0xCC, %ah
movb $0xDD, %al
pushw %ax
pushl $1
pushl $saida
call printf
pushl $0
movl $0x12345678, %eax
roll $16, %eax
rolw $8, %ax
rolb $4, %al
pushl %eax
pushl $2
pushl $saida
call printf
movl $0x12345678, %eax
roll $8, %eax
rolw $4, %ax
rolb $4, %al
pushl %eax
pushl $2
pushl $saida
call printf
movl $0x12345678, %eax
 rorl $16, %eax
rorw $8, %ax
rorb $4, %al
pushl %eax
pushl $3
pushl $saida
call printf
movl $0x12345678, %eax
 rorl $8, %eax
rorw $4, %ax
rorb $4, %al
pushl %eax
pushl $3
pushl $saida
call printf
movl $0x12345678, %eax
 salb $4, %al
salw $8, %ax
sall $16, %eax
pushl %eax
pushl $4
pushl $saida
call printf

movl $0x12345678, %eax
salb $4, %al
salw $4, %ax
sall $8, %eax
pushl %eax
pushl $4
pushl $saida
call printf
movl $0x12345678, %eax
 sarl $16, %eax
sarw $8, %ax
sarb $4, %al
pushl %eax
pushl $5
pushl $saida
call printf

movl $0x12345678, %eax
 sarl $8, %eax
sarw $4, %ax
sarb $4, %al
pushl %eax
pushl $5
pushl $saida
call printf
call exit
