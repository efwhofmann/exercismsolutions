class Diamond {
  List<String> rows(String a){
    final aa = 'A'.codeUnitAt(0);
    int idx = a.toUpperCase().codeUnitAt(0)- aa;

    List<String> diamond = [];
    for(var i=0; i<=idx; i++){
      String current = '';
      
      for(var k=0; k<2*idx + 1; k++){    
        if(i==0 && k==idx){
          current += 'A';
        }
        else if(k==idx-i || k==idx+i)
          current += String.fromCharCode(i + aa);
        else
          current += ' ';
      }
      diamond.add(current);         
    }
    for(var i=idx-1; i>=0; i--){
      diamond.add(diamond[i]);
    }
    return diamond;
  }
 }
