%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
%}

%token VARIABLE

%%

variable: VARIABLE { printf("Valid variable: %s\n", $1); }
        ;

%%

int main() {
    printf("Enter a variable:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int yylex() {
    int c;
    c = getchar();
    if (isalpha(c)) {
        char buffer[100];
        buffer[0] = c;
        int i = 1;
        while ((c = getchar()) != EOF && (isalnum(c) || c == '_')) {
            buffer[i++] = c;
        }
        ungetc(c, stdin);
        buffer[i] = '\0';
        yylval.s = strdup(buffer);
        return VARIABLE;
    }
    return c;
}
