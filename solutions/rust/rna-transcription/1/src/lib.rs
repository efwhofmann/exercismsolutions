use std::collections::HashSet;

#[derive(Debug, PartialEq, Eq)]
pub struct Dna {
    nucleotides : String
}

#[derive(Debug, PartialEq, Eq)]
pub struct Rna {
    nucleotides : String
}


fn validate( s: &str, nucleotide_string : &str) -> Result<String, usize>{
    let nucleotide_set :  HashSet<char> = nucleotide_string.chars().collect();
    match s.chars().position(|c| !nucleotide_set.contains(&c)) {
        Some(p) => Err(p),
        None => Ok(s.to_string())
    }
}

fn transcribe(c : char) -> char {
    match c {
        'A' => 'U',
        'T' => 'A',
        'G' => 'C',
        'C' => 'G',
        _ => unreachable!(),
    }
    
}

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        validate(dna, "ATCG").map(|nucleotides| Dna{nucleotides})
    }

    pub fn into_rna(self) -> Rna {
        Rna{nucleotides : self.nucleotides.chars().map(transcribe).collect()}
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        validate(rna, "AUCG").map(|nucleotides| Rna{nucleotides})
    }
}
