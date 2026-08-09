class Isogram {
  bool isIsogram(String phrase){
   var alphabet = Map<String, int>();
   bool result = true;
   var symbols = phrase.toLowerCase().split("");
   for(var s in symbols ){
     if(s=='-' || s==' ') continue;
     if(alphabet.containsKey(s)){
       result = false;
       break;
     }
     else{
       alphabet[s] = 1;
     }
   }
   return result;
  }
}
