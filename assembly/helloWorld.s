section .text
global _start                   ; início do programa, usado pelo 

_start:
    mov eax,4                   ; seta system call # (4 = sys_write)
    mov ebx,1                   ; file desc (1 = stdout) // fd
    mov ecx,msg                 ; string // buf
    mov edx,len                 ; comprimento da string // count
    int 0x80                    ; chamada ao kernel
                                ; write(int fd, const void *buf, size_t count);
    mov eax,1                   ; seta system call # (1 = sys_exit)
    int 0x80                    ; chamada ao kernel

section .data                   ; variáveis globais inicializadas
msg db 'Hello, world!',0xa      ; define string, 'db' = variável de 8 bits
                                ; 0xa = 10 = newline em ASCII
len equ $ - msg                 ; define comprimento da string