# CUDAImplementacao

# MULTIPLICAÇÃO DE MATRIZES COM CUDA - BENCHMARK E OTIMIZAÇÃO

Esse projeto implementa e analisa multiplicação de matrizes utilizando CUDA, comparando o desempenho entre a versão sequencial (CPU) e a versão paralela (GPU)

O código inclui validação númerica, coalescimento de memória global, uso de memória compartilhada, e um script de benchmark automatizado para medir desempenho (GFLOPS e Speedup).

# OBJETIVOS DO PROJETO

1. Implementar o algoritmo de multiplicação de matrizes na CPU e na GPU.
2. Aplicar otimizações de paralelismo massivo com CUDA C/C++.
3. Utilizar técnicas de coalescing e memória compartilhada para maximizar desempenho.
4. Comparar tempo de execução, throughput (GFLOPS) e precisão.
5. Automatizar experimentos com diferentes tamanhos de matrizes e blocos (tiles).
