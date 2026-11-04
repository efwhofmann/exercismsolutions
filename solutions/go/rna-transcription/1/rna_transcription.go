package rnatranscription

import "strings"

func ToRNA(dna string) string {
    DNAtoRNA := map[string]string{
    "A" : "U",  "C" : "G", "G" : "C", "T" : "A",}
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
