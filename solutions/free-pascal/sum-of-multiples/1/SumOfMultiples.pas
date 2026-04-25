unit SumOfMultiples;

{$mode ObjFPC}{$H+}

interface

function sum(const factors : Array Of Integer; const limit : integer) : integer;

implementation

uses SysUtils;

function sum(const factors : Array Of Integer; const limit : integer) : integer;
var n,f : integer;
begin
result := 0;
for n:=1 to limit-1 do
begin
  for f in factors do
  begin
    if f=0 then
      continue;
    if n mod f = 0 then
    begin
      result += n;
      break;
    end;
  end;
end;

end;

end.
