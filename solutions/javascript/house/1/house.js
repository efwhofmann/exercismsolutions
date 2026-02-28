export class House {   
  
  static verse(num) {    
     const objects = ["the house that Jack built.", "the malt", "the rat", "the cat", "the dog", "the cow with the crumpled horn", "the maiden all forlorn", "the man all tattered and torn", "the priest all shaven and shorn", "the rooster that crowed in the morn", "the farmer sowing his corn","the horse and the hound and the horn"];

    const verbs = ["that lay in", "that ate", "that killed", "that worried", "that tossed", "that milked", "that kissed", "that married", "that woke", "that kept", "that belonged to"];

    const intro = "This is ";
    var res = [intro + objects[num-1]];
    if (num>1) {
      for(var idx=num-1; idx>0; idx--){
        let str = verbs[idx-1] + " " + objects[idx-1];
        res.push(str);
      }
    }
    return res;  
  }

  static verses(first, last) {
    let out=[];
    for(var n = first; n<=last; n++){
        out = out.concat(this.verse(n));
        if (n<last) {
          out.push('');
        }
    }
    return out;    
  }
}
