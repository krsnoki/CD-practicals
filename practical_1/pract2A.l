%{
    #include<stdio.h>
    int num_cmnt_lines = 0;
%}

%x comment

%%

"//".*       { ++num_cmnt_lines; }
"/*"         { BEGIN(comment); }
<comment>"*/" { BEGIN(INITIAL); ++num_cmnt_lines; } 
<comment>[^*\n]+  { } 

\n            ; 
.             ; 

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Number of comments in given C program: %d\n", num_cmnt_lines);
    return 0;
}
