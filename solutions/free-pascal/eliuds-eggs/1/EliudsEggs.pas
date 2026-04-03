unit EliudsEggs;

{$mode ObjFPC}{$H+}

interface

function EggCount(const number : uint32) : uint8;

implementation

uses SysUtils;

function EggCount(const number : uint32) : uint8;
var 
  num : uint32;
begin
  result := 0;
  num := number;
  while num>0 do
  begin
    result := result + (num and 1);
    num := num >> 1;
  end;
end;

end.
