import 'package:collection/collection.dart';

class Allergies {   

  static final Map<String,int> allergens = 
 ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'].asMap().map((i,e)=> MapEntry(e, 1<<i));
    
  bool allergicTo(String name, int score){
    return ((allergens[name] ?? 0) & score) != 0;    
  }

  List<String> list(int score){
    return allergens.keys.where((k)=> allergicTo(k,score)).toList();
  }
}
