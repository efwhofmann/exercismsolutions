unit RomanNumerals;

{$mode ObjFPC}{$H+}

interface

function roman(const number : integer) : string;

implementation

uses SysUtils, StrUtils;

function roman(const number : integer) : string;
const
  tens : array[0..3] of integer = (1000,100,10,1);
  romantens : array[0..3] of char  = ('M','C','X','I');
  romanfives : array[0..2] of char = ('D','L','V');
var 
  d : int8;
  q, n: integer;
begin
  if (number<=0) or (number>3999) then
    raise Exception.create('only numbers between 1 and 3999 are allowed');
  result := '';
  n := number;
  for d:=0 to 3 do
  begin 
    q := n div tens[d];
    n := n mod tens[d];
    if (d=0) or (q<4) then
      result := result + DupeString(romantens[d],q)
    else if (d>=1) and (q=9) then
      result := result + romantens[d] + romantens[d-1]
    else if (d>=1) and (q>=5) then
      result := result + romanfives[d-1] + DupeString(romantens[d], (q-5)) 
    else 
      result := result + romantens[d] + romanfives[d-1];
  end;

end;

end.
