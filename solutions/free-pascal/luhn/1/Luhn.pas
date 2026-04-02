unit Luhn;

{$mode ObjFPC}{$H+}

interface

function valid(const value : string) : boolean;

implementation

uses SysUtils;

function valid(const value : string) : boolean;
var 
  sum, len : integer;
  i, x: integer; 
  ch : char;
begin
  i:= length(value);
  len := 0;
  sum := 0;
  repeat
    ch := value[i];
    if (ch >= '0') and (ch <= '9') then
    begin
      len := len + 1;
      x := ord(ch) - ord('0');
      if (len mod 2 = 0) then
        if (x=9) then
          sum := sum + 9
        else
          sum := sum + (2*x mod 9)
      else
        sum := sum + x;
    end
    else if ch <> ' ' then
     exit(false);
    dec(i);
  until i=0;
  if len<=1 then
    exit(false);
  result := (sum mod 10 = 0);
end;

end.
