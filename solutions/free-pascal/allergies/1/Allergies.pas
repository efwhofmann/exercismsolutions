unit Allergies;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function list(const score : integer) : TStrArray;
function AllergicTo(const item : string; const score : integer) : boolean;

implementation

uses SysUtils;

const 
  allAllergens : array[0..7] of string = ('eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats');

function list(const score : integer) : TStrArray;
var i,s: integer;
begin
  s := 1;
  result := [];
  for i:= low(allAllergens) to high(allAllergens) do
  begin
    if ((s and score)<>0) then
      Insert(allAllergens[i], result, length(result));
    s := s shl 1;
  end;
end;

function AllergicTo(const item : string; const score : integer) : boolean;
var i, s : integer;
begin
  s := 1;
  result:=false;
  for i:=low(allAllergens) to high(allAllergens) do
  begin
    if allAllergens[i]=item then
      if ((s and score) <>0 ) then 
        exit(true);
    s := s shl 1; 
  end;
end;


end.
