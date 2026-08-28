    String translate(String english){ 
       return RegExp(r"\w+").allMatches(english)
        .map((m) => m.group(0))
        .nonNulls.toList()
        .map((word) => piggifyWord(word))
        .join(' ');
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
  

