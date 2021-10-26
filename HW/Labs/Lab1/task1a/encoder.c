#include <stdio.h>
#include <ctype.h>

int main() {

    int c;

    printf ("%s \n", "Welcome to my C code");

    while ( c != EOF ) {
        c = fgetc(stdin);

        if (isspace(c)) {
            c='\n';
            fputc(c, stdout);
        }
        else {

            if (c != EOF ) {
                fputc (c, stdout);
            }
        }
    }
    return 0;
}
