CC := gcc
CFLAGS := -Wall -Wextra -Werror

all: main_ass0.out

main_ass0.out: main_ass0.c myasm.o
	$(CC) $(CFLAGS) -m32 $^ -o $@

myasm.o: myasm.s
	nasm -f elf32 $< -o $@

clean:
	rm *.o *.out