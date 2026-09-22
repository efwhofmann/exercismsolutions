enum Intent{Silence, Question, Yelling, YellQuestion, AllElse}

class Bob {
  static final List<String> responses = [
        "Sure.", "Whoa, chill out!", "Calm down, I know what I'm doing!",  "Fine. Be that way!", "Whatever." ];

  bool is_question(String input) {
         String str = input.replaceAll(
           RegExp(r'\s+'),'');
        return str[str.length-1] == '?';
    }

   bool is_yelling(String input){
        final lower = RegExp(r'[a-z]');
        final upper = RegExp(r'[A-Z]');
     
        return !lower.hasMatch(input) 
          && upper.hasMatch(input);
   }

  bool is_silence(String input){
    return !RegExp(r'\S').hasMatch(input);
  }

  Intent classify(String input){
    if(is_silence(input))
      return Intent.Silence;
    var isQ = is_question(input);
    var isY = is_yelling(input);
    if(isQ && isY)
      return Intent.YellQuestion;
    else if(isQ)
      return Intent.Question;
    else if(isY)
      return Intent.Yelling;
    else
      return Intent.AllElse;    
  }

  String response(String input){
    String res = '';
    switch(classify(input)){
      case Intent.Silence : res = 'Fine. Be that way!';
      case Intent.Question : res = 'Sure.';
      case Intent.YellQuestion : res = "Calm down, I know what I'm doing!";
      case Intent.Yelling : res = 'Whoa, chill out!';
      default : res = 'Whatever.';
   }
    return res;
  }
  
}
