%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern FILE *yyin;
void yyerror(const char *s);

int stack[100];
int top = -1;

int evaluate(int op, int a, int b) {
    switch(op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
        case '^': {
            int result = 1;
            for(int i = 0; i < b; i++)
                result *= a;
            return result;
        }
    }
    return 0;
}
%}

%token NUMBER

%%
expr: expr expr '+' { stack[top-1] = evaluate('+', stack[top-1], stack[top]); top--; }
    | expr expr '-' { stack[top-1] = evaluate('-', stack[top-1], stack[top]); top--; }
    | expr expr '*' { stack[top-1] = evaluate('*', stack[top-1], stack[top]); top--; }
    | expr expr '/' { stack[top-1] = evaluate('/', stack[top-1], stack[top]); top--; }
    | expr expr '^' { stack[top-1] = evaluate('^', stack[top-1], stack[top]); top--; }
    | NUMBER { stack[++top] = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    printf("Result: %d\n", stack[top]);
    return 0;
}
