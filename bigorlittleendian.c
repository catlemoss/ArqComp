/*
Teste para saber se minha máquina é little-endian ou big-endian.
*/

#include <stdio.h>

int main()
{
    unsigned int x = 0x12345678;
    unsigned char *p = (unsigned char *)&x;
    // Você está olhando o mesmo valor x, mas byte por byte.

    printf("%02X\n", p[0]);

    // se imprimir 12, é big
    // se imprimir 78, é little

    return 0;
}