%{
#include<stdio.h>
%}
%token IF COND THEN STAT ELSE
%%
Stat:IF '(' COND ')' THEN STAT {printf("\n VALId Statement");}
| IF '(' COND ')' THEN STAT ELSE STAT {printf("\n VALID Statement");}
|
;
%%
main()
{
printf("\n enter statement ");
yyparse();
}
yyerror (char *s)
{
printf("%s",s);
}