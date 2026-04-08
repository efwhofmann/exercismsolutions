unit RunLengthEncoding;

{$mode ObjFPC}{$H+}

interface

function encode(const AString : string) : string;
function decode(const AString : string) : string;

implementation

uses SysUtils, Math;



function encode(const AString : string) : string;
var 
  ch: char; 
  count,i : integer;
begin
  result := '';
  count := 0;

  for i:=low(AString) to high(AString) do
  begin

    ch:=AString[i];
    inc(count);
    if (i=high(AString)) or (ch<>AString[i+1]) then
    begin
      if count>1 then
        result:= result + IntToStr(count);
      
      result:= result + ch;
      count:=0;
    end;
  end;
end;

function decode(const AString : string) : string;
var 
  digitCount, i : integer;
  ch : char;
begin
  result := '';
  digitCount := 0;
  for ch in AString do
  begin
    if (ord('0')<=ord(ch)) and (ord(ch)<=ord('9')) then
      begin
        if digitCount>0 then
          digitCount := 10*digitCount + (ord(ch) - ord('0'))
        else
          digitCount := ord(ch) - ord('0');
      end
    else
      begin
        for i:=0 to max(0, digitCount-1) do
        begin
          result := result + ch;
        end;
        digitCount:=0;
      end;
  end;

end;

end.
