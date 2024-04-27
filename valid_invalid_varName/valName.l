%{
#include "y.tab.h"
%}

%%

[a-zA-Z][a-zA-Z0-9_]*   { yylval.s = strdup(yytext); return VARIABLE; }
.                        ;

%%

int yywrap() {
    return 1;
}
