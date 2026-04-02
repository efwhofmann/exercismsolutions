unit AtbashCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string) : string;
function decode(const phrase : string) : string;

implementation

uses SysUtils;

function cipher(const phrase: string) : string;
var 
  lc_phrase : string;
  c : char;
begin
  result := '';
  lc_phrase := LowerCase(phrase);
  for c in lc_phrase do
  begin
    if (c>='0') and (c<='9') then
      result := result + c
    else if (c>='a') and (c<='z') then
      result := result + Chr(ord('z') - (ord(c) - ord('a')));
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
