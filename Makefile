# By default, the code is compiled for a "big endian" machine.
# To compile on a "little endian" machine set the LITTLE_ENDIAN flag.
# To make smaller object code, but run a little slower, don't use UNROLL_LOOPS.
# To use NIST's modified SHA of 7/11/94, define USE_MODIFIED_SHA

CC = gcc
CFLAGS = -O3 -Wall

sha:	sha_driver.o sha.o
	$(CC) -o $@ sha_driver.o sha.o
	strip $@


shapg:
	$(CC) -o sha sha.c sha_driver.c -g -pg

test:
	rm output_small.txt
	./runme_small.sh
	cat output_small.txt

clean:
	rm -rf *.o sha output*
