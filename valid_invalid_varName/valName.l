%{
#include "y.tab.h"
char *my_strdup(const char *s);
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*   { yylval.s = my_strdup(yytext); return VARIABLE; }
[0-9][a-zA-Z0-9_]*        { yyerror("Invalid variable: Cannot start with a digit"); }
.                         ;

%%

int yywrap() {
    return 1;
}

char *my_strdup(const char *s) {
    char *copy = malloc(strlen(s) + 1);
    if (copy != NULL) {
        strcpy(copy, s);
    }
    return copy;
}
