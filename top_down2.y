//////////////////////////////////////////////////top.l//////////////////////////////////////////////////
%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

[0-9]+      { return ID; }
[a-zA-Z]    { return ID; }

"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }

"("         { return '('; }
")"         { return ')'; }

[ \t]       ;
\n          { return 0; }

.           { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}

//////////////////////////////////////////////////top.y//////////////////////////////////////////////////
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID

%%

input:
    E
    {
        printf("SUCCESS: The string is valid according to the top-down grammar rules.\n");
        YYACCEPT;
    }
    ;

E:
    T Edist
    ;

Edist:
      '+' T Edist
    | '-' T Edist
    |
    ;

T:
    F Tdist
    ;

Tdist:
      '*' F Tdist
    | '/' F Tdist
    |
    ;

F:
      '(' E ')'
    | ID
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "ERROR: Invalid Syntax (%s)\n", s);
}

int main()
{
    printf("Enter the algebraic expression to parse: ");
    yyparse();
    return 0;
}