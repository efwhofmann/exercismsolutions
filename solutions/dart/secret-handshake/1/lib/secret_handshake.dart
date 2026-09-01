class SecretHandshake {
  List<String> commands(int code){
    List<String> actions = ["wink", "double blink", "close your eyes", "jump"];
    List<String> result = [];
    var test = 1;
    for(int i=0; i<4; i++){
      if(code & test != 0)
        result.add(actions[i]);
      test<<=1;
    }
    if(code & test != 0)
      result = result.reversed.toList();
    return result;
  }
}
