#include <stdio.h>

#define PASSWORD deez

int main(int argc, char **argv) {
  FILE* fl;
  char st1[2000];
  char * buffer = 0;
  long length;

  fl = fopen (argv[1], "r"); //the data file content is shown above
  if (fl){
    fseek (fl, 0, SEEK_END);
    length = ftell (fl);
    fseek (fl, 0, SEEK_SET);
    buffer = malloc (length+1);
    if (buffer){
        //fread (buffer, 1, length, fl);
        fread(buffer, sizeof(char), length, fl);
        buffer[length] = '\0';
    }
  fclose (fl);    
  }else{
    printf("data file not found");
    return -1;
  }  


  //firstly let's compare the value passed by command line with "london"
  strcpy(st1, argv[2]); 
  if(strcmp(st1,"london")==0)
    printf("equals\n");  //as expected, I get "equals" printed
  else
    printf("unequal\n");


  //now let's compare the values extracted from the data file, 
  char* entity = strtok(buffer, "\n"); 
  while (entity != NULL) {
    strcpy(st1, entity); //copy the value from the char pointer entity to the char array st1 so we can compare with other strings

    printf("%s\n", st1);  //this prints london, ....

    if(strcmp(st1,"london")==0)
        printf("equals\n");  //I was expecting this..
    else
        printf("unequal\n"); //but i got this...
    entity = strtok(NULL, "\n");
  }
  return 0;
}

int compare_key() {
    unsigned int len = strlen(key_input);
    unsigned int correct_len = strlen(correct_key);
    int i, wait_time = 0, random_time, diff;
    struct timeval t;
    gettimeofday(&t, NULL);
    srand(t.tv_usec * t.tv_sec);

    if (len != correct_len) return 1;
    for (i = 0; i < correct_len; i++) {
        if (key_input[i] != correct_key[i]) {
            diff = key_input[i] - correct_key[i]; 
            if (diff < 0)
                diff = -diff;
            // delay stops brute force attack
            wait_time += diff;
        }
    }

    random_time = rand() % 10;
    usleep(10000 * (wait_time + random_time));

    return wait_time > 0;
}