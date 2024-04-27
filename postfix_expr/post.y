%{
#include<stdio.h>
int yylex(void);
int yyerror(char)
float output=0;
%}
%union
{
 float dval;
}
%token <dval> NUMBER, NUM
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type <dval> state
%type <dval> exp
%type <dval> N
%%
state : exp N {}
 ;
exp : NUMBER {$$=$1;output=$$;}
 | exp exp '+' {$$=$1+$2;output=$$;}
 | exp exp '-' {$$=$1-$2;output=$$;}
 | exp exp '*' {$$=$1*$2;output=$$;}
 | exp exp '/' {$$=$1/$2;output=$$;} 
 ;
N : {printf("n Output =%fn",output);}
 ;
%%