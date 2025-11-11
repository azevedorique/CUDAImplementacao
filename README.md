# CUDAImplementacao

# Multiplicação de Matrizes com CUDA - Benchmark e Otimização

Esse projeto implementa e analisa multiplicação de matrizes utilizando CUDA, comparando o desempenho entre a versão sequencial (CPU) e a versão paralela (GPU)

O código inclui validação númerica, coalescimento de memória global, uso de memória compartilhada, e um script de benchmark automatizado para medir desempenho (GFLOPS e Speedup).

# Objetivos do Projeto

1. Implementar o algoritmo de multiplicação de matrizes na CPU e na GPU.
2. Aplicar otimizações de paralelismo massivo com CUDA C/C++.
3. Utilizar técnicas de coalescing e memória compartilhada para maximizar desempenho.
4. Comparar tempo de execução, throughput (GFLOPS) e precisão.
5. Automatizar experimentos com diferentes tamanhos de matrizes e blocos (tiles).

# Estrutura do Projeto

cuda_matrix_benchmark/
│
├── matmul_cuda_coalesced.cu    ← Implementação CUDA otimizada (coalescing + shared memory)
├── run_benchmark.sh             ← Script de benchmark automatizado (CPU × CUDA)
├── benchmark_results.csv        ← Arquivo de saída com resultados (gerado automaticamente)
└── README.md                    ← Documentação do projeto


