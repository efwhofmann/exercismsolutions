unit Diamond;

{$mode ObjFPC}{$H+}

interface

function rows(const letter : char) : string;

implementation

uses SysUtils;

function rows(const letter : char) : string;
var 
  m, nr, curLtIdx : integer;
  i, j : integer;
  curRow : string;
  curChar : char;
begin
  result := '';
  m := ord(letter) - ord('A');
  nr := 2*(m+1) - 1;
  for i:=0 to nr-1 do
  begin
    curRow := '';
    curLtIdx := i;
    if i>m then
      curLtIdx := 2*m - i;
    curChar := Chr(ord('A') + curLtIdx);
    for j:=-m to m do
    begin
      if (j = -curLtIdx) or (j = curLtIdx) then
        curRow := curRow + curChar
      else
        curRow := curRow + ' ';
    end;
    result := result + curRow;
    if (i<>(nr-1)) then
      result := result + #10;
  end;


end;

end.
