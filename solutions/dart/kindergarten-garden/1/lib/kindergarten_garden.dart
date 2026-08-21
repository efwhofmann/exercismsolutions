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
    List<Plant> res = [];
    for(var p in patch.split('')){
      switch(p){
        case 'R': res.add(Plant.radishes);
        case 'V':res.add(Plant.violets);
        case 'C': res.add(Plant.clover);
        default: res.add(Plant.grass);
      }
    }
    return res;
  }

  List<Plant> plants(Student child){
    var stNum = child.index;
    var offset =  (diagram.length ~/2) + 2*stNum +1;
    return string2Plants(
      diagram.substring(2*stNum, 2*stNum+2) +
    diagram.substring(offset, offset+2));
  }
}
