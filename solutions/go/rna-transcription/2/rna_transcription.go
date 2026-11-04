package rnatranscription

import "strings"

var DNAtoRNA = map[string]string {
    "A" : "U",  "C" : "G", "G" : "C", "T" : "A",}

func ToRNA(dna string) string {    
    var rna strings.Builder
	for _, n := range strings.Split(dna, "") {
        r_nuc, valid := DNAtoRNA[n]
        if !valid {
            break
        }
        rna.WriteString(r_nuc)        
    }
    return rna.String()
}
