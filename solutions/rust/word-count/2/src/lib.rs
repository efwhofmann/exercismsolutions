use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    let mut result = HashMap::new(); 
    let allwords : Vec<String> = words.to_lowercase()
        .split(|c : char| !c.is_alphanumeric() && c!='\'')
        .map(|w| w.trim_matches('\''))
        .filter(|w| !w.is_empty())
        .map(|s| s.to_string())
        .collect();
    for word in allwords {
        result.entry(word)
            .and_modify(|e| *e+=1).or_insert(1);
    }
    result
}
