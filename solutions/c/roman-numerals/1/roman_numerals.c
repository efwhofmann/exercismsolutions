#include "roman_numerals.h"
#include <string.h>
#include <malloc.h>

char *to_roman_numeral(unsigned int number){
    char numerals[] = {'M', 'D', 'C', 'L', 'X', 'V', 'I'};
    char buffer[15]={0};
    unsigned int steps[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    int idx = 0;
    for (int i=0; i<13; i++) {
        while (number>=steps[i]) {
            number -= steps[i];
            if (0==i%2) {
                buffer[idx] = numerals[i/2];
            }
            else {
                buffer[idx++] = (steps[i]>100) ? 'C' : (steps[i]>10 ? 'X' : 'I');
                buffer[idx] = numerals[(i-1)/2];
            }
            idx++;
        }
    }
    unsigned int len = strlen(buffer);
    char *result = calloc(len,sizeof(char));
    strncpy(result, buffer, len);
    return result;
}