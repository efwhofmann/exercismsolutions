use std::collections::HashSet;

fn letter_vector(word: &str)->Vec<char>{
    let mut letters: Vec<char> = word.chars().collect();
    letters.sort_unstable();
    letters
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let word_lc = word.to_lowercase();
    let word_vector = letter_vector(&word_lc);
    possible_anagrams
        .iter()
        .copied()
        .filter(|candidate| {
                let cand_lc = candidate.to_lowercase();
                cand_lc.len() == word_lc.len() &&
                cand_lc != word_lc && 
                letter_vector(&cand_lc) == word_vector
            })
        .collect()
}
