all: singlethread multithread

singlethread: singlethread.c 
	gcc -o ../test/singlethread_target -lopenblas singlethread.c

multithread: multithread.c
	gcc -o ../test/multithread_target -lopenblas -lpthread -lcblas multithread.c 	
