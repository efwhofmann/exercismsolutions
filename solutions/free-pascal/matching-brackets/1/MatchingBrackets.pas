unit MatchingBrackets;

{$mode ObjFPC}{$H+}

interface

type
  TCharArray = Array of char;

function IsPaired(const value : string) : boolean;

implementation

uses SysUtils;

function IsLeft(ch : char) : boolean;
begin
  result := (ch = '(') or (ch = '{')  or (ch = '[');
end;

function IsRight(ch : char) : boolean;
begin
  result := (ch = ')') or (ch = '}')  or (ch = ']');
end;

function Matches(l, r : char): boolean;
begin
  result := ((l='(') and (r=')')) or ((l='{') and (r='}')) or ((l='[') and (r=']'));
end;

function IsPaired(const value : string) : boolean;
var 
  lifo : TCharArray = ();
  c : char;
begin
  for c in value do
  begin
    if IsLeft(c) then
      insert(c, lifo, length(lifo))
    else if IsRight(c) then
      begin
        if 0=length(lifo) then
          exit(false)
        else if matches(lifo[length(lifo)-1],c) then
         begin
          Delete(lifo, length(lifo)-1,1);
          continue;
         end
        else
          exit(false);
      end;   
  end;
  result := (length(lifo) = 0);

end;

end.
