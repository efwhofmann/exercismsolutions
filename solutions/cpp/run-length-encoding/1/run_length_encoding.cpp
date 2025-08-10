#include "run_length_encoding.h"

using namespace std;

namespace run_length_encoding {
    

string encode(string text){
    string res;
    int count=0;
    char p=0;
    for(char c : text){
       if(p==c) {
            count++;
        }        
        else {
            if(p)
                res += count<=1 ? string{p} : to_string(count) + p;
            count = 1;
            p = c;           
        }
    }    
    if(p)
        res += count<=1 ? string{p} : to_string(count) + p;
    return res;
}

string decode(string data){
   int digit_count = 0;
   string res;
   for(char c: data){
       if(isdigit(c)){
            if(digit_count>0)
                digit_count = 10*digit_count + (c - '0');
            else 
                digit_count = c - '0';
        } else {
            res += c;
            for(int j=0; j<digit_count-1; j++)
                res += c;
            digit_count = 0;
        }
    }
    return res;
}


}  // namespace run_length_encoding
