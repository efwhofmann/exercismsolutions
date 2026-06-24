//
// This is only a SKELETON file for the 'Two Bucket' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

const gcd = (a,b) => (b? gcd(b, a%b) : a);

export class TwoBucket {
  constructor(buckOne, buckTwo, goal, starterBuck) {
    if(goal > Math.max(buckOne, buckTwo))
      throw new Error("Not possible");  
    else if(goal % gcd(buckOne, buckTwo) != 0)
       throw new Error("Not possible");
     this.firstB_ = buckOne;
     this.secondB_ =  buckTwo;
     this.goal_ = goal;
     this.startB_ = starterBuck;
    }
  

  extendedGcd(a, b) {
    if(b==0){
      console.log("%d!\n", a);
      return [a,1,0];}
    var [d,u1,v1] = this.extendedGcd(b, a%b);
    console.log("a,b,d: %d, %d, %d\n", a,b, d);
    return [d, v1, u1 - v1*Math.floor(a/b)];
  }
  
   solveOne(one, two) {
     if(this.goal_ == one)
       return {moves: 1,  goalBucket: 'one', otherBucket: 0};
     else if(this.goal_ == two)
       return {moves: 2, goalBucket:'two', otherBucket: one};
     
    var [d,u,v] = this.extendedGcd(one, two);
    /*if (this.goal_ % d !==0) {   
          throw new Error('Not possible');
    } */
    u *= this.goal_ / d;
    v *= this.goal_ / d;
    
     if(u<0) {
      var t =  Math.floor(-u*d/two) + 1;
      u += t*(two/d);
      v -= t*(one/d);
    }
    if (one >= this.goal_)
      return {
        moves: Math.abs(2*(u-v) -2),
        goalBucket: 'one',
        otherBucket: two,
      }; 
    else
      return {
        moves: Math.abs(2*(u-v)),
        goalBucket: 'two',
        otherBucket: 0,
    }; 
  }
 
  solve() {
    if (this.goal_==0)
         return {moves: 0, goalBucket: this.startB_, otherBucket: 0};
      
    if (this.startB_ == 'one'){
        return this.solveOne(this.firstB_, this.secondB_); 
    }
    else {
      const res = this.solveOne(this.secondB_, this.firstB_);
      return {
        moves: res.moves,
        goalBucket: res.goalBucket == 'one' ? 'two' : 'one',
        otherBucket: res.otherBucket,
        };
      }
    }

  

}
