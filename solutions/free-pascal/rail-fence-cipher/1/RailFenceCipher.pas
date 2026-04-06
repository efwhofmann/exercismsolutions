unit RailFenceCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const msg : String; const rails : Smallint) : String;
function decode(const msg : String; const rails : Smallint) : String;

implementation

uses SysUtils;

type
  mode = (encoding, decoding);
  
function cipher(const str : string; const rails : SmallInt; how : mode) : String;
var
  i, maxStep, rail, step : integer;
  len, posCipher, posText :  integer;
begin
  result := '';
  len:=length(str);
  for i:=0 to (len-1) do
  begin
    result := result + ' ';
  end;
  maxStep := 2*(rails-1);
  posCipher := 1;
  for rail:=0 to (rails-1) do
  begin
    step := maxStep - 2*rail;
    if (step=0) then step := maxStep;   
    posText:= rail+1;    
    while (posText <= len) do
    begin
      if (how = encoding) then
        result[posCipher] := str[posText]
      else
        result[posText] := str[posCipher];
      posText := posText + step;
      inc(posCipher); 
      if step<>maxStep then         
        step := maxStep - step;     
    
    end;
  end;
end;

function encode(const msg : String; const rails : Smallint) : String;
begin
  result := cipher(msg, rails, encoding);
end;

function decode(const msg : String; const rails : Smallint) : String;
begin
  result := cipher(msg, rails, decoding);
end;

end.
