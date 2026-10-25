%{
#include<stdio.h>
int c_count=0;
int w_count=0;
int l_count=0;
%}
%%
"\n" {c_count++;l_count++;w_count++;}
[\t]+ { c_count++;w_count++;}
. {c_count++;}
%%
int main()
{
    printf("ENTER:");
    yylex();
    printf("lines%d",l_count);
    printf("words%d",w_count);
    printf("char%d",c_count);
    return(0);
}
int yywrap()
{
    return 1;
}