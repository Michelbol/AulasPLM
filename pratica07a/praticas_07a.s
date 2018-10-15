.section .data
titulo: .asciz "\n*** Programa Trata N Números Inteiros ***\n\n"
pedeN: .asciz "\nDigite o Numero de Elementos (N) => "
formato: .asciz "%d"
pedenum: .asciz "\nEntre com o elemento %d => "
mostra1: .asciz "\nElementos Lidos:"
mostra2: .asciz " %d"
mostra3: .asciz "\nSomatoria = %d MediaInt = %d Maior = %d Menor = %d\n"
maiornum: .int 0
menornum: .int 0
N: .int 0
num: .int 0
soma: .int 0
.section .text
.globl _start
_start:
pushl $titulo
call printf
leN:
pushl $pedeN
call printf
pushl $N
pushl $formato
call scanf
addl $12, %esp
movl N, %ecx
cmpl $0, %ecx
jle fim
lenum1:
movl $1, %ebx
subl $1, %ecx
pushl %ecx
pushl %ebx
pushl $pedenum
call printf
pushl $num
pushl $formato
call scanf
addl $12, %esp
movl num, %eax
movl %eax, soma
movl %eax, maiornum
movl %eax, menornum
popl %ebx
popl %ecx
cmpl $0, %ecx
jle mostratudo
leoutros:
incl %ebx
pushl %ecx
pushl %ebx
pushl $pedenum
call printf
pushl $num
pushl $formato
call scanf
addl $12, %esp
popl %ebx
popl %ecx
movl num, %eax
addl %eax, soma
cmpl maiornum, %eax
jg mudamaior
cmpl menornum, %eax
JL mudamenor
loop leoutros
jmp mostratudo
mudamaior:
movl %eax, maiornum
loop leoutros
jmp mostratudo
mudamenor:
movl %eax, menornum
loop leoutros
mostratudo:
movl menornum, %eax
pushl %eax
movl maiornum, %eax
pushl %eax
 movl soma, %eax
movl $0, %edx # evita estouro no %eax quando executando divl
movl N, %ebx
divl %ebx # experimente “divl N”, também funciona.
pushl %eax
 movl soma, %eax
 pushl %eax
pushl $mostra3
call printf
addl $20, %esp
fim:
pushl $0
call exit
