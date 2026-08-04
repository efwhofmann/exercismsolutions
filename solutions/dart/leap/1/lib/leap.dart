class Leap {
  bool leapYear(int year){
    return (year % 4 == 0) && (year % 25!=0 || year & 15 == 0);
  }
}
