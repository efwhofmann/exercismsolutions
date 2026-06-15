//
// matching brackets
/* isPaired returns true or false depending on whetcher brackets, braces or parenthesis are pair in the expression passed as an argument*/

const matches = (left, right) => {
    return (left=='(' && right==')') || 
          (left=='[' && right==']') ||
          (left=='{' && right=='}');
}

export const isPaired = (expression) => {
  let lifo = [];
  for(let symbol of expression){
    if(symbol=='('||symbol=='['||symbol=='{')
      lifo.push(symbol);
    if(symbol==')'||symbol==']'||symbol=='}'){
       if(0==lifo.length)
         return false;
       if (!matches(lifo.pop(),symbol))
         return false;      
    }    
  }
  return (0==lifo.length);    
};
