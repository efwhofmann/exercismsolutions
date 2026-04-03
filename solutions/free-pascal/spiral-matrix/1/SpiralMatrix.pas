unit SpiralMatrix;

{$mode ObjFPC}{$H+}

interface

type
  TIntMatrix = Array Of Array Of Integer;

function SpiralMatrix(const size : uint8) : TIntMatrix;

implementation

uses SysUtils;

function SpiralMatrix(const size : uint8) : TIntMatrix;
var 
  i : uint8;
  k : integer;
  pos_x, pos_y : uint8;
  dir_h, dir_v, t : int8;
  new_x, new_y : int8;
begin
  result := [];
  if size=0 then
    exit;
  setlength(result, size);
  for i:=0 to size-1 do
  begin 
      result[i] := [];
      setlength(result[i], size);
  end;
  pos_x := 0;
  pos_y := 0;
  dir_h := 0;
  dir_v := 1;
  for k:=1 to size*size do 
  begin
    result[pos_x][pos_y] := k;
    new_x := pos_x + dir_h;
    new_y := pos_y + dir_v;
    if ((new_x<0) or (new_x>=size) or 
           (new_y < 0) or (new_y>=size) 
           or (result[new_x][new_y]>0 )) then
    begin
            t := dir_h;
            dir_h := dir_v;
            dir_v := -t;
    end;
    pos_x := pos_x + dir_h;
    pos_y := pos_y + dir_v;
  end;

end;

end.
