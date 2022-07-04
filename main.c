#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// const char password[] = "deez";

int main()
{
    const char password[] = "deez";
    FILE *fp = fopen("passwords.txt", "r");
    if (fp == NULL)
    {
        printf("ERROR - Could not open file\n");
        return 1;
    }
    
    char input_pw[32];  //max size password of 32 characters

    while(fgets(input_pw, sizeof(input_pw), fp)) {
    //while(getline(input_pw, sizeof(input_pw), fp)){
        //fputs(chunk, stdout);
        //fputs("|*\n", stdout);  // marker string used to show where the content of the chunk array has ended
        printf("\nTrying out password: %s", input_pw);
        printf("length is: %d\n", strlen(input_pw));
        for(int j = 0; j <= strlen(input_pw)-2; j++){
            printf("%c ", input_pw[j]);
        }
        printf("done\n");
        unsigned int pw_length = strlen(password);
        if(strlen(input_pw)-1 != pw_length){    //See how it runs on ARM machines and adjust this
            printf("ERROR - Password lengths did not match\n");
            //return 1;
        }
        unsigned int i;
        for(i=0; i < pw_length; i++){
            if(input_pw[i] != password[i]){//can maybe shorten this?
                //return 1;
                printf("ERROR - Password characters did not match\n");
                printf("%c did not match %c\n", input_pw[i], password[i]);
            }
            else{
                printf("%c matched %c\n", input_pw[i], password[i]);
            }
        }
    }

    fclose(fp);
    return 0;
}