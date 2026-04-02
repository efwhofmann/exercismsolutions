unit AtbashCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string) : string;
function decode(const phrase : string) : string;

implementation

uses SysUtils;

function cipher(const phrase: string) : string;
var 
  i,l  : integer;
  lc : string;
begin
  result := '';
  lc := LowerCase(phrase);
  for i:=1 to Length(phrase) do
  begin
    l:= ord(lc[i]);
    if (48<=l) and (l<=57) then
      result := result + lc[i]
    else if (l>=97) and (l<=122) then
      result := result + Chr(122 - (l -97));
  end;    
end;

function encode(const phrase : string) : string;
var
  idx, max : integer;
begin
  result := cipher(phrase);
  
  idx:=6;  
  max:= length(result) + (length(result) div 5);
  while idx<max do
  begin
    Insert(' ', result, idx);
    idx:=idx+6;
  end;
end;

function decode(const phrase : string) : string;
begin
 result := cipher(phrase);
end;

end.
