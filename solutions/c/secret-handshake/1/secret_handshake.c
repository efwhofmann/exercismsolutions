#include "secret_handshake.h"

#include<string.h>
#include<malloc.h>

const char *actions[] = {"wink", "double blink", "close your eyes", "jump"};

const char **commands(size_t number){
   const char **result = calloc(4,sizeof(char*));
    int start = 0; int end = 4; int incr = 1;
    if (0!= (number & 16)) {start = 3; end = -1; incr = -1;}
    int idx = 0;
    for(int i=start; i != end; i += incr) {
        if(0!= (number & (1<<i))){
            result[idx++] = actions[i]; 
        }
    }
    return result;        
}