%{
#include <stdio.h>
int nesting_level = 0;
%}

%token IF ELSE

%%

stmt: IF stmt { nesting_level++; printf("Nested IF statement (Level: %d)\n", nesting_level); }
    | IF stmt ELSE stmt { nesting_level++; printf("Nested IF-ELSE statement (Level: %d)\n", nesting_level); }
    | /* empty */
    ;

%%

int main() {
    printf("Enter your nested if control statements:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}

