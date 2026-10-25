#include <stdio.h>

char p[10][10];
int n;

void first(char c)
{
    int i;

    for(i = 0; i < n; i++)
    {
        if(p[i][0] == c)
            printf("%c", p[i][2]);
    }
}

int main()
{
    int i;
    char c;

    printf("Enter number of productions:");
    scanf("%d", &n);

    printf("Enter productions:");

    for(i = 0; i < n; i++)
        scanf("%s", p[i]);

    printf("Enter symbol:");
    scanf(" %c", &c);

    printf("FIRST(%c) = {", c);

    first(c);

    printf("}");

    return 0;
}