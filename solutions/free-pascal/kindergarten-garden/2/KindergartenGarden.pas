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
begin
  result:=[];
  stdNo := ord(student[1]) - ord('A');
  offset := (length(diagram) div 2) + 2 + 2*stdNo;
  result:= TPlantArray.create(letterToPlant(diagram[2*stdNo+1]), 
                  letterToPlant(diagram[2*stdNo+2]), 
                  letterToPlant(diagram[offset]), 
                  letterToPlant(diagram[offset+1])); 

end;

end.
