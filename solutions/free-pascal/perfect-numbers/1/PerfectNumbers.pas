unit PerfectNumbers;

{$mode ObjFPC}{$H+}

interface

function classify(const number : integer) : string;

implementation

uses SysUtils;

function classify(const number : integer) : string;
var aliquot : integer;
var i : integer;
begin

  if number<1 then
    raise Exception.create('Classification is only possible for positive integers.'); // non-negative integers

  if number=1 then 
    exit('deficient');
  aliquot := 0;
 
  for i:=1 to (number + 1) div 2 do
  begin
    if (number mod i = 0) then
      aliquot:= aliquot + i;
  end;
  if aliquot>number then
    result := 'abundant'
  else if aliquot=number then 
    result := 'perfect'
  else
    result := 'deficient'; 

end;

end.
