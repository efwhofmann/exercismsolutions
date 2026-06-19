//
// This is only a SKELETON file for the 'Protein Translation' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

 const peptideMap = {
  "AUG": "Methionine",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine",
  "UAU": "Tyrosine",
  "UAC": "Tyrosine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UGG": "Tryptophan",
  "UAA": "STOP",
  "UAG": "STOP",
  "UGA": "STOP"
 };
  

export const translate = (sequence) => {
  let res =  []
  if(sequence==undefined)
    return res
  for(let i=0; i<sequence.length; i+=3){
    let nuc = sequence.substring(i,i+3)
    let amino = peptideMap[nuc]
    if(amino==undefined)
      throw new Error("Invalid codon");
    if(amino=="STOP")
      break;
    res.push(amino)
  }
  return res
};
