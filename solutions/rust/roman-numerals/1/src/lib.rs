use std::fmt::{Display, Formatter, Result};

pub struct Roman{
    roman: String,
}

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {
        write!(_f,"{}", self.roman)
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        const tens : [u32; 4] = [1000,100,10,1];
        const romanTens : [&str; 4] = ["M","C","X","I"];
        const romanFives : [&str; 3] = ["D","L","V"];
        let  mut number = num;
        let mut s = String::from("");
        for d in 0..4 {
            let q = number/tens[d];
            number = number % tens[d];
            if d==0 || q<4 {
                s.push_str(&romanTens[d]
                           .repeat(q.try_into().unwrap()))
            } 
            else if d>=1 && q==9 {
                s.push_str(romanTens[d]);
                s.push_str(romanTens[d-1])
            }
            else if d>=1 && q>=5 {
                s.push_str(romanFives[d-1]);
                s.push_str(&romanTens[d]
                           .repeat((q-5)
                            .try_into().unwrap()))
            }
            else {
                s.push_str(romanTens[d]);
                s.push_str(romanFives[d-1])
            }   
        }
        Roman { roman : s}
    }
}
