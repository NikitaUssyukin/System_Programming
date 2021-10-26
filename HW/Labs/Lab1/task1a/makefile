input := encoder.c
output := encoder.out

CC := gcc
CFLAGS := -Wall -Wextra -Werror

all: $(output)

encoder.out: $(input)
	$(CC) $(CFLAGS) -m32 $^ -o $@

clean:
	rm *.out
	