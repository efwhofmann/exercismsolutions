unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses SysUtils, Math;

function IsArmstrongNumber(const number: qword) : boolean;
var 
  numstr : string;
  c : char;
  len, sum : integer;
begin
  numstr := IntToStr(number);
  len := length(numstr);
  sum := 0;
  for c in numstr do
    sum := sum + round(intpower(StrToInt(c), len));
  result:= (sum = number);
end;

end.
