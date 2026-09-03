.data
    a: .word 10                 # Variável global 'a' inicializada com 10
    b: .word 30                 # Variável global 'b' inicializada com 30
    v: .space 40                # Array 'v' de 10 words (4 bytes cada)

.text
.global _start
_start:
    # Carrega endereço do Array
    la t1, v                    # t1 = &v[0]
    # Carrega variáveis para registradores temporários (t2 a t5)
    lw t2, a                    # t2 = a (valor 10)
    lw t3, b                    # t3 = b (valor 30)
    li t4, 10                   # t4 = 10 (limite do loop)
    li t5, 0                    # t5 = i (valor 0)

loop:
    bge t5, t4, end_loop        # if i >= 10, sai do loop
    # Verifica se i é par ou ímpar
    andi t6, t5, 1              # t6 = i & 1 (testa bit menos significativo)
    beqz t6, even               # if t6 == 0 (i par), vai para 'even'

odd:                            # Caso ímpar (i % 2 != 0)
    slli t6, t5, 2              # t6 = i * 4 (offset no array)
    add t6, t1, t6              # t6 = &v[i]
    sw t2, 0(t6)                # v[i] = a
    j next

even:                           # Caso par (i % 2 == 0)
    slli t6, t5, 2              # t6 = i * 4
    add t6, t1, t6              # t6 = &v[i]
    sw t3, 0(t6)                # v[i] = b

next:
    addi t5, t5, 1              # i++
    j loop                      # repete o loop

end_loop:
    li a7, 10                   # syscall exit
    ecall                       # termina programa