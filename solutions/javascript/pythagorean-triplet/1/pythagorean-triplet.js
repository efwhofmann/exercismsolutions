//
// pythagorean triplets 
//

export function triplets({ minFactor, maxFactor, sum }) {
  let res = []
  const [min, max] = [minFactor ?? 1, maxFactor ?? sum/2]
  for (let a=min; a<sum/3; a++){
    let numerator = a*a + (sum-a)*(sum-a)
    let denominator = 2*(sum-a)
    if(0==numerator%denominator){
      let c = numerator/denominator
      let b = sum - a - c
      if(b>a && c<=max)
        res.push(new Triplet(a,b,c))
    }
  }
  return res  
}

class Triplet {
  constructor(a, b, c) {
    this.triplet = [a,b,c]
  }

  isPythagorean(){
    const [a,b,c] = this.triplet
    return a<b && b<c && a*a + b*b == c*c
  }

  toArray() {
   return this.triplet
  }
}
