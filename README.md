Exercício de SO (UFAL)

Features

1. Limpar tela
2. Imprimir "Meu bootloader" LI2C1
            "Carregando kernel" LI4C30 (com INT 10h)

3. Carrega kernel (0x7E00)
4. Desvia para kernel
    4.1 Limpa tela
    4.2 Imprime "Meu SO" L2C1 
    4.3 Loop

- Define função cls
- Define função set_pos
    - linha
    - coluna
- Define função print
    - ponteiro para string
