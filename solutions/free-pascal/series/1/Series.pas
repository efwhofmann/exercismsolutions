unit Series;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function slices(
  const series : String;
  const sliceLength : Integer
) : TStrArray;

implementation

uses SysUtils;

function slices(
  const series : String;
  const sliceLength : Integer
) : TStrArray;
var 
  idx, len : integer;
begin
  len:=length(series);
  if sliceLength=0 then
    raise Exception.create('slice length cannot be zero')
  else if sliceLength<0 then
    raise Exception.create('slice length cannot be negative')
  else if len = 0 then
    raise Exception.create('series cannot be empty')
  else if len<sliceLength then
    raise Exception.create('slice length cannot be greater than series length');
    
  result := [];
  idx:=1;
  for idx:=0 to (len-sliceLength) do
  begin
    insert(series.substring(idx, sliceLength), result, length(result));
  end;
  

end;

end.
