unit ResistorColor;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function ColorCode(const color : string) : int8;
function colors : TStrArray;

implementation

uses SysUtils;

function ColorCode(const color : string) : int8;
var 
  AllColors : TStrArray;
  i : integer;
begin
    result := -1;
    AllColors := colors();
    for i:=0 to Length(AllColors) do
    begin
     if AllColors[i] = color then
       begin
         result := i;
         break;
       end;
    end;
      
end;

function colors : TStrArray;
begin

 result := ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

end;

end.
