unit SquareRoot;

{$mode ObjFPC}{$H+}

interface

function SquareRoot(const n : integer) : integer;

implementation

uses SysUtils, Math;

function SquareRoot(const n : integer) : integer;
var 
  x: double;
begin
  x := 0.75*n;
  while floor(x)*floor(x)<>n do
  begin
    x:= 0.5*(x + n/x);
  end;
  result:= floor(x);
end;

end.
