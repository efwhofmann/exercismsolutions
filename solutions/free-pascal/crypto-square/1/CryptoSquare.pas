unit CryptoSquare;

{$mode ObjFPC}{$H+}

interface

function ciphertext(const plaintext : string) : string;

implementation

uses SysUtils, Math;

function LowerCaps(const ch : char) : char;
begin
  if (ch>='A') and (ch<='Z') then
    result := Chr(ord(ch) - ord('A') + ord('a'))
  else
    result := ch;
end;

function ciphertext(const plaintext : string) : string;
var 
  c : char;
  buffer : string;
  len, cols, rows, padding : integer;
  i,j,idx : integer;
begin
  buffer := '';
  for c in plaintext do
  begin
    if ((c>='a') and (c<='z')) or 
      ((c>='A') and (c<='Z')) or
      ((c>='0') and (c<='9')) then
        buffer := buffer + LowerCaps(c);      
  end;
  len := length(buffer);
  
  cols := ceil(sqrt(len));
  rows := cols;
  if cols*(cols-1)>len then 
    dec(rows);
  padding := cols*rows - len-1;
  
  result:='';
  for i:=1 to cols do 
  begin
    for j:=0 to rows-1 do
    begin
      idx := j*cols + i;
      if (idx<=len) then
        result:= result + buffer[idx];
    end;
    if (i>=(cols - padding)) then 
      result:= result + ' ';
    if (cols>0) and (cols>i) then
      result:= result + ' ';      
  end;  

end;

end.
