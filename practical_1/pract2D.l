%{
#include <stdio.h>
int num_scanf = 0, num_printf = 0;
%}

%%
scanf\s*\(.*\) {
    ++num_scanf;
}

printf\s*\(.*\) {
    ++num_printf;
}
.        ; /* Ignore other characters */

%%
int yywrap() {
    return 1;
}


int main() {
    yylex();
    printf("Number of scanf statements: %d\n", num_scanf);
    printf("Number of printf statements: %d\n", num_printf);
    return 0;
}
