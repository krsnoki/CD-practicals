%{
#include "y.tab.h"
%}

%%

a { return A; }
b { return B; }
\n { return 0; } /* Ignore newline characters */
. { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}
