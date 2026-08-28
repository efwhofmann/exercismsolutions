    String translate(String english){
     String pig = '';
     List<String> words = 
       RegExp(r"\w+").allMatches(english)
        .map((m) => m.group(0)).nonNulls.toList();
     for(var w in words){
        pig += piggifyWord(w) + ' ';
      }
      if(pig[pig.length-1]==' ')
        pig = pig.substring(0,pig.length-1);
      return pig;
    }

    String piggifyWord(String word){
      var vowels = RegExp(r"(^([aeiou]|yt|xr)(\w*))");
      List<String> consonantPatterns = [
            r"^(?<move>sch|thr|[^aeiou]qu|ch|qu|rh|th|[^aeiuo])(?<keep>\w*)"];
      // r"((?<move>[^aeiou]*[q][u])(?<keep>w*))",
           // r"((?<move>[th|^aeiouy]+)(?<keep>y\w*))", 
           // r"((?<move>[^aeiou]+)(?<keep>[aeiou]\w*))"];
      if(vowels.hasMatch(word))
        return word + 'ay';
      for(var pat in consonantPatterns){
        var regE = RegExp(pat);
        if(regE.hasMatch(word))
        {
          var match = regE.firstMatch(word)!;
           var toEnd = match.namedGroup('move')!;
           var remains = match.namedGroup('keep')!; 
          return  remains + toEnd  + 'ay';
        }
      }
      return word;
    }
  

