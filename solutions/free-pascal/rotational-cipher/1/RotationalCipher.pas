unit RotationalCipher;

{$mode ObjFPC}{$H+}

interface

function rotate(const text : string; const shiftKey : shortint) : string;

implementation

uses SysUtils;

function rotate(const text : string; const shiftKey : shortint) : string;
var 
  i, l : integer;
const 
  lc_a = 97;
  uc_a = 65;
begin
  result := '';
  for i:=1 to length(text) do
  begin
    l := ord(text[i]);
    // 65-90 97-122
    if (l>64) and (l<91) then
      result := result + Chr((l - uc_a + shiftKey) mod 26 + uc_a)
    else if (l>96) and (l<123) then
      result := result + Chr((l - lc_a + shiftKey) mod 26 + lc_a)
    else
      result := result + text[i];
  end;

end;

end.
