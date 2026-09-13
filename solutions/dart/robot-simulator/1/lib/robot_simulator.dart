import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';


class Robot {

  Position position;
  Orientation orientation;

  Robot(this.position, this.orientation);


  void advance(){
    switch(orientation){
      case Orientation.east : position.x += 1;
      case Orientation.west : position.x -= 1;  
      case Orientation.north : position.y += 1;
      case Orientation.south : position.y -= 1;
    }
  }

  void turnLeft(){
    switch(orientation){
      case Orientation.north : orientation = Orientation.west;
      case Orientation.west :orientation = Orientation.south;
      case Orientation.south : orientation = Orientation.east;
      case Orientation.east : orientation = Orientation.north;
    }
  }

  void turnRight(){
    switch(orientation){
      case Orientation.north : orientation = Orientation.east;
      case Orientation.west : orientation = Orientation.north;
      case Orientation.south : orientation = Orientation.west;
      case Orientation.east : orientation = Orientation.south;
    }
  }

  
  void singleInstruction(String instruction){
    switch(instruction){
      case 'R' : turnRight();
      case 'L' : turnLeft();
      case 'A' : advance();
      default : throw ArgumentError('invalid instruction');        }    
  }
  
  void move(String instructions){
    for(var s in instructions.split('')){
      singleInstruction(s);
    }    
  }
  
}
