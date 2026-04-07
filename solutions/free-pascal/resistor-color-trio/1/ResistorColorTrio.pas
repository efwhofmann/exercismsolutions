unit ResistorColorTrio;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function resistance(const colors : TStrArray) : String;

implementation

uses SysUtils;

function singleColor(color : string) : int8;
const 
  colors : array[0..9] of string = ('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white');
 var 
  i : integer;
begin  
  for i:=0 to 9 do
  begin
    if colors[i] = color then
      exit(i);
  end;
end;

function resistance(const colors : TStrArray) : String;
const 
  units : array[0..3] of string = ('ohms', 'kiloohms', 'megaohms', 'gigaohms');
var d1,d2 : int8;
  zeros: integer;
  value : integer;
begin
  result := '';
  value := 0;
  d2 := singleColor(colors[1]);
  d1 := singleColor(colors[0]);
  if d2=0 then 
    value:=d1
  else
    value:=10*d1 + d2;
  zeros := singleColor(colors[2]);
  if d2=0 then
    inc(zeros);
  case (zeros mod 3) of 
    1 : value := 10*value;
    2:  value := 100*value;
  end;
  if (value<>0) and (value mod 100 = 0) then
    result := FloatToStrF(value/1000.0, ffGeneral, 4,2) + ' ' + units[(zeros div 3)+1]
  else
    result := IntToStr(value) + ' ' + units[(zeros div 3)];
end;

end.
