unit Isogram;

{$mode ObjFPC}{$H+}

interface

function IsIsogram(const phrase : string) : boolean;

implementation

uses SysUtils;

function IsIsogram(const phrase : string) : boolean;
var 
  i, c : integer;
  table : array[0..25] of boolean;
begin
  for i:=0 to 25 do
  begin
    table[i] := false;
  end;
  
  for i:=1 to length(phrase) do
  begin
    c := ord(phrase[i]);
    if (c<65) or ((c>90) and (c<97)) or (c>122) then
      continue;
    if (c>=65) and (c<=90) then
      c:= c - 65
    else 
      c:= c - 97;  
    
    if not table[c] then 
      table[c] := true
    else
      exit(false);
  
  end;
  result := true;
end;

end.
