%{
#include <stdio.h>
%}

%token A B

%%

anb: A anb B
    | /* empty */
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
