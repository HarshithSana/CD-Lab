%% 
[a-zA-Z][a-zA-Z0-9]* {
printf("\n %s is Identifier", yytext);
} 
[0-9]+ {
    printf("\n %s is Constant", yytext);
} 
">"|"<"|">="|"<="|"=="|"!=" {
    printf("\n %s is Relational operator", yytext);}
"+"|"-"|"*"|"/"|"%" {
    printf("\n %s is Arithmetic operator", yytext);
}
"/*".*"*/" {
    printf("\n %s is Comment", yytext);
}
%%
int main()
{ 
    yylex();
    return(0);
}
int yywrap()
{ 
    return 1;
}