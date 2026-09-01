class EggCounter {
  int count(int pos){
    int sum = 0;
    while(pos>0){
      sum += pos & 1;
      pos >>=1;
    }
    return sum;
  }
}
