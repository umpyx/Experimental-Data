CC = gcc
LIBS = cblas

all: main

main: main.c main.h
	gcc -g -o test/bad_program -l$(LIBS) main.c
