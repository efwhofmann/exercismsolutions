#include "rna_transcription.h"

#include <map>
#include <string>

using namespace std;

namespace rna_transcription {

    map<char,char> tr = {{'G', 'C'}, {'C', 'G'}, {'A', 'U'}, {'T','A'}};

   char to_rna(char nuc){
       return tr.find(nuc)->second;
   } 
    
   string to_rna(string dna){
       string rna="";
       for(char nuc : dna){
           auto search = tr.find(nuc);
           if (search != tr.end())
               rna += search->second;
       }
       return rna;
   }

}  // namespace rna_transcription
