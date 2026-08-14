class Etl {
   Map<String, int> transform(Map<String, List<String>> legacy){
     Map<String, int> result = {};
     legacy.forEach((score, letters) {
       int value = int.parse(score);
       for(var lt in letters){
          result.addAll({lt.toLowerCase(): value});
       }
     });
     return result;
   }
}
