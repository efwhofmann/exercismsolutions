#include "beer_song.h"

#include <string>
using namespace std;

namespace beer_song {

string container(int n, bool capital=false){
    if (!n)
       return  capital ?   "No more bottles " :  "no more bottles ";
    else
        return to_string(n) + ((n>1) ? " bottles " : " bottle ");
}

string verse(int n){
    string line1, line2;
    line1 = container(n,true) + "of beer on the wall, " + container(n,false) +
        "of beer.\n";
    if(n) {          
        string one_of_em = (n>1 ? "one" : "it");
        line2 = "Take " + one_of_em + " down and pass it around, " +                         container(n-1) + "of beer on the wall.\n";
    } else {
          line2 = "Go to the store and buy some more, " + container(99) + 
              "of beer on the wall.\n";
    }
    return line1 + line2;    
}

string sing(int from, int to){
    string song;
    for (int i = from; i >= to; i--){
        song = song + verse(i);
        if(i>to) 
           song.push_back('\n');
    }  
    return song;
}

}  // namespace beer_song
