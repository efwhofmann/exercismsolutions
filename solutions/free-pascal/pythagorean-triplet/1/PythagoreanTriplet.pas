unit PythagoreanTriplet;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray   = Array Of Integer;
  TIntArray2D = Array Of Array Of Integer;

function tripletsWithSum(const n : Integer) : TIntArray2D;

implementation

uses SysUtils;

function tripletsWithSum(const n : Integer) : TIntArray2D;
var a,b,c: integer;
    current: TIntArray;
begin
  result := [];
  for a:=3 to (n div 3) do
    for b:=(a+1) to ((n-a) div 2) do
      begin 
        c:= n - a -b;
        if a*a + b*b = c*c then
        begin
          current := [a,b,c];
          insert(current, result, length(result));
        end;
      end;

end;

end.
