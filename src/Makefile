all: singlethread multithread

singlethread: main.c
	gcc -o ../test/singlethread_target -D NUM_THREADS=1 main.c -lopenblas

multithread: main.c
	printf "\033[31;1m I hope you defined THREADS\n THREADS=${THREADS}\n\033[m"
	gcc -o ../test/multithread_target -D NUM_THREADS=${THREADS} main.c -lopenblas -lpthread
