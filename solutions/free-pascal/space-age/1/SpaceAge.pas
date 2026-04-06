unit SpaceAge;

{$mode ObjFPC}{$H+}

interface

function age(const planet : string; const seconds : LongInt) : double;

implementation

uses SysUtils;

function age(const planet : string; const seconds : LongInt) : double;
const 
  earthYear = 31557600;
  periods : array[1..8] of double = ( 0.2408467, 0.61519726, 1.0,  1.8808158, 11.862615, 29.447498, 84.016846, 164.79132);
  planets : array[1..8] of string = ('Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune');
var i : integer;
begin
  result := 0.0;
  
  for i:=1 to 8 do
  begin    
    if planets[i]=planet then
    begin
      result := seconds/(earthYear*periods[i]);
      break;
    end;
  end;
  if result=0.0 then
      raise Exception.create('not a planet');

end;

end.
