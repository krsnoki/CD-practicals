%{
#include <stdio.h>
%}

%%
[a-zA-Z]+ {
    printf("Input is a Simple String: %s\n", yytext);
}

[a-zA-Z]+[ \t]+[a-zA-Z]+ {
    printf("Input is a Compound String: %s\n", yytext);
}
%%

int yywrap() {
    return 1;  // Indicate no more input files
}

int main() {
    yylex();
    return 0;
}
