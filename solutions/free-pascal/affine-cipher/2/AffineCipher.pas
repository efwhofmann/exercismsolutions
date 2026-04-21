unit AffineCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string; const a, b : longword) : string;
function decode(const phrase : string; const a, b : longword) : string;

implementation

uses SysUtils;

// modular inverses of a=idx*2 + 1 
// 0 as a place-holder of a=13 (not a valid key)
const
  invs : array[0..12] of longword = (1,9,21,15,3,19,0,7,23,11,5,17,25);




function encode(const phrase : string; const a, b : longword) : string;
var 
  i, cnt : integer;
  c, newc : char;
begin
  if (a mod 2 = 0) or (a mod 13 = 0) then
    raise exception.create('a and m must be coprime.');
  result:='';
  cnt:=0;
  for i:=low(phrase) to high(phrase) do
  begin
    c:=phrase[i];
    if ((c>='a') and (c<='z')) then
      newc := Chr( ((ord(c) - ord('a'))*a + b) mod 26 + ord('a'))
    else if ((c>='A') and (c<='Z')) then
      newc := Chr( ((ord(c) - ord('A'))*a + b) mod 26 + ord('a')) 
    else if ((c>='0') and (c<='9')) then
      newc := c
    else
      continue;     
      
    result := result + newc; 
    inc(cnt);
    if (cnt mod 5 = 0) and (cnt>0) and (i<>length(phrase)-1) then
        result := result + ' ';
  end;
end;

function decode(const phrase : string; const a, b : longword) : string;
var 
  ia : longword;
  shift : integer;
  c, newc : char;
begin
  if (a mod 2 = 0) or (a mod 13 = 0) then
    raise exception.create('a and m must be coprime.');
  ia := invs[(a-1) div 2];
  result:='';
  for c in phrase do
  begin
    if ((c>='a') and (c<='z')) then
    begin
      shift := (ia*(ord(c) - ord('a') - b)) mod 26;
      if shift<0 then
        inc(shift,26);
      newc := Chr( shift + ord('a'));
    end
    else if ((c>='A') and (c<='Z')) then
    begin
      shift := (ia*(ord(c) - ord('A')- b)) mod 26;
      if shift<0 then
        inc(shift,26);
      newc := Chr( shift  + ord('A'));
    end      
    else if ((c>='0') and (c<='9')) then
      newc := c
    else
      continue;
      
    result := result + newc;      
  end;
end;

end.
