#include "diamond.h"
#include <string.h>
#include <malloc.h>

char **make_diamond(const char letter) {
    char m = letter - 'A';
    char n = 2*(m+1)-1;
    char **diamond = calloc(n, sizeof(char*));
    if(!diamond)
        return NULL;
    for(int i = 0; i<n; i++) {
        diamond[i] = (char*) calloc(n,sizeof(char)); 
        char idx = i<=m ? i : 2*m-i;
        char cur = idx + 'A';
        for(int j=-m; j<=m; j++) {
            diamond[i][j+m] = (j==-idx || j == idx) ? cur : ' ';
        }
    }
    return diamond;
}

void free_diamond(char **diamond){
    if(diamond!=NULL &&  diamond[0]!=NULL){    
    char n = strlen(diamond[0]);
    for(int i=0; i<n; i++){
         free(diamond[i]);
    } }
}