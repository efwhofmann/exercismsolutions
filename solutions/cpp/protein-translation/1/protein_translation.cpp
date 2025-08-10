#include "protein_translation.h"

#include <vector>
#include <string>
#include <map>

using namespace std;

namespace protein_translation {

    map<string,string> amino_map = {
        {"AUG", "Methionine"},
        {"UUU", "Phenylalanine"},
        {"UUC", "Phenylalanine"},
        {"UUA", "Leucine"},
        {"UUG", "Leucine"},
        {"UCU", "Serine"},
        {"UCC", "Serine"},
        {"UCA", "Serine"},
        {"UCG", "Serine"},
        {"UAU", "Tyrosine"},
        {"UAC", "Tyrosine"},
        {"UGU", "Cysteine"},
        {"UGC", "Cysteine"},
        {"UGG", "Tryptophan"},
        {"UAA", "STOP"},
        {"UAG", "STOP"},
        {"UGA", "STOP"}    
    };
    

    vector<string> proteins(string rna) {
            vector<string> result;
            for(int i=0; i<=static_cast<int>(rna.length()-3); i+=3){
                string codon = rna.substr(i,3);
                auto search = amino_map.find(codon);
                if(search!=amino_map.end()){
                    if(search->second == "STOP")
                        break;
                    else
                        result.push_back(search->second);
                } 
            }
        return result;
    }

}  // namespace protein_translation
