enum Plant {
  radishes,
  clover,
  violets,
  grass,
}

enum Student {
  Alice,
  Bob,
  Charlie,
  David,
  Eve,
  Fred,
  Ginny,
  Harriet,
  Ileana,
  Joseph,
  Kincaid,
  Larry,
}

class KindergartenGarden {
  String diagram;

  KindergartenGarden(this.diagram);

  List<Plant> string2Plants(String patch){  
    return patch.split('').map((p)=>
      switch(p){
        'R' => Plant.radishes,
        'V' => Plant.violets,
        'C' => Plant.clover,
        'G' => Plant.grass,
        _ => throw ArgumentError('Unknown plant'),
      }).toList();
  }

  List<Plant> plants(Student child){
    var stNum = child.index;
    var offset =  (diagram.length ~/2) + 2*stNum +1;
    return string2Plants(
      diagram.substring(2*stNum, 2*stNum+2) +
    diagram.substring(offset, offset+2));
  }
}
