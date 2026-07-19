#include "protein_translation.h"

#include <vector>
#include <string>
#include <map>
#include <stdexcept>

using std::string;

namespace protein_translation {

    std::map<string,string> amino_map = {
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
    

    std::vector<string> proteins(string rna) {
            std::vector<string> polypeptid;
            for(int i=0; i<=static_cast<int>(rna.length()-3); i+=3){
                string codon = rna.substr(i,3);
                auto search = amino_map.find(codon);
                if(search!=amino_map.end()){
                    if(search->second == "STOP")
                        break;
                    else
                        polypeptid.push_back(search->second);
                } 
                else 
                    throw std::invalid_argument("Invalid codon "
                        + codon);
            }
        return polypeptid;
    }

}  // namespace protein_translation
