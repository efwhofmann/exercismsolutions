unit LargestSeriesProduct;

{$mode ObjFPC}{$H+}

interface

function LargestProduct(const digits : string; const span : integer) : integer;

implementation

uses SysUtils;

function LargestProduct(const digits : string; const span : integer) : integer;
var
  len, current : integer;
  i,j : integer;
begin
  len := length(digits);
  if span>len then 
    raise Exception.create('span must not exceed string length')
  else if span<0 then 
    raise Exception.create('span must not be negative')
  else if span=0 then 
    exit(1);
  result := 0;
  for i:=low(digits) to (high(digits)-span+1) do
  begin
    current:=1;
    for j:=i to (i+span-1) do
    begin
      if (digits[j]<'0') or (digits[j]>'9') then
        raise Exception.create('digits input must only contain digits')
      else
          current := current*(ord(digits[j]) - ord('0'));
    end;
    if current>result then
      result := current;
  end;
end;

end.
