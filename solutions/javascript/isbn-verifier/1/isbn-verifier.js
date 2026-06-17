//
// ISBN-Verifier 

export const isValid = (isbn) => {
  let digits = isbn.split('')
        .filter((d,idx) => d-'0'>=0 || d=='X' )
        .map((d,idx) => 
          {if(d=='X' && idx==9){ return 10;} 
            else return (d-'0')})
        .filter(d => !isNaN(d))
    if (digits.length == 10 && digits.length == 
        isbn.split('').filter(d => d!='-').length)
        return digits.reduce((acc, cur, idx) =>
          acc + cur*(10-idx),0) % 11 == 0;
    else 
      return false
};
