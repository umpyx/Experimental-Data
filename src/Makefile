all: singlethread multithread

singlethread: singlethread.c 
	gcc -o ../test/singlethread_target -lcblas singlethread.c

multithread: multithread.c
	gcc -o ../test/multithread_target -lcblas multithread.c
