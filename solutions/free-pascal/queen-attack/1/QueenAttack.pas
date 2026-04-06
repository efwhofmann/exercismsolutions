unit QueenAttack;

{$mode ObjFPC}{$H+}

interface

type
  TPosition = record
    row    : 0..7;
    column : 0..7;
  end;

function create(const row, column : integer) : TPosition;
function canAttack(const white, black : TPosition) : boolean;

implementation

uses SysUtils;

function create(const row, column : integer) : TPosition;
begin
if (row>7) then 
  raise Exception.Create('row not on board')
else if (row<0) then
   raise Exception.Create('row not positive');

if (column>7) then 
  raise Exception.Create('column not on board')
else if (column<0) then
   raise Exception.Create('column not positive');
   
result.row := row;
result.column := column;

end;

function canAttack(const white, black : TPosition) : boolean;
begin
  if (white.row = black.row) and (white.column=black.column) then 
    raise Exception.create('queens on same square');

  result:= (white.row = black.row) or (black.column = white.column) or (abs(white.column - black.column) = abs(white.row - black.row));
end;

end.
