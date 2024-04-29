%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

expression : expression '+' expression  { printf("Valid expression: %d + %d\n", $1, $3); $$ = $1 + $3; }
           | expression '-' expression  { printf("Valid expression: %d - %d\n", $1, $3); $$ = $1 - $3; }
           | expression '*' expression  { printf("Valid expression: %d * %d\n", $1, $3); $$ = $1 * $3; }
           | expression '/' expression  { printf("Valid expression: %d / %d\n", $1, $3); $$ = $1 / $3; }
           | '(' expression ')'         { $$ = $2; }
           | NUMBER                      { $$ = $1; }
           ;

%%

int main() {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
