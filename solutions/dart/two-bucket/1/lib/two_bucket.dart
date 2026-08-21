typedef Result = ({int moves, String goalBucket, int otherBucket});

class TwoBucket {

  int capBucketOne = 0;
  int capBucketTwo = 0;
  int goalVol = 0;
  String start = '';
  
  TwoBucket({int? bucketOne, int? bucketTwo, int? goal, String? startBucket}){
    this.capBucketOne = bucketOne ?? 0;
    this.capBucketTwo = bucketTwo ?? 0;
    this.goalVol = goal ?? 0;
    this.start = startBucket ?? "one";
  }
  
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
    if(goalVol == 0)
      return (moves: 0, goalBucket: "one", otherBucket: 0);
    else if(goalVol > capBucketOne
            && goalVol > capBucketTwo)
      throw ArgumentError('goal larger than both buckets is impossible');
    if (start == "one")
      return this.measureOne(capBucketOne, capBucketTwo, goalVol);
    else {
      Result res = this.measureOne(capBucketTwo, capBucketOne, goalVol);
      if (res.goalBucket == 'one') 
        return (moves: res.moves, goalBucket: 'two', otherBucket: res.otherBucket);
      else 
        return (moves: res.moves, goalBucket: 'one', otherBucket: res.otherBucket);
    }
  }
  
}
