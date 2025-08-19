pub fn translate(rna: &str) -> Option<Vec<&str>> {
    rna.as_bytes().chunks(3).map(get_amino_acid)
        .take_while(|&p| p!=Some("STOP")).collect()
}

fn get_amino_acid(codon: &[u8]) -> Option<&str> {
    match codon {
        b"AUG" => Some("Methionine"),
        b"UUU" | b"UUC" => Some("Phenylalanine"),
        b"UUA" | b"UUG" => Some("Leucine"),
        b"UCU" | b"UCC" | b"UCA" | b"UCG" => Some("Serine"),
        b"UAU" | b"UAC" => Some("Tyrosine"),
        b"UGU" | b"UGC" => Some("Cysteine"),
        b"UGG" => Some("Tryptophan"),
        b"UAA" | b"UAG" | b"UGA" => Some("STOP"),
        _ => None
    }
}