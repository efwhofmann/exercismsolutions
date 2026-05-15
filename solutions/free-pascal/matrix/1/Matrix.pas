unit Matrix;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray  = Array Of Integer;
 
function row(const AString : string; const index : byte) : TIntArray;
function column(const AString : string; const index : byte) : TIntArray;

implementation

uses SysUtils;

function row(const AString : string; const index : byte) : TIntArray;
var 
  ch : char;
  r, n :  integer;
begin
  r := 0;
  n := 0;
  result := [];
  for ch in (AString + #10) do
  begin    
    if r>=index then
      break;    
    if r=index-1 then 
    begin
      if (ch>='0') and (ch<='9') then
        n := 10*n + ord(ch) - ord('0')     
      else if (ch=' ') or (ch=#10) then
      begin
        Insert(n, result, length(result));
        n:=0;
      end;
    end;        
    if ch=#10 then
      inc(r);
  end; 
end;

function column(const AString : string; const index : byte) : TIntArray;
var
  ch : char;
  c,n,r : integer;
begin
  r := 0;
  c := 0;
  n := 0;
  result := [];
  for ch in (AString+#10) do
  begin
    if c=index-1 then
    begin
      if (ch>='0') and (ch<='9') then
        n:=10*n + ord(ch) - ord('0')
      else if (ch=' ') or (ch=#10) then   
      begin
        insert(n,result, length(result));
        n:=0;
      end;
    end;
    if (ch=' ') then
      inc(c);
    if ch=#10 then
    begin
      Inc(r);
      c := 0;
    end;
  end;
end;

end.
