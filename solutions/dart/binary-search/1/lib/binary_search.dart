import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  late List<int> _data;

  BinarySearch(List<int> data){
    _data = List.from(data);
  }

  int find(int value){
    var left=0;
    var right=_data.length-1;
    while(left<=right){
      var mid = (left + right)~/2;
      if(_data[mid] == value)
        return mid;
      else if(_data[mid]>value)
        right = mid-1;
      else
        left = mid+1;
    }
    throw ValueNotFoundException("not found");
  }
}
