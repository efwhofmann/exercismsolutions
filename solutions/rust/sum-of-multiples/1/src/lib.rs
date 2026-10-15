use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut multiples =  HashSet::new();
    let mut sum = 0;
    for f in factors.iter() {
        let mut m=*f;
        while m!=0 && m<limit {
         if !multiples.contains(&m) {
            sum += m; 
             multiples.insert(m);
         }
         m += *f
        }
    }
    sum
}
