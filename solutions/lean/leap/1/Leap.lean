namespace Leap

def leapYear (year : UInt16) : Bool :=
  (year % 4 == 0) && ((year %16 = 0) || (year % 25 !=0)) 

end Leap
