#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
//#define TERMINAL_PRINT
//#define CLOCKING
//#define ASSEMBLY

int main()
{
    const char password[] = "ThisClassIsFun!";                  //Correct password
    FILE *fp = fopen("passwords.txt", "r");                     //Opens password text file with read permissions
    if (fp == NULL)
    {  
        printf("ERROR - Could not open file\n");
        return 1;
    }
    
    char input_pw[32];                                          //max size password of 32 characters

    while(fgets(input_pw, sizeof(input_pw), fp))                //Reads line by line from passwords.txt
    {
#ifdef ASSEMBLY
        __asm__ __volatile__(
            "@starting while loop here"
        );
#endif
#ifdef CLOCKING
        clock_t start_t, end_t;
        double total_t;
        start_t = clock();
#endif
        register unsigned int input_pw_length = strlen(input_pw) - 1;    //-1 on lab machines, -2 on laptop.
        if (input_pw_length < 4 || input_pw_length > 31){
            printf("ERROR - Password length must be between 4 and 31.\n");
            return 1;
        }
        register unsigned int pw_length = strlen(password);     //Local variable for length to speed it up
        register bool pw_match = true;                          //Keep track if passwords match
        register bool concat_pw_match = true;                   //To write to if passwords dont match to consume the same power
#ifdef TERMINAL_PRINT
        printf("\nTrying out password: %s ", input_pw);         //See which line is being read
        printf("length is: %u\n", input_pw_length);             //Ensure proper length.
        int j = 0;
        for(j = 0; j <= input_pw_length; j++){
            printf(" %c", input_pw[j]);                         //Reads out character by character 
        }
        printf("\n");                                           //Newline for once the input password has been read out
#endif
#ifdef ASSEMBLY
        __asm__ __volatile__(
            "@comparing password lengths"
        );
#endif
        if(input_pw_length != pw_length)                        //See how it runs on ARM machines and adjust this
        {
#ifdef TERMINAL_PRINT
            printf("ERROR - Password lengths did not match\n");
#endif
            pw_match = false;
        }
        else
        {
            concat_pw_match = false;
        }
#ifdef ASSEMBLY
        __asm__ __volatile__(
            "@creating concat_pw and inverse_concat_pw"
        );
#endif
        char concat_pw[pw_length];
        char inverse_concat_pw[pw_length];
        register unsigned int i;                                //unsigned int since strlen returns unsigned int
        while(i < pw_length)
        {
#ifdef ASSEMBLY
            __asm__ __volatile__(
                "@starting letter by letter"
            );
#endif
            concat_pw[i] = input_pw[i%input_pw_length];         //Fake password to compare so the real length isnt given away
            inverse_concat_pw[i] = ~input_pw[i%pw_length];
            if(concat_pw[i] != password[i])
            {
                i++;        //incrementing i in all 3 if statements since it will only ever enter one
                            // this allows for pipelining for the second half of the loop
#ifdef TERMINAL_PRINT
                printf("ERROR - Password characters did not match\n");
                printf("%c did not match %c\n", input_pw[i], concat_pw[i]);  //Character by character comparison
#endif
                if(pw_match)
                {
                    pw_match = false;
                }
                else if (!pw_match)
                {
                    concat_pw_match = !concat_pw_match;         //boolean write to consume same power
                }
                else
                {  
                    concat_pw_match = !concat_pw_match;         //Ensure a bool get toggled regardless
                }
            }//if the character is incorrect
            else if(concat_pw[i] != inverse_concat_pw[i])        //bitwise inverted to consume same power 
            {
                i++;
                //just comparison for bit inversion to consume same power
                if(concat_pw_match)
                {
                    concat_pw_match = false;
                }
                else if (!pw_match)
                {
                    concat_pw_match = !concat_pw_match;         //boolean write to consume same power
                }
                else
                {
                    concat_pw_match = !concat_pw_match;         //Ensure bool toggle
                }
            }//if the character is correct, consume the same amount of power
            else
            {
                i++;
#ifdef TERMINAL_PRINT
                printf("%c matched %c\n", input_pw[i], concat_pw[i]);        //Ensure no characters are missed while debugging
#endif
            }
            concat_pw[i] = input_pw[i%input_pw_length];         //Fake password to compare so the real length isnt given away
            inverse_concat_pw[i] = ~input_pw[i%pw_length];
            if(concat_pw[i] != password[i])
            {
                i++;
#ifdef TERMINAL_PRINT
                printf("ERROR - Password characters did not match\n");
                printf("%c did not match %c\n", input_pw[i], concat_pw[i]);  //Character by character comparison
#endif
                if(pw_match){
                    pw_match = false;
                }
                else if (!pw_match){
                    concat_pw_match = !concat_pw_match;         //boolean write to consume same power
                }
                else
                {
                    concat_pw_match = !concat_pw_match;         //Ensure bool toggle
                }
            }//if the character is incorrect
            else if(concat_pw[i] != inverse_concat_pw[i])        //bitwise inverted to consume same power 
            {
                i++;
                //just comparison for bit inversion to consume same power
                if(concat_pw_match){
                    concat_pw_match = false;
                }
                else if (!pw_match){
                    concat_pw_match = !concat_pw_match;         //boolean write to consume same power
                }
                else
                {
                    concat_pw_match = !concat_pw_match;         //Ensure bool toggle
                }
            }//if the character is correct, consume the same amount of power
            else
            {
                i++;
#ifdef TERMINAL_PRINT
                printf("%c matched %c\n", input_pw[i], concat_pw[i]);        //So no characters are missed
#endif
            }
        }
#ifdef TERMINAL_PRINT
        printf("Concat PW was %s\n", concat_pw);
#endif
#ifdef CLOCKING
        end_t = clock();
        total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;
        printf("Took %ld to %ld cycles to try %s", start_t, end_t, input_pw);
        printf("Total time taken by CPU: %f\n", total_t  );
#endif
#ifdef ASSEMBLY
        __asm__ __volatile__(
            "@checking if passwords match"
        );
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