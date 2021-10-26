CC := gcc
CFLAGS := -Wall -Wextra -Werror

all: main.out

main.out: main.c numbers.c add.o
	$(CC) $(CFLAGS) -m32 $^ -o $@

add.o: add.s
	nasm -f elf32 $< -o $@

clean:
	rm *.o *.out