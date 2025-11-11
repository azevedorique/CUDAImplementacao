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

```sh
cuda_matrix_benchmark/
│
├── matmul_cuda_coalesced.cu    ← Implementação CUDA otimizada (coalescing + shared memory)
├── run_benchmark.sh             ← Script de benchmark automatizado (CPU × CUDA)
├── benchmark_results.csv        ← Arquivo de saída com resultados (gerado automaticamente)
└── README.md                    ← Documentação do projeto

```
# Requisitos

* GPU NVIDIA com suporte a CUDA
* CUDA Toolkit 11+
* Compilador compatível (nvcc)
* Shell Bash (Linux, macOS ou WSL no Windows)

Verifique a instalação:

```sh
nvcc --version
nvidia-smi

```

# Conceitos-Chave

* Paralelismo Massivo - O problema da multiplicação de matrizes é altamente paralelizável - cada elemento de saída C[i][j] pode ser calculado de forma independente.
  
* Memória Compartilhada - Cada bloco de threads armazena "tiles" de A e B em memória rápida (shared memory), reduzindo leituras repetidas da memória global.

* Coalescing - Os acessos às memória global foram otimizados para que threads consecutivas acessem endereços consecutivos, garantindo eficiência máxima de leitura e escrita.


# Execução da Multiplicação

1. Compilar o código CUDA:

```sh
nvcc -O3 -arch=sm_70 -o matmul_cuda_coalesced matmul_cuda_coalesced.cu
```
Substitua sm_70 pela arquitetura da sua GPU (ex.: sm_86 para RTX 30xx).

2. Executar manualmente:

``` sh
./matmul_cuda_coalesced M N K ITER TILE

```

Exemplo:

``` sh
./matmul_cuda_coalesced 1024 1024 1024 10 16

```

# Execução Automatizada (Benchmark)

Para testar múltiplos tamanhos de matrizes e tiles automaticamente:

1. Dar permissão ao script:

 ``` sh
chmod +x run_benchmark.sh
```

2. Executar o benchmark:

```sh
./run_benchmark.sh
```

O script roda a versão CUDA (que já inclui CPU baseline), mede desempenho e gera o arquivo:

```sh
benchmark_results.csv
```


# Métricas de Desempenho

* Tempo de execução (ms): duração média das execuções
* GFLOPS (GigaFLOPS): número de operações de ponto flutuante por segundo.
* Speedup (x): razão entre o tempo CPU e GPU.
* Erro absoluto máximo: diferença numérica entre CPU e GPU.

# Grupo

* Henrique Guerra
* Celso Bezerra
* João Victor Vieira
* Ricardo Costa







