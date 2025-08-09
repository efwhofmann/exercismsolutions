#include "luhn.h"

#include<string.h>

bool luhn(const char *num){
    if (!num)
        return false;
    int len=0;
    int sum=0;
    for(int i=strlen(num)-1; i>=0; i--){
        if(num[i]>='0' && num[i]<='9'){
            len++;
            char d = num[i]-'0';
            sum += (0==len%2) ? (d==9 ? 9 : 2*d % 9): d;            
        }
        else if(num[i]!=' ')
            return false;        
    }
    return len>1 ? (0==sum%10) : false;
}
