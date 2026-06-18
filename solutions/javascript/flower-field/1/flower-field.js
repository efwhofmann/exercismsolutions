//
const deltas = [[1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1], [1,-1]]

export const annotate = (input) => {  
  
  const numrows = input.length
  if (0 == numrows)
    return [];
  const numcols = input[0].length
  if (0==numcols)
    return input;
  let result = []
  for(let x=0; x<numrows; x++){
    let currow = ""
    for(let y=0; y<numcols; y++){        
        if(input[x][y]==' '){
          let count = 0
          for(let i=0; i<8; i++){
            let newx = x + deltas[i][0]
            let newy = y + deltas[i][1]
              if(0<=newx && newx<numrows 
                 && 0<=newy && newy<numcols){
                count += input[newx][newy] == '*' ? 1 : 0
              }            
          }
          let sum = count>0 ? count.toString() : ' '
          currow += sum
        } else if(input[x][y] == '*') {
          currow += '*'
        }      
    }
    result.push(currow)
  }
  return result
};
