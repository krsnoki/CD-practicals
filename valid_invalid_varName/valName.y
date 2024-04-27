%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}

%union {
    char *s;
}

%token <s> VARIABLE

%%

variable: VARIABLE { printf("Valid variable: %s\n", $1); free($1); }
        | error      { yyerror("Invalid variable"); }
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
