Exercício de SO (UFAL)

Features

1. Limpar tela
2. Imprime "Meu bootloader" LI2C1
3. Imprime "Carregando kernel" LI4C30 (com INT 10h)
4. Carrega kernel (0x7E00)
5. Desvia para kernel
    - Limpa tela
    - Imprime "Meu SO" L2C1 
    - Loop

- Define função cls
- Define função set_pos
    - linha
    - coluna
- Define função print
    - ponteiro para string
