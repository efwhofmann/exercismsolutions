unit BinarySearch;

{$mode ObjFPC}{$H+}

interface

type
  TExtendedArray = Array Of Extended;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;

implementation

uses SysUtils;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;
var 
  left, right, mid : integer;
  val : Extended;
begin
  left := 0;
  right := length(AArray) - 1;
 
  while left<=right do
  begin
    mid := (right+left) div 2;
    val := AArray[mid];
    if (val=AValue) then
      exit(mid)
    else if (val>AValue) then
      right := mid - 1
    else
      left := mid + 1;
  end;

  raise Exception.Create('value not in array');

end;

end.
