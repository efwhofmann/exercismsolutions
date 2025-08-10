#include "rna_transcription.h"

#include <map>
#include <string>

using namespace std;

namespace rna_transcription {

    map<char,char> tr = {{'G', 'C'}, {'C', 'G'}, {'A', 'U'}, {'T','A'}};

   char to_rna(char nuc){
        auto search = tr.find(nuc);
        return (search != tr.end()) ? search->second : ' ';
    } 
    
   string to_rna(string dna){
       string rna="";
       for(char nuc : dna){
             rna += to_rna(nuc);
       }
       return rna;
   }

}  // namespace rna_transcription
