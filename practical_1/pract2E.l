%{
#include <stdio.h>
int num_vowels = 0, num_consonants = 0;
%}

%%

[aAeEiIoOuU]    { ++num_vowels; }
[^aAeEiIoOuU\n\s] { ++num_consonants; }
.;

%%

int yywrap() {
    return 1;  
}

int main() {
    yylex();
    printf("Number of vowels: %d\n", num_vowels);
    printf("Number of consonants: %d\n", num_consonants);
    return 0;
}
