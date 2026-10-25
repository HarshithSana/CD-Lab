```lex
%{
#include <stdio.h>
#include <stdlib.h>

int COMMENT = 0;
%}

Identifier [a-zA-Z][a-zA-Z0-9]*

%%

#.* {
    printf("\n%s is a preprocessor directive", yytext);
}

"/*" {
    COMMENT = 1;
}

"*/" {
    COMMENT = 0;
}

"//".* {
    /* Ignore single-line comments */
}

int|main|float|void|char|if|else|for|do|while|getch {
    if (!COMMENT)
        printf("\n\t%s is a KEYWORD", yytext);
}

{Identifier}\( {
    if (!COMMENT)
        printf("\n\t%s is a Function", yytext);
}

\{ {
    if (!COMMENT)
        printf("\nBlock begins");
}

\} {
    if (!COMMENT)
        printf("\nBlock ends");
}

\( {
    if (!COMMENT)
        ECHO;
}

{Identifier}(\[[0-9]*\])? {
    if (!COMMENT)
        printf("\n%s Identifier", yytext);
}

[0-9]+ {
    if (!COMMENT)
        printf("\n%s Number", yytext);
}

\".*\" {
    if (!COMMENT)
        printf("\n%s String", yytext);
}

"<="|">="|"!="|"=="|"<"|">" {
    if (!COMMENT)
        printf("\n\t%s is a RELATIONAL OPERATOR", yytext);
}

"+"|"-"|"*"|"/" {
    if (!COMMENT)
        printf("\n\t%s is an ARITHMETIC OPERATOR", yytext);
}

[ \t\n]+ {
    /* Ignore whitespace */
}

. {
    if (!COMMENT)
        ECHO;
}

%%

int main(int argc, char **argv)
{
    FILE *file;

    file = fopen("var.c", "r");

    if (!file) {
        printf("File not found\n");
        exit(1);
    }

    yyin = file;
    yylex();

    fclose(file);
    return 0;
}

int yywrap()
{
    return 1;
}
```
