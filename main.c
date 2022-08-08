#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
//#define TERMINAL_PRINT
//#define CLOCKING

//TODO: use clock() in time.h to see number of clock cycles between password tries. https://www.tutorialspoint.com/c_standard_library/c_function_clock.htm

int main()
{
    const char password[] = "deez";                             //Correct password
    FILE *fp = fopen("passwords.txt", "r");                     //Opens password text file with read permissions
    if (fp == NULL)
    {  
        printf("ERROR - Could not open file\n");
        return 1;
    }
    
    char input_pw[32];                                          //max size password of 32 characters

    while(fgets(input_pw, sizeof(input_pw), fp))                //Reads line by line from passwords.txt
    {
#ifdef CLOCKING
        clock_t start_t, end_t;
        double total_t;
        start_t = clock();
#endif
        unsigned int input_pw_length = strlen(input_pw) - 1;    //-1 on lab machines, -2 on laptop.
        if (input_pw_length < 4){
            printf("ERROR - Password length must be greater than 3\n");
            return 1;
        }
        unsigned int pw_length = strlen(password);              //Local variable for length to speed it up
        register bool pw_match = true;                          //Keep track if passwords match
        register bool nonce_pw_match = true;                    //To write to if passwords dont match to consume the same power
#ifdef TERMINAL_PRINT
        printf("\nTrying out password: %s ", input_pw);         //See which line is being read
        printf("length is: %u\n", input_pw_length);             //Ensure proper length. This changes depending on which machine its running on for some reason.
        int j = 0;
        for(j = 0; j <= input_pw_length; j++){                  //For some reason reads two extra characters. Could be the '/0' to end the line in the txt file
            printf(" %c", input_pw[j]);                         //Reads out character by character 
        }
        printf("\n");                                           //Newline for once the input password has been read out
#endif
        if(input_pw_length != pw_length)                        //See how it runs on ARM machines and adjust this
        {
#ifdef TERMINAL_PRINT
            printf("ERROR - Password lengths did not match\n");
#endif
            pw_match = false;
        }
        else{
            nonce_pw_match = false;
        }
        char nonce_pw[input_pw_length];
        unsigned int i;                                         //unsigned int since strlen returns unsigned int
        for(i=0; i < input_pw_length; i++)
        {
            nonce_pw[i] = password[i%pw_length];                //Fake password to compare so the real length isnt given away
            if(input_pw[i] != nonce_pw[i])
            {
#ifdef TERMINAL_PRINT
                printf("ERROR - Password characters did not match\n");
                printf("%c did not match %c\n", input_pw[i], nonce_pw[i]);  //Character by character comparison
#endif
                if(pw_match){
                    pw_match = false;
                }
                else{
                    nonce_pw_match = !nonce_pw_match;
                }
            }
            else if(input_pw[i] != ~nonce_pw[i])
            {
                //just comparison for bit inversion to consume same power
            }
            else
            {
#ifdef TERMINAL_PRINT
                printf("%c matched %c\n", input_pw[i], nonce_pw[i]);        //So no characters are missed
#endif
            }
        }
#ifdef TERMINAL_PRINT
        printf("Nonce PW was %s\n", nonce_pw);
#endif
#ifdef CLOCKING
        end_t = clock();
        total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;
        printf("Took %ld to %ld cycles to try %s", start_t, end_t, input_pw);
        printf("Total time taken by CPU: %f\n", total_t  );
#endif
        if(pw_match)
        {
            printf("Password match: %s", input_pw);
        }
        else
        {
            printf("Incorrect password: %s", input_pw);
        }
    }
    fclose(fp);                                                 //Close opened file
    return 0;  
}