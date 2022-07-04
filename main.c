#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//TODO: concatenate some jibberish to the actual password when the lengths dont match to not give the real password length away

int main()
{
    const char password[] = "deez";             //Correct password
    FILE *fp = fopen("passwords.txt", "r");     //Opens password text file w read permissions
    if (fp == NULL)
    {
        printf("ERROR - Could not open file\n");
        return 1;
    }
    
    char input_pw[32];  //max size password of 32 characters

    while(fgets(input_pw, sizeof(input_pw), fp)) {      //Reads line by line from passwords.txt
        printf("\nTrying out password: %s", input_pw);  //See which line is being read
        printf("length is: %d\n", strlen(input_pw));    //Ensure proper length. This changes depending on which machine its running on for some reason.
        for(int j = 0; j <= strlen(input_pw)-2; j++){   //For some reason reads two extra characters. Could be the '/0' to end the line in the txt file
            printf("%c ", input_pw[j]);                 //Reads out character by character 
        }
        printf("\n");                                   //Newline for once the input password has been read out
        unsigned int pw_length = strlen(password);      //Local variable for length to speed it up
        if(strlen(input_pw)-1 != pw_length){            //See how it runs on ARM machines and adjust this
            printf("ERROR - Password lengths did not match\n");
            //return 1;
        }
        unsigned int i;                                 //unsigned int since strlen returns unsigned int
        for(i=0; i < pw_length; i++){
            if(input_pw[i] != password[i]){
                //return 1;
                printf("ERROR - Password characters did not match\n");
                printf("%c did not match %c\n", input_pw[i], password[i]);  //Character by character comparison
            }
            else{
                printf("%c matched %c\n", input_pw[i], password[i]);        //So no characters are missed
            }
        }
    }
    fclose(fp);                                         //Close opened file
    return 0;
}