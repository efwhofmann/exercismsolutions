class RunLengthEncoder {
  String encode(String input){
    return input.replaceAllMapped(RegExp(r'(.)\1+'),
                   (Match m) => 
                    "${m[0]!.length}${m[1]!}");
  }

  String decode(String input){
    return input.replaceAllMapped(RegExp(r'(\d+)(.)' ),
                   (Match m) =>  
                    m[2]!* int.parse(m[1]!));
  }
}
