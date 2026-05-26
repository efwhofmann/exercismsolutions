unit LineUp;

{$mode ObjFPC}{$H+}

interface

function FormatMessage(
  const name : ShortString; const number : byte
) : ShortString;

implementation

uses SysUtils;

function FormatMessage(
  const name : ShortString; const number : byte
) : ShortString;
var 
  lastDigit, lastTwo : byte;
  numberStr : string;
begin
  lastDigit := number mod 10;
  lastTwo := number mod 100;
  numberstr:= IntToStr(number);
  if (lastTwo = 11) or (lastTwo = 12) or (lastTwo = 13) then
  begin
    numberStr += 'th';
  end
  else
  begin
    case lastDigit of 
      1 : numberStr += 'st';
      2 : numberStr += 'nd';
      3 : numberStr += 'rd';
      0,4..9 : numberStr += 'th';
    end;
  end;  
  result := name + ', you are the ' + numberStr + ' customer we serve today. Thank you!'
end;

end.
