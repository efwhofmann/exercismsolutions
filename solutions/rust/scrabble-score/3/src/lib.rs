use std::collections::HashMap;

/// Compute the Scrabble score for a word.
pub fn score(word: &str) -> u64 {   
   word.to_ascii_uppercase().chars()
    .map(letter_score).sum()  
}

fn letter_score(ch : char) -> u64 {
    match ch {
        'A' | 'E' | 'I' | 'O' | 'U' | 'L' | 'N' | 'R' | 'S' | 'T' => 1,
        'D' | 'G'  => 2,
        'B' | 'C' | 'M' | 'P' => 3,
        'F' | 'H' | 'V' | 'W' | 'Y' => 4,
        'K' => 5,
        'X' | 'J' => 8,
        'Q' | 'Z' => 10,
        _ => 0,
    }
    
}
