unit Transpose;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = array of string;

function transpose(const lines : TStrArray) : TStrArray;

implementation

uses SysUtils;

function transpose(const lines : TStrArray) : TStrArray;
var 
  max, i, r : integer;
  l, str: string;
begin
  max:=0;
  result:=[];
  for l in lines do
  begin
    if length(l)>max then
      max:=length(l);
  end;
  for i:=1 to max do
  begin
    str:='';
    for r:=high(lines) downto low(lines) do
    begin
      if i<=length(lines[r]) then
        str := lines[r][i] + str
      else if str<>'' then
        str := ' ' + str;    
    end;
    Insert(str,result,length(result));
  end;

end;

end.
