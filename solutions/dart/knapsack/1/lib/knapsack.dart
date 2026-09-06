typedef Item = ({int weight, int value});

class Knapsack {

  int _maxWeight = 0;

  Knapsack({int maxWeight=0}){
    this._maxWeight = maxWeight;
    }
  
  int maxValue(List<Item> items){
    List<List<int>> table = List.generate(items.length + 1, (_) => (List.generate(_maxWeight +1, (_)=>0)));
    for(var i=0; i<items.length; i++){
      Item curItem = items[i];
      for(var capacity=1; capacity <= _maxWeight; capacity++){
         int prevItemValue = table[i][capacity];
         if(capacity >= curItem.weight) {
          int newValue = table[i][capacity-curItem.weight] + 
            curItem.value;
          table[i+1][capacity] = 
                newValue > prevItemValue ? 
                  newValue : prevItemValue;
            } 
          else {
                table[i+1][capacity] = prevItemValue;
            }
      }
    }
    return table[items.length][_maxWeight];
  }
}
