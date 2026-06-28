// WordSearch 

class WordSearch {
  constructor(grid) {
     this.grid = grid;
  }

  findFromPosition(row,col,word){
    const directions =
                [[1,0], [1,1], [0,1], [-1,1], [-1,0],
                 [-1,-1], [0,-1], [1,-1]]; 
    for(let [h,v] of directions){
               let newRow = row
               let newCol = col
               let k=0 
               for(;newRow>=0 && newRow<this.grid.length
                  && newCol>=0 && newCol<this.grid[newRow].length
                  && this.grid[newRow][newCol] == word[k];){
                 newRow += v;
                 newCol += h; 
                 k++;
               }
              if(k==word.length) 
                 return {start:[row+1,col+1],
                         end:[newRow-v+1, newCol-h+1]};
             } 
  }

  findOne(word){
    const height = this.grid.length
    for(let row=0; row < height; row++)
        for(let col=0; col < this.grid[row].length; col++){
          if(this.grid[row][col] == word[0]){
             let res = this.findFromPosition(row,col, word);
             if(res)
               return res
            }        
          }
  }

  find(words) {
    let results = {}
    for(let word of words){
      results[word] = this.findOne(word);
    }
    return results
  }
}

export default WordSearch;
