.section .data
saida:
.asciz "Teste %d: Resultado = %X\n\n"
saida2:
.asciz "Teste %d: Quociente = %X e Resto = %X\n\n"
saida3:
.asciz "Teste %d: Resultado = %X:%X\n\n"
.section .text
.globl _start
_start:
movl $0x12340000, %eax
movl $0x00005678, %ebx
addl %ebx, %eax # %eax ← %eax + %ebx
pushl %eax
pushl $1
pushl $saida
call printf
movl $0x10000000, %eax
movl $0x00005678, %ebx
addw %bx, %ax # %ax ← %ax + %bx
pushl %eax
pushl $2
pushl $saida
call printf
movl $0x10000000, %eax
movl $0x00005678, %ebx
addb %bl, %al # %al ← %al + %bl
pushl %eax
pushl $3
pushl $saida
call printf
movl $0x10000000, %eax
movl $0x00005678, %ebx
addb %bh, %ah # %ah ← %ah + %bh
pushl %eax
pushl $4
pushl $saida
call printf
movl $0x12345678, %eax
movl $0x02045608, %ebx
subl %ebx, %eax # %eax ← %eax - %ebx
pushl %eax
pushl $5
pushl $saida
call printf
movl $0x12345678, %eax
movl $0x12345678, %ebx
subw %bx, %ax # %ax ← %ax - %bx
pushl %eax
pushl $6
pushl $saida
call printf
movl $0x12345678, %eax
movl $0x12345678, %ebx
subb %bl, %al # %al ← %al - %bl
pushl %eax
pushl $7
pushl $saida
call printf
movl $0x12345678, %eax
movl $0x12345678, %ebx
subb %bh, %ah # %ah ← %ah - %bh
pushl %eax
pushl $8
pushl $saida
call printf
movl $0x12345678, %eax
movl $0x12345678, %ebx
subb %bh, %ah # %ah ← %ah - %bh
pushl %eax
pushl $8
pushl $saida
call printf
movl $0xC, %eax
incl %eax # %eax ← %eax + 1
incw %ax # %ax ← %ax + 1
incb %al # %al ← %al + 1
pushl %eax
pushl $9
pushl $saida
call printf
movl $0xF, %eax
decl %eax # %eax ← %eax - 1
decw %ax # %ax ← %ax - 1
decb %al # %al ← %al - 1
pushl %eax
pushl $10
pushl $saida
call printf
movl $0, %edx
movl $0x24682467, %eax
movl $2, %ebx
divl %ebx # %eax ← %edx:%eax / %ebx o resto fica em %edx
pushl %edx # salva na pilha para nao perder no printf
pushl %eax
pushl $11
pushl $saida
call printf
movl $0x00002468, %edx
movl $0x00001234, %eax
movl $0x24680, %ebx
divl %ebx # %eax ← %edx:%eax / %ebx o resto fica em %edx
pushl %edx # salva na pilha para nao perder no printf
pushl %edx
pushl $12
pushl $saida
call printf
movl $0, %eax
movl $0, %edx
movw $0x8817, %ax
movw $0x8800, %bx
divw %bx # %ax ← %dx:%ax / %bx, o resto fica em %dx
pushl %edx # salva na pilha para nao perder no printf
pushl %eax
pushl $13
pushl $saida
call printf
movl $0, %eax
movl $0x1, %edx
movw $0xFF17, %ax
movw $0xFF00, %bx
divw %bx # %ax ← %dx:%ax / %bx, o resto fica em %dx
pushl %edx # salva na pilha para nao perder no printf
pushl %eax
pushl $14
pushl $saida
call printf
movl $0, %eax
movl $0, %edx
movw $0x00F7, %ax
movb $0xF0, %bl
divb %bl # %al ← %ah:%al / %bl, o resto fica em %ah
movl %eax, %edx
sarw $8,%dx
pushl %edx
andw $0x00FF, %ax
pushl %eax
pushl $15
pushl $saida2
call printf
movl $0, %eax
movl $0, %edx
movw $0x01F7, %ax
movb $0xF0, %bl
divb %bl # %al ← %ax / %bl, o resto fica em %ah
movl %eax, %edx
sarw $8,%dx
pushl %edx
andw $0x00FF, %ax
pushl %eax
pushl $16
pushl $saida2
call printf
movl $0x12345678, %eax
movl $0x2, %ebx
mull %ebx # %edx:%eax ← %eax * %ebx
pushl %eax
pushl %edx
pushl $17
pushl $saida3
call printf
movl $0xFFFFFFFF, %eax
movl $0x2, %ebx
mull %ebx # %edx:%eax ← %eax * %ebx
pushl %eax
pushl %edx
pushl $18
pushl $saida3
call printf
movl $0, %edx # apenas para limpar antes
movl $0, %eax # apenas para limpar antes
movw $0x5678, %ax
movw $0x2, %bx
mulw %bx # %dx:%ax ← %ax * %bx
pushl %eax
pushl %edx
pushl $19
pushl $saida3
call printf
movl $0, %edx # apenas para limpar antes
movl $0, %eax # apenas para limpar antes
movw $0xFFFF, %ax
movw $0x2, %bx
mulw %bx # %dx:%ax ← %ax * %bx
pushl %eax
pushl %edx
pushl $20
pushl $saida3
call printf
movl $0, %edx # apenas para limpar antes
movl $0, %eax # apenas para limpar antes
movb $0x78, %al
movb $0x2, %bl
mulb %bl # %ah:%al ← %al * %bl
pushl %eax
pushl $21
pushl $saida
call printf
movl $0, %edx # apenas para limpar antes
movl $0, %eax # apenas para limpar antes
movb $0xFF, %al
movb $0x2, %bl
mulb %bl # %ah:%al ← %al * %bl
pushl %eax
pushl $22
pushl $saida
call printf
pushl $0
call exit
