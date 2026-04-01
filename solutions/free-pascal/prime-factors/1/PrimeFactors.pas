unit PrimeFactors;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function factors(
  const value   : integer
) : TIntArray;

implementation

uses SysUtils;

function factors(
  const value   : integer
) : TIntArray;
var
  num, k : integer;
begin
  num := value;
  result := [];
  for k:=2 to Round(sqrt(num)) do
  begin
    while num mod k = 0 do
    begin
      insert(k, result, length(result));      
      num := num div k;
    end;
    if num=1 then
      break;
  end;
if num>1 then
  insert(num, result, length(result)); 
end;

end.
