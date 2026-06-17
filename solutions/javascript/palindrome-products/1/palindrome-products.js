//
// This is only a SKELETON file for the 'Palindrome Products' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

const isPalindrome = (n) => { 
    return String(n).split('').reverse().join('')==String(n)
  }

export class Palindromes {   
  
  static generate(options) {
    if(!options)
      throw new Error("Missing both factors")
    if(!options.maxFactor)
      throw new Error("Missing maxFactor")
    if(!options.minFactor)
      throw new Error("Missing minFactor")
    if(options.minFactor>options.maxFactor)
      throw new Error("min must be <= max")
    
    let high = options.maxFactor
    let low = options.minFactor
    let smallest = {value: null, factors: []}
    let largest = {value: null, factors: []}
    for(let i=low; i<=high; i++){
      for(let j=i; j<=high; j++){
        const prod = i*j
        if (isPalindrome(prod)){
          if(smallest.value === null || prod<smallest.value){
            smallest.value = prod
            smallest.factors = [[i,j]]
          }
          else if(prod === smallest.value){
            smallest.factors.push([i,j])
          }
          if(largest.value==null || prod>largest.value){
            largest.value = prod
            largest.factors = [[i,j]]
          }
          else if(prod ===largest.value){
            largest.factors.push([i,j])
          }
        }
      }
    }
    return{smallest, largest}
  }

  

  
}
