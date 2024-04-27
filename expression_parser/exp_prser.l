%{
#include <stdio.h>
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE

%%

expression: NUMBER
          | expression PLUS expression
          | expression MINUS expression
          | expression TIMES expression
          | expression DIVIDE expression
          ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}
