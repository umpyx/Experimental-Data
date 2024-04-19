#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <cblas.h>
#include <openblas_config.h>
#include <cblas_64.h>


int main(int argc, char *argv[]){
	srand(time(NULL));
	
	goto_set_num_threads(4);
	openblas_set_num_threads(4);
	if (argc != 5) {
		printf("Usage: program [ROWS_A]... [COLS_A]... [ROWS_B]... [COLS_B]...\nCreates a 2D array A of rows [rows_A] and cols [cols_A] and multiplies it with blas_sgemm to matrix B of [rows_B] and [cols_B]\nYou provided %d arguments, please provide 4 arguments\n", argc - 1);
		exit(1);
	}

	int arows  = strtol(argv[1], NULL, 10);
	int acols = strtol(argv[2], NULL, 10);
	int brows  = strtol(argv[3], NULL, 10);
	int bcols = strtol(argv[4], NULL, 10);

	if (acols != brows){
		printf("ERROR: COLS_A must be equal to ROWS_B\nCOLS_A = %d\nROWS_B = %d\n", acols, brows);
		exit(1);
	}

	float *amatrix = malloc (acols * arows * sizeof(float));
	for (int i = 0; i < acols; i++){
		for (int x = 0; x < arows; x++){
			amatrix[x + i * acols] = 3.0;
		}
	}
	puts("Done with A!");

	float *bmatrix = malloc (bcols * brows * sizeof(float));
	for (int i = 0; i < bcols; i++){
		for (int x = 0; x < brows; x++){
			bmatrix[x + i * acols] = 3.0;
		}
	}
	puts("Done with B!");

	int *ccols = &bcols; 
	int *crows = &arows;
	float *cmatrix = malloc (arows * bcols * sizeof(float));
	puts("Done with C!");

	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasTrans, arows, bcols, acols, 1.0, amatrix, acols, bmatrix, bcols, 1.0, cmatrix, *ccols);
/*	for (int i = 0; i < *ccols; i++){
		for (int x = 0; x < *crows; x++){
			printf("%f|", cmatrix[x + i * *ccols]);
		}
		puts("\n");
	}*/
	puts("Done with MULT!");


	free(amatrix);
	free(bmatrix);
	free(cmatrix);
	return 0;
}
