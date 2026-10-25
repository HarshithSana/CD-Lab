#include <stdio.h>
#include <ctype.h>

char s[100];
int i = 0;

void E();
void T();
void F();

void E()
{
    T();
    if (s[i] == '+')
    {
        i++;
        E();
    }
}

void T()
{
    F();
    if (s[i] == '*')
    {
        i++;
        T();
    }
}

void F()
{
    if (isalnum(s[i]))
    {
        i++;
    }
    else if (s[i] == '(')
    {
        i++;
        E();
        if (s[i] == ')')
            i++;
    }
}

int main()
{
    printf("Enter Expression: ");
    scanf("%s", s);

    E();

    if (s[i] == '\0')
        printf("String is successfully parsed");
    else
        printf("Syntax Error");

    return 0;
}