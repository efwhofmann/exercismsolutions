//
// Roman Numerals using the particular structur of the roman number system

const tens = [1000,100,10,1]
const romantens = ['M','C','X','I']
const romanfives = ['D','L','V']

export const toRoman = (number) => {
    if(number<1 || number>3999)
      throw Error('number must be postive and no larger than 3999');
    let result = ""
    for(let d=0; d<4; d++){
      let q = Math.floor(number/tens[d])
      number = number % tens[d]
      if (d==0 || q<4) 
            result += romantens[d].repeat(q)
      else if(d>=1 && q==9)
            result += romantens[d] + romantens[d-1]
      else if(d>=1 && q>=5)
            result += romanfives[d-1] + romantens[d].repeat(q-5)
      else // d>=1 && q==4
            result += romantens[d] + romanfives[d-1];
    }
  return result  
};
