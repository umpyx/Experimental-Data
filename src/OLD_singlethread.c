#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <openblas-pthread/cblas.h>
#include <openblas-pthread/openblas_config.h>


int main(int argc, char *argv[]){

	#ifdef NUM_THREADS
		goto_set_num_threads(NUM_THREADS);
		openblas_set_num_threads(NUM_THREADS);
	#endif

	struct timespec initialTime, finalTime;

	srand(time(NULL));
	
	if (argc != 5) {
		printf("Usage: program [ROWS_A]... [COLS_A]... [ROWS_B]... [COLS_B]...\nCreates a 2D array A of rows [rows_A] and cols [cols_A] and multiplies it with blas_sgemm to matrix B of [rows_B] and [cols_B]\nYou provided %d arguments, please provide 4 arguments\n", argc - 1);
		exit(1);
	}

	size_t arows  = strtol(argv[1], NULL, 10);
	size_t acols  = strtol(argv[2], NULL, 10);
	size_t brows  = strtol(argv[3], NULL, 10);
	size_t bcols  = strtol(argv[4], NULL, 10);

	if (acols != brows){
		printf("ERROR: COLS_A must be equal to ROWS_B\nCOLS_A = %d\nROWS_B = %d\n", acols, brows);
		exit(1);
	}

	clock_gettime(CLOCK_MONOTONIC_RAW, &initialTime);
	float *amatrix = malloc (acols * arows * sizeof(float));
	for (int i = 0; i < acols; i++){
		for (int x = 0; x < arows; x++){
			amatrix[x + i * acols] = rand();
		}
	}
	clock_gettime(CLOCK_MONOTONIC_RAW, &finalTime);
	printf("A: %lu nanoseconds\n", finalTime.tv_nsec - initialTime.tv_nsec);

	float *bmatrix = malloc (bcols * brows * sizeof(float));
	clock_gettime(CLOCK_MONOTONIC_RAW, &initialTime);
	for (int i = 0; i < bcols; i++){
		for (int x = 0; x < brows; x++){
			bmatrix[x + i * acols] = rand();
		}
	}
	clock_gettime(CLOCK_MONOTONIC_RAW, &finalTime);
	printf("B: %lu nanoseconds\n", finalTime.tv_nsec - initialTime.tv_nsec);

	size_t *ccols = &bcols; 
	size_t *crows = &arows;
	float *cmatrix = malloc (arows * bcols * sizeof(float));
	puts("C initialized\n");

	clock_gettime(CLOCK_MONOTONIC_RAW, &initialTime);
	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasTrans, arows, bcols, acols, 1.0, amatrix, acols, bmatrix, bcols, 1.0, cmatrix, *ccols);
	clock_gettime(CLOCK_MONOTONIC_RAW, &finalTime);
	printf("Mult: %lu nanoseconds\n", finalTime.tv_nsec - initialTime.tv_nsec);


	free(amatrix);
	free(bmatrix);
	free(cmatrix);
	return 0;
}
