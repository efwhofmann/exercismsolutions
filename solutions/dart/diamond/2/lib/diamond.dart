class Diamond {
  List<String> rows(String a){
    final aa = 'A'.codeUnitAt(0);
    int idx = a.toUpperCase().codeUnitAt(0)- aa;
    int nr = 2*idx + 1;
    var diamond = List.generate(idx+1, (r) =>
         List.generate(nr, (c) {if(r==0 && c==idx)
                  return 'A';
              else if (c == idx-r || c==idx+r)
                   return String.fromCharCode(r + aa);
              else
                 return ' ';}).join(''));
    var mirrored = diamond.sublist(0,idx)
      .reversed.toList();
    return diamond + mirrored;
  }
 }
