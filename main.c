#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#define TERMINAL_PRINT

//TODO: concatenate some jibberish to the actual password when the lengths dont match to not give the real password length away
//TODO: use clock() in time.h to see number of clock cycles between password tries. https://www.tutorialspoint.com/c_standard_library/c_function_clock.htm
//TODO: Start as match = TRUE then set to false on any mismatch

int main()
{
    const char password[] = "deez";             //Correct password
    FILE *fp = fopen("passwords.txt", "r");     //Opens password text file w read permissions
    if (fp == NULL)
    {  
#ifdef TERMINAL_PRINT
        printf("ERROR - Could not open file\n");
#endif
        return 1;
    }
    
    char input_pw[32];  //max size password of 32 characters

    while(fgets(input_pw, sizeof(input_pw), fp)) {      //Reads line by line from passwords.txt
        unsigned int pw_length = strlen(password);      //Local variable for length to speed it up
        unsigned int input_pw_length = strlen(input_pw) - 2;    //See how it is on ARM machines and adjust this
#ifdef TERMINAL_PRINT
        printf("\nTrying out password: %s", input_pw);  //See which line is being read
        printf("length is: %d\n", input_pw_length);    //Ensure proper length. This changes depending on which machine its running on for some reason.
        int j = 0;
        for(j = 0; j <= input_pw_length; j++){   //For some reason reads two extra characters. Could be the '/0' to end the line in the txt file
            printf(" %c", input_pw[j]);                 //Reads out character by character 
        }
        printf("\n");                                   //Newline for once the input password has been read out
#endif
        if(input_pw_length != pw_length){            //See how it runs on ARM machines and adjust this
#ifdef TERMINAL_PRINT
            printf("ERROR - Password lengths did not match\n");
#endif
            //TODO add pw_match and nonce_pw_match
            //return 1;
        }
        char nonce_pw[input_pw_length];
        unsigned int i;                                 //unsigned int since strlen returns unsigned int
        for(i=0; i < input_pw_length; i++){
            nonce_pw[i] = password[i%pw_length];
            if(input_pw[i] != nonce_pw[i]){
                //return 1;
#ifdef TERMINAL_PRINT
                printf("ERROR - Password characters did not match\n");
                printf("%c did not match %c\n", input_pw[i], nonce_pw[i]);  //Character by character comparison
#endif
                //TODO add pw_match FALSE and nonce_pw_match
            }
            else{
#ifdef TERMINAL_PRINT
                printf("%c matched %c\n", input_pw[i], nonce_pw[i]);        //So no characters are missed
#endif
            }
        }
#ifdef TERMINAL_PRINT
        printf("Nonce PW was %s\n", nonce_pw);
#endif
    }
    fclose(fp);                                         //Close opened file
    return 0;
}