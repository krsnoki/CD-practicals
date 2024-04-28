%{
#include <stdio.h>
%}

%token A B

%%

start: valid_string { printf("Valid string\n"); }
     ;

valid_string: A A A B
            | A B B B
            | A B
            | A
            | A A B B
            ;

%%

int main() {
    printf("Enter the string: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
