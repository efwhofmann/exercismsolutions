unit ReverseString;

{$mode ObjFPC}{$H+}

interface

function reverse(const value : string) : string;

implementation

uses SysUtils;

function reverse(const value : string) : string;
var i : integer;
begin
  result := '';
  if value='' then
    exit('');
  i := length(value);
  repeat
    result := result + value[i];
    dec(i);
  until i=0;
end;

end.
