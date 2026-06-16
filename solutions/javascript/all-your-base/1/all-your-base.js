//
// all your base #13


const to_value = (digits, base) => {
  let val = 0
  digits.forEach(d => {val = d + val*base})
  return val       
}

const new_digits = (number, base) => {
  let result = []
  while(number>0) {
    result.push(number % base)
    number = Math.floor(number/base)
  }
  return result.reverse()
}

export const convert = (digits, inbase, outbase) => {
  if(inbase<2)
    throw new Error('Wrong input base')
  if(outbase<2)
    throw new Error('Wrong output base')
  if(digits.length == 0  || (digits[0]==0 && digits.length>1) || !(digits.every(d => d>=0)) || !digits.every(d => d<inbase))  
    throw new Error('Input has wrong format')
  if(digits[0] == 0)
    return [0]
  return new_digits(to_value(digits, inbase), outbase)  
};
