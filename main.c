#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char password[] = deez;

int main()
{
    FIEL *fp;
    fp = fopen("passwords.txt", 'r');
    if (fp == NULL)
    {
        printf("ERROR - Could not open file");
        return 1;
    }
    
    
    
    fclose(fp);
    return 0;
}