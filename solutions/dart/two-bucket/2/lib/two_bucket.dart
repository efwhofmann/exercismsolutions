typedef Result = ({int moves, String goalBucket, int otherBucket});

class TwoBucket {

  int bucketOne = 0;
  int bucketTwo = 0;
  int goal = 0;
  String startBucket = '';
  
  TwoBucket({required this.bucketOne, required this.bucketTwo, required this.goal, required this.startBucket});
  
  List<int> gcdx(int a, int b){
    var res = List<int>.filled(3,0);
    if(b==0){
      res[0] = a; res[1] = 1; res[2] = 0;
    }
    else{
      res = gcdx(b, a%b);
      var u1 = res[2];
      res[2] = res[1] - res[2]*(a~/b);
      res[1] = u1;
    }
    return res;      
  }

  Result measureOne(int capBucket1, int capBucket2, int targetVol){
    if (targetVol == capBucket1)
      return (moves: 1, goalBucket: "one", otherBucket: 0);
    else if (targetVol == capBucket2)
      return (moves:2, goalBucket:"two", otherBucket:capBucket1);
    var gcd = gcdx(capBucket1, capBucket2);
    if(targetVol % gcd[0] !=0 )
      throw ArgumentError('impossible goal');
    int u = gcd[1] * (targetVol ~/ gcd[0]);
    int v = gcd[2] * (targetVol ~/ gcd[0]);
    if(u<0){
       int t = -u*gcd[0]~/capBucket2 + 1;
        u += (capBucket2~/gcd[0])*t;
        v -= (capBucket1~/gcd[0])*t;
    }
    if(capBucket1 > targetVol)
      return (moves: 2*(u-v)-2, goalBucket: "one", otherBucket: capBucket2);
    else
      return (moves: 2*(u-v), goalBucket: "two", otherBucket: 0);    
  }

  Result measure(){
    if(goal == 0)
      return (moves: 0, goalBucket: "one", otherBucket: 0);
    else if(goal > bucketOne
            && goal > bucketTwo)
      throw ArgumentError('goal larger than both buckets is impossible');
    if (startBucket == "one")
      return this.measureOne(bucketOne, bucketTwo, goal);
    else {
      Result res = this.measureOne(bucketTwo, bucketOne, goal);
      if (res.goalBucket == 'one') 
        return (moves: res.moves, goalBucket: 'two', otherBucket: res.otherBucket);
      else 
        return (moves: res.moves, goalBucket: 'one', otherBucket: res.otherBucket);
    }
  }
  
}
