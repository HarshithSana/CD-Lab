///////////////////////////////////////////////////expr.l///////////////////////////////////////////////////
%{
#include "y.tab.h"
%}

%%

[0-9]+      { return NUMBER; }
[+\-*/]     { return yytext[0]; }
[ \t\n]     ;
.           { return yytext[0]; }

%%

//////////////////////////////////////////////////exp.y//////////////////////////////////////////////////
%{
#include<stdio.h>
%}

%token NUMBER

%%

E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | NUMBER
  ;

%%

int main()
{
    printf("Enter expression: ");
    yyparse();
    printf("Valid Expression\n");
}

int yyerror()
{
    printf("Invalid Expression\n");
}