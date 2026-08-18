class Pangram {
  bool isPangram(String phrase){
    final letters = RegExp(r"[a-z]");
    return Set.from(
      letters.allMatches(phrase.toLowerCase())
      .map((m) => m.group(0))
      .nonNulls).length == 26;
  }
}
