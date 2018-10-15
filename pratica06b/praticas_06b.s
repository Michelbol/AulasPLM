.section .data
abertura: .asciz "\n\nPrograma de Ordenacao de 4 Inteiros\n\n"
pergunta: .asciz "\n\nDeseja Executar de Novo? <S>IM ou <N>AO? "
pergunta_ord: .asciz "\n\nDeseja Ordernar <A>scendente ou <D>escendente"
ordem: .asciz "\n\nA ordenação foi %s"
tchau: .asciz "\n\ntchau tchau!\n\n"
pede_n1: .asciz "\nDigite n1 => "
pede_n2: .asciz "\nDigite n2 => "
pede_n3: .asciz "\nDigite n3 => "
pede_n4: .asciz "\nDigite n4 => "
mostra_orig: .asciz "\nOrdem Original: %d -> %d -> %d -> %d\n"
mostra_ord: .asciz "\nOrdem Alterada: %d -> %d -> %d -> %d\n"
n1: .int 0
n2: .int 0
n3: .int 0
n4: .int 0
resp: .int 0
ordenacao: .asciz
formato: .asciz "%d"
limpabuf: .string "%*c" # ou .asciz "%*c"
.section .text
.globl _start
_start:
volta:
pushl $abertura
call printf
pushl $pede_n1
call printf
pushl $n1
pushl $formato
call scanf
pushl $pede_n2
call printf
pushl $n2
pushl $formato
call scanf
pushl $pede_n3
call printf
pushl $n3
pushl $formato
call scanf
pushl $pede_n4
call printf
pushl $n4
pushl $formato
call scanf
pushl $pergunta_ord
call printf
pushl $ordenacao
call scanf
pushl $ordenacao
pushl $ordem
call printf
pushl n4
pushl n3
pushl n2
pushl n1
pushl $mostra_orig
call printf
addl $56, %esp
movl n1, %eax
movl n2, %ebx
movl n3, %ecx
movl n4, %edx
cmpl %eax, %ebx
jl troca1
continua1:
cmpl %ebx, %ecx
jl troca2
continua2:
cmpl %ecx, %edx
jl troca3
continua3:
cmpl %eax, %ebx
jl troca1
cmpl %ebx, %ecx
jl troca2
cmpl %ecx, %edx
jl troca3
jge fim
troca1:
xchgl %eax, %ebx
jmp continua1
troca2:
xchgl %ebx, %ecx
jmp continua2
troca3:
xchgl %ecx, %edx
jmp continua3
fim:
pushl %edx
pushl %ecx
pushl %ebx
pushl %eax
pushl $mostra_ord
call printf
pushl $pergunta
call printf
pushl $resp
pushl $limpabuf
call scanf
call getchar #retorna no %eax
addl $32, %esp
cmpl $'s', %eax
jz volta
cmpl $'S', %eax
jz volta
pushl $tchau
call printf
addl $4, %esp
pushl $0
call exit

