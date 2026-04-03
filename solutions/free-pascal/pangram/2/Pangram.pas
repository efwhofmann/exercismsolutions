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
    c:= ord(sentence[i]) or 32;
    if (c>96) and (c<123) then
    begin
      c:= c-97;
      table[c] := true;
    end;
  end;
  
  for i:=0 to 25 do
  begin
    result:= result and table[i];
  end;

end;

end.
