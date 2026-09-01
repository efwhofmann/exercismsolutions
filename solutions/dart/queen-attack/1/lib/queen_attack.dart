class Queen {

  int row;
  int col;
  Queen(this.row, this.col) : assert(col>=0, 'column not positive'), assert(row>=0, 'row not positive'), assert(col<=7, 'column not on board'), assert(row<=7, 'row not on board');

  bool canAttack(Queen other){
    var dx = (this.col - other.col).abs();
    var dy = (this.row - other.row).abs();
    return (dx ==0) || (dy == 0) || (dx == dy);
  }  
}
