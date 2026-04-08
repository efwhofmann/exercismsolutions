unit FlowerField;

{$mode ObjFPC}{$H+}

interface

function annotate(const garden : string) : string;

implementation

uses SysUtils;

function annotate(const garden : string) : string;
const 
  deltaR: array[1..8] of integer = (-1,-1,0,1,1,1,0,-1);
  deltaH: array[1..8] of integer = (0,1,1,1,0,-1,-1,-1);
var 
  NoRows, NoCols : integer;
  rows : TStringArray;
  r,c,d: integer;
  count: integer;
  newRow, newCol : integer;
  currentRow : string;
begin
  (* parse garden *)
  rows := garden.split([#10]);
  NoRows := length(rows);
  NoCols := length(rows[0]); 
 
  (* find flowers and build result *)  
  result := '';  
  for r:=0 to NoRows-1 do
  begin
    currentRow := '';
    for c:=1 to NoCols do
    begin
      if rows[r][c]='*' then
        currentRow += '*' 
      else
        begin
          count := 0;
          for d:=1 to 8 do
          begin
            newRow := r + deltaR[d];
            newCol := c + deltaH[d];
            if (newRow >= 0) and (newRow < NoRows) and 
              (newCol >= 1) and (newCol <= NoCols) then
                if rows[newRow][newCol] = '*' then
                  inc(count);
            end;
          if count=0 then
            currentRow := currentRow + ' ' 
          else
            currentRow := currentRow  + chr(count + ord('0')); 
       end; // else
    end; // for c
    result := result + currentRow;
    if r<NoRows-1 then
      result := result + #10;
  end; // for r

end;

end.
