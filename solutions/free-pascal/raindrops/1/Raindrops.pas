unit Raindrops;

{$mode ObjFPC}{$H+}

interface

function convert(const number : integer) : string;

implementation

uses SysUtils;

function convert(const number : integer) : string;
begin
  result := '';
  if number mod 3 = 0 then 
    result := result + 'Pling';
  if number mod 5 = 0 then 
    result := result + 'Plang';
  if number mod 7 = 0 then 
    result := result + 'Plong';
  if length(result)=0 then
    result := IntToStr(number);
end;

end.
