unit Isogram;

{$mode ObjFPC}{$H+}

interface

function IsIsogram(const phrase : string) : boolean;

implementation

uses SysUtils;

function IsIsogram(const phrase : string) : boolean;
var 
  i, lt: integer;
  c: char;
  table : array[0..25] of boolean;
begin
  for i:=0 to 25 do
  begin
    table[i] := false;
  end;
  
  for c in phrase do
  begin
    lt := ord(c);
    if (lt < ord('A')) or ((lt>ord('Z')) and (lt<ord('a')))or (lt>ord('z')) then
      continue;
    if (lt>=ord('A')) and (lt<=ord('Z')) then
      lt:= lt - ord('A')
    else 
      lt:= lt - ord('a');  
    
    if not table[lt] then 
      table[lt] := true
    else
      exit(false);
  
  end;
  result := true;
end;

end.
