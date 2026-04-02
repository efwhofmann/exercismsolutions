unit ResistorColorDuo;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function value(const colors : TStrArray) : int8;

implementation

uses SysUtils;

function colorVal(color : string) : int8;
var 
  colors : TStrArray;
  i : integer;
begin
  colors := ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];
  
  for i:=0 to 9 do
  begin
    if colors[i] = color then
      exit(i);
  end;
end;



function value(const colors : TStrArray) : int8;
var 
  c1, c2 : integer;
begin
  c1 := colorVal(colors[0]);
  c2 := colorVal(colors[1]);
  result := 10*c1 + c2;
end;

end.
