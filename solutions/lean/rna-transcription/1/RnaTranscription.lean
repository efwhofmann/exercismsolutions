namespace RnaTranscription

def complement (nuc : Char) : Char:=
  match nuc with
  | 'A' => 'U'
  | 'C' => 'G'
  | 'G' => 'C'
  | 'T' => 'A'
  | _ => nuc

def toRna (dna : String) : String :=
  String.map complement dna

end RnaTranscription
