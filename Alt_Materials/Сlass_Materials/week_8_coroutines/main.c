#include <stdio.h>

extern long numco;

void end_co();

void start_co_from_c(int num);

void init_co_from_c(int num);

void resume_from_c(int num);

main() {
	long i;

	for(i = 0; i < numco; i++)
		init_co_from_c(i);

	printf("After init\n");
	start_co_from_c(2);

	printf("All co-routines done\n");
}


