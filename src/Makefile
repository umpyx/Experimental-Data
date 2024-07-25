all: singlethread multithread

#On vega, use LD_LIBRARY_PATH=/tmp

singlethread: singlethread.c 
	gcc -o ../test/singlethread_target singlethread.c -lopenblas

multithread: multithread.c
	gcc -o ../test/multithread_target -D NUM_THREADS=${THREADS} multithread.c -lopenblas -lpthread
