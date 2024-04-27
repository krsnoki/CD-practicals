%{
#include <stdio.h>
int n_chars = 0, n_words = 0, n_spaces = 0, n_lines = 0;
%}

char    [^ \t\n]
word    [a-zA-Z0-9]+
space   [ \t]+

%%

{char}  { ++n_chars; }
{word}  { ++n_words; }
{space} { ++n_spaces; }
"\n"    { ++n_lines; }

%%
int yywrap(){
    return 1;
}

int main() {
    yylex();
    printf("Number of characters: %d\n", n_chars);
    printf("Number of words: %d\n", n_words);
    printf("Number of spaces: %d\n", n_spaces);
    printf("Number of lines: %d\n", n_lines);
    return 0;
}
