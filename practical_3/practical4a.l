%{
#include <stdio.h>
%}

/* Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
OPERATOR    [-+*/]
WS          [ \t\n]

%%

{ID}        { printf("Identifier: %s\n", yytext); }
{OPERATOR}  { printf("Operator: %s\n", yytext); }
"("         { printf("Left Parenthesis\n"); }
")"         { printf("Right Parenthesis\n"); }
{DIGIT}+    { /* Ignore digits */ }
{WS}        ; /* Ignore whitespace and newline characters */

.           { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;  // Indicate no more input files
}

int main() {
    printf("Enter an arithmetic expression:\n");
    yylex();
    return 0;
}
