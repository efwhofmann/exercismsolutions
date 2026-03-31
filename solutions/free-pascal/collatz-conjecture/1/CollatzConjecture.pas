unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number : integer) : integer;

implementation

uses SysUtils;

function steps(const number : integer) : integer;
var count : integer;
var n : integer;
begin
  
  if number<=0 then
      raise Exception.Create('Only positive integers are allowed');
  n := number;
  count := 0;
  while n<>1 do
  begin
    if n mod 2 = 0 then
      n := n div 2
    else
      n := 3*n + 1;
    inc(count);
  end;
  result:=count;
end;

end.
