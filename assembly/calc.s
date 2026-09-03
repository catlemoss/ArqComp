.data

.text
.globl _start

_start:
    # Lê n1
    li a7, 5          # syscall read_int
    ecall
    mv t0, a0         # t0 = n1

read_op:
    # Lê o operador
    li a7, 12         # syscall read_char
    ecall
    mv t1, a0         # t1 = caractere lido

    # Ignora espaços e quebras de linha
    li t2, ' '
    beq t1, t2, read_op

    li t2, '\n'
    beq t1, t2, read_op

    li t2, '\t'
    beq t1, t2, read_op

    # Lê n2
    li a7, 5          # syscall read_int
    ecall
    mv t3, a0         # t3 = n2

    # Verifica operador '+'
    li t2, '+'
    beq t1, t2, soma

    # Verifica operador '-'
    li t2, '-'
    beq t1, t2, subtracao

    # Verifica operador '*'
    li t2, '*'
    beq t1, t2, multiplicacao

soma:
    add t4, t0, t3    # t4 = n1 + n2
    j imprime

subtracao:
    sub t4, t0, t3    # t4 = n1 - n2
    j imprime

multiplicacao:
    mul t4, t0, t3    # t4 = n1 * n2
    j imprime

imprime:
    mv a0, t4
    li a7, 1          # syscall print_int
    ecall

    # Encerra o programa
    li a7, 10         # syscall exit
    ecall
        