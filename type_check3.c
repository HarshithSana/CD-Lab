#include <stdio.h>

int main()
{
    int n, i, flag = 0;
    char vari[15], typ[15], b[50], c;

    printf("Enter the number of variables: ");
    scanf("%d", &n);

    for(i = 0; i < n; i++)
    {
        printf("Enter the variable[%d]: ", i);
        scanf(" %c", &vari[i]);

        printf("Enter the variable-type[%d](float-f,int-i): ", i);
        scanf(" %c", &typ[i]);
    }

    printf("Enter the Expression(end with $): ");

    i = 0;
    getchar();

    while((c = getchar()) != '$')
    {
        b[i] = c;

        if(c == '/')
            flag = 1;

        i++;
    }

    /* Check first variable */
    for(i = 0; i < n; i++)
    {
        if(b[0] == vari[i])
        {
            if(flag == 1 && typ[i] != 'f')
                printf("Identifier %c must be a float type..!\n", vari[i]);
            else
                printf("The datatype is correctly defined..!\n");

            break;
        }
    }

    return 0;
}