all: singlethread multithread

singlethread: singlethread.c 
	cc -o test/singlethread_target -lcblas singlethread.c

multithread: multithread.c
	cc -o test/multithread_target -lcblas multithread.c
