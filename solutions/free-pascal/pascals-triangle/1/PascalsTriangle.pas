unit PascalsTriangle;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray2D = Array Of Array Of Integer;

function rows(const n : integer) : TIntArray2D;

implementation

uses SysUtils;

function rows(const n : integer) : TIntArray2D;
var 
  row, k, item_rk:integer;
  next: array of integer;
begin
  if n<0 then
    raise Exception.create('Number of rows may not be negative')
  else if n=0 then
    exit([])
  else if n=1 then
    exit([[1]]);
    
  result:=[[1],[1,1]];
  for row:=2 to (n-1) do
    begin
      next := [];
      for k:=0 to row do
      begin
        item_rk := 0;
        if (k=0) or (k=row) then
          item_rk := 1
        else
          item_rk := result[row-1][k-1] + result[row-1][k];
        Insert(item_rk, next, length(next));
      end;
      Insert(next, result, length(result));
    end;  
end;

end.
