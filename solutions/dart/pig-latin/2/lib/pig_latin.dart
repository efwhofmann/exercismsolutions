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
      var consonants = RegExp(r"^(?<move>sch|thr|[^aeiou]qu|ch|qu|rh|th|[^aeiuo])(?<keep>\w*)");
      if(vowels.hasMatch(word))
        return word + 'ay';
      if(consonants.hasMatch(word)){
          var match = consonants.firstMatch(word)!;
          return match.namedGroup('keep')! 
            + match.namedGroup('move')! + 'ay';
        }
      return word;
    }
  

