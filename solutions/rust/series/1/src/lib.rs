pub fn series(digits: &str, len: usize) -> Vec<String> {
    let mut res = Vec::new();
    if len<=digits.len() {
        for i in 0..(digits.len()+1-len) {
            res.push(digits[i..(i+len)].to_string())
        }
    }
    return res
}
