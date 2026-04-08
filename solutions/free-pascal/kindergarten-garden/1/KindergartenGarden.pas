unit KindergartenGarden;

{$mode ObjFPC}{$H+}

interface

type
  Plant = (Grass, Clover, Radishes, Violets);

  TPlantArray = Array Of Plant;

function plants(const diagram, student : String) : TPlantArray;

implementation

uses SysUtils;

function letterToPlant(letter : char) : Plant;
begin
  case letter of 
    'G' : result := Grass;
    'C' : result := Clover;
    'R' : result := Radishes
    else
      result:=Violets;
  end;
end;

function plants(const diagram, student : String) : TPlantArray;
var
  stdNo, offset : integer;
  pLts : array[0..3] of char;
  i : integer;
begin
  result:=[];
  stdNo := ord(student[1]) - ord('A');
  offset := (length(diagram) div 2) + 2 + 2*stdNo;
  pLts[0]:= diagram[2*stdNo+1];
  pLts[1]:=diagram[2*stdNo+2];
  pLts[2]:=diagram[offset];
  pLts[3]:=diagram[offset+1];
  for i:=0  to 3 do
  begin
    insert(letterToPlant(pLts[i]) , result, length(result));
  end;

end;

end.
