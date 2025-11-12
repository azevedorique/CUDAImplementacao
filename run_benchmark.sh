#!/bin/bash
# ------------------------------------------------------------
# Script: run_benchmark.sh
# Descrição: Executa benchmarks comparativos CPU x CUDA
#            e grava resultados em CSV automaticamente.
# ------------------------------------------------------------

EXEC="./matmul_cuda_validado"
OUTPUT="benchmark_results.csv"

ITER=5
SIZES=(256 512 1024 2048)
TILES=(8 16 32)

# Cabeçalho do CSV
echo "Size,Tile,CPU_Time_ms,GPU_Time_ms,GFLOPS_CPU,GFLOPS_GPU,Speedup,Max_Error" > $OUTPUT

echo "===================================================="
echo "🚀 Iniciando benchmark CPU x CUDA"
echo "===================================================="

for N in "${SIZES[@]}"; do
  for TILE in "${TILES[@]}"; do
    echo "🧮 Teste: ${N}x${N} | TILE=${TILE} | ${ITER} repetições"

    # Executar o programa CUDA (que também faz CPU)
    RESULT=$($EXEC $N $N $N $ITER $TILE)

    # Extrair valores da saída
    CPU_TIME=$(echo "$RESULT" | grep "Tempo CPU" | awk '{print $3}')
    GPU_TIME=$(echo "$RESULT" | grep "Tempo médio GPU" | awk '{print $4}')
    GFLOPS_CPU=$(echo "$RESULT" | grep "GFLOPS (CPU)" | awk '{print $3}')
    GFLOPS_GPU=$(echo "$RESULT" | grep "GFLOPS (GPU)" | awk '{print $3}')
    SPEEDUP=$(echo "$RESULT" | grep "Speedup" | awk '{print $2}' | sed 's/x//')
    MAX_ERR=$(echo "$RESULT" | grep "Erro absoluto máximo" | awk '{print $4}')

    # Registrar no CSV
    echo "${N},${TILE},${CPU_TIME},${GPU_TIME},${GFLOPS_CPU},${GFLOPS_GPU},${SPEEDUP},${MAX_ERR}" >> $OUTPUT

    echo "✅ Concluído: ${N}x${N} | Tile=${TILE} | Speedup=${SPEEDUP}x"
    echo ""
  done
done

echo "===================================================="
echo "🏁 Benchmark completo!"
echo "📄 Resultados salvos em: ${OUTPUT}"
echo "===================================================="
