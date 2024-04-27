%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>
%}

%%
[a-zA-Z]+ {
    int len = strlen(yytext);
    int is_palindrome = 1;
    for (int i = 0; i < len / 2; i++) {
        if (tolower(yytext[i]) != tolower(yytext[len - i - 1])) {
            is_palindrome = 0;
            break;
        }
    }
    if (is_palindrome) {
        printf("'%s' is a Palindrome\n", yytext);
    } else {
        printf("'%s' is Not a Palindrome\n", yytext);
    }
}

%%
int yywrap() {
    return 1;  // Indicate no more input files
}

int main() {
    printf("Enter a string to check if it's a palindrome:\n");
    yylex();
    return 0;
}
