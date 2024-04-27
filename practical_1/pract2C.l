%{
#include <stdio.h>
int num_pos_integers = 0, num_neg_integers = 0;
int num_pos_fractions = 0, num_neg_fractions = 0;
%}

integer      [+-]?[0-9]+
fraction     [+-]?[0-9]+\.[0-9]+

%%

{integer}   {
    if (yytext[0] == '-') {
        ++num_neg_integers;
    } else {
        ++num_pos_integers;
    }
}
{fraction}  {
    if (yytext[0] == '-') {
        ++num_neg_fractions;
    } else {
        ++num_pos_fractions;
    }
}
.        ; /* Ignore other characters */

%%
int yywrap(){
    return 1;
}

int main() {
    yylex();
    printf("Number of positive integers: %d\n", num_pos_integers);
    printf("Number of negative integers: %d\n", num_neg_integers);
    printf("Number of positive fractions: %d\n", num_pos_fractions);
    printf("Number of negative fractions: %d\n", num_neg_fractions);
    return 0;
}



