 #include <iostream>
#include <vector>
#include <chrono>
using namespace std;
using namespace std::chrono;

int main() {
    int M = 256, N = 256, K = 256; // dimensões das matrizes

    vector<float> A(M*K), B(K*N), C(M*N);

    // Inicialização simples
    for (int i = 0; i < M*K; i++) A[i] = 1.0f;
    for (int i = 0; i < K*N; i++) B[i] = 1.0f;

    auto start = high_resolution_clock::now();

    // Multiplicação sequencial
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            float sum = 0.0f;
            for (int k = 0; k < K; k++) {
                sum += A[i*K + k] * B[k*N + j];
            }
            C[i*N + j] = sum;
        }
    }

    auto stop = high_resolution_clock::now();
    double time_ms = duration_cast<milliseconds>(stop - start).count();

    // Cálculo de GFLOPS
    double gflops = (2.0 * M * N * K) / (time_ms / 1000.0) / 1e9;

    cout << "Tempo de execução (CPU): " << time_ms << " ms\n";
    cout << "Desempenho: " << gflops << " GFLOPS\n";

    return 0;
}

