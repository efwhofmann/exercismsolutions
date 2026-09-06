class GradeSchool {
  Map<String, int> myRoster =  {};

  List<bool> add(List<(String, int)> students){
    var result = <bool>[];
    students.forEach((kv){
      if(!myRoster.containsKey(kv.$1)){
        myRoster[kv.$1] = kv.$2; 
        result.add(true);
      }
      else result.add(false);      
    });
    return result;
  }

  List<String> grade(int g) =>  
   myRoster.entries
      .where((e)=>e.value == g)
      .map((e)=>e.key).toList()..sort();

   List<String> roster() => 
    (myRoster.values.toSet().toList()..sort())
     .map((n) => grade(n))
     .fold(<String>[], (v,e) => v + e);
 
}
