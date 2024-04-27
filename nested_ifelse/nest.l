%{
#include "y.tab.h"
%}

%%

"if"                { return IF; }
"else"              { return ELSE; }
[ \t\n]             ; /* Skip whitespace */

.                   ; /* Ignore any other characters */

%%

int yywrap() {
    return 1;
}
