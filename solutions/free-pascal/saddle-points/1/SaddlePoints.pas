unit SaddlePoints;

{$mode ObjFPC}{$H+}

interface

type
  TMatrix = array of array of integer;
  TPoint  = record
    row    : integer;
    column : integer;
  end;
  TPoints = array of TPoint;

function saddlePoints(const matrix : TMatrix) : TPoints;

implementation

uses SysUtils;

function saddlePoints(const matrix : TMatrix) : TPoints;
var
  nCols, r, c, m: integer;
  row, rowMax, colMin : array of integer;
  p : TPoint;
begin
  result := nil;
  if (length(matrix)=0) or (length(matrix[0])=0) then exit();
  nCols := length(matrix[0]);  
  for row in matrix do 
  begin
    if length(row)<>nCols then
      raise Exception.create('Irregular matrix');    
  end;
 
  rowMax := nil;
  colMin := nil;
  for row in matrix do
  begin
    m := Low(Integer);
    for c in row do
    begin
      if c>m then m:=c;
    end;
    Insert(m,rowMax, length(rowMax));
  end;
  for c:=0  to (nCols - 1) do
  begin
    m := high(Integer);
    for r:=low(matrix) to high(matrix) do
    begin
      if matrix[r][c]<m then
        m:=matrix[r][c];
    end;
    Insert(m, colMin, length(colMin));
  end;
  for r:=low(matrix) to high(matrix) do
  begin
    for c:=0 to nCols-1 do
    begin
      if (matrix[r][c]=rowMax[r]) and (matrix[r][c]=colMin[c]) then
      begin
          p.row := r + 1;
          p.column := c + 1;
          Insert(p,result, length(result));          
      end;          
     end;
   end;
 
end;

end.
