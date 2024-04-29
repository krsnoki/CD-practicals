%{
#include "y.tab.h"
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[-+*/()\\n]     { return yytext[0]; }
.               { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}
