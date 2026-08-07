class Hamming {
  int distance(String a, String b){
    if(a.length != b.length){
      throw ArgumentError('strands must be of equal length');
    }
    int dist = 0;
    for(var i=0; i<a.length; i++){
      dist += a[i]==b[i] ? 0 : 1;
    }
    return dist;
  }
}
