unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence : string) : boolean;

implementation

uses SysUtils;

function IsPangram(const sentence : string) : boolean;
var 
  i: integer;
  c: integer;
  table: array[0..25] of boolean;  
begin
  for i:=0 to 25 do
  begin
    table[i]:=false;
  end;
 
  result:= true;
  for i:=1 to length(sentence) do
  begin
    c:= ord(sentence[i]);
    if (c>64) and (c<91) then
      c:= c-65
    else if (c>96) and (c<123) then
      c:= c-97
    else
      continue;
    table[c] := true;
  end;
  
  for i:=0 to 25 do
  begin
    result:= result and table[i];
  end;

end;

end.
