//
// Nucleotid count

export function countNucleotides(strand) {
  let count = {'A':0, 'C':0, 'G':0, 'T':0};
  strand.split('').forEach(n => {if(!isNaN(count[n])){count[n] = count[n] + 1} else throw Error("Invalid nucleotide in strand")});
  return count['A'].toString() + ' '  + count['C'].toString() + ' ' + count['G'].toString() + ' ' + count['T'].toString();
}
