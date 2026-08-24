class FlowerField {
  List<String> garden;
  
  FlowerField(this.garden);

  List<String> get annotated{
    if(this.garden.isEmpty)
      return <String>[];
    if(garden[0].length == 0)
      return <String>[''];
    var rows = garden.length;
    var cols = garden[0].length;
    var output = List.generate(rows, (r) => List.generate(cols, (c)=>'', growable : false)); 

    for(var y=0; y<rows; y++){
      for(var x=0; x<cols; x++){
        if(garden[y][x] == '*'){
          output[y][x] = '*';
        }
        else {
          int count = 0;
          for(var dx = -1; dx<=1; dx++){
            for(var dy = -1; dy<=1; dy++){
              var newX = x + dx;
              var newY = y + dy;
              if(newY >= 0 && newY < rows 
                  && newX >= 0 && newX < cols
                  && garden[newY][newX]=='*')
                                count++;
            }}
          output[y][x] = count==0 ? ' ' : count.toString(); 
        }
      }  
    }
    return output.map((row)=>row.join()).toList();
  }
}
