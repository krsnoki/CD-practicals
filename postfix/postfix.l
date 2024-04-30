%{
#include "y.tab.h"
%}

%%

[0-9]+                  { yylval = atoi(yytext); return NUMBER; }
[-+*/^]                 { return yytext[0]; }
[ \t\n]                 ; // Skip whitespace and newline
.                       ;

%%

int yywrap() {
    return 1;
}
