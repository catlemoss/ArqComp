.data
    N:      .word 0
    R:      .word 0
    msg1:   .asciz  "Digite um numero inteiro: "
    msg2:   .asciz  "O fatorial de "
    msg3:   .asciz  " eh "

.text
    _start:
        li a7, 4    #funcao imprime string
        la a0, msg1
        ecall

        li a7, 5    #funcao le inteiro
        ecall       #inteiro eh retornado em a0

        la s0, N
        sw a0, 0(s0)
        jal fatorial
        la s1, R
        sw a0, 0(s1)
        li a7, 4
        la a0, msg2
        ecall

        li a7, 1
        lw a0, 0(s0)
        ecall

        li a7, 4
        la a0, msg3
        ecall

        li a7, 1
        lw a0, 0(s1)
        ecall

        li a7, 10
        ecall

    fatorial:
        addi sp, sp, -8
        sw a0, 4(sp)
        sw ra, 0(sp)

        bne a0, zero, continue
        
        li a0, 1
        j fim_fat

    continue:
        addi a0, a0, -1
        jal fatorial
        lw t0, 4(sp)
        mul a0, a0, t0

    fim_fat:
        lw ra, 0(sp)
        addi sp, sp, 8
        ret
