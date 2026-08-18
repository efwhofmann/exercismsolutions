class MatchingBrackets {
  bool isPaired(String text){
    List<String> brackets = [];
    for(var s in text.split('')){
      if(s == '(' || s == '{' || s=='[')
        brackets.add(s);
      else if (s== ')' || s==']' || s=='}'){
        if(brackets.length>0 && matches(brackets.last,s)){
          brackets.removeLast();
        } else 
          return false;
      }             
    }
    return brackets.length==0;
  }

  bool matches(String l, String r){
    return (l=='(' && r == ')') || (l=='[' && r == ']')
      || (l=='{' && r == '}');
  }
}
