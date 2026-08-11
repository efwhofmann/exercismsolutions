class PascalsTriangle {
  List<List<int>> rows(int n){
    if (n<=0)
      return <List<int>>[];
    List<List<int>> pascal = [<int>[1]];
    for(var r=1; r<n; r++){
      List<int> current = [];
      for(var k=0; k<=r; k++){
        int rkCoeff;
        if(k==0 || k==r)
          rkCoeff = 1;
        else
          rkCoeff = pascal[r-1][k-1] + pascal[r-1][k];
        current.add(rkCoeff);
      }
      pascal.add(current);
    }
    return pascal;
  }
}
