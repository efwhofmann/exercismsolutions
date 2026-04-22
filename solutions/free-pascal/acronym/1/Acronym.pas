unit Acronym;

{$mode ObjFPC}{$H+}

interface

function abbreviate(const phrase: string) : string;

implementation

uses SysUtils;

type TState = (SPACE, CAPITAL, CONSUME);

function abbreviate(const phrase: string) : string;
var 
  state : TState;
  c : char;
begin
  result := '';
  for c in phrase do
  begin
    if (c=' ') or (c='_') or (c='-') then
      state := SPACE
    else if (c>='A') and (c<='Z') then
    begin
      if (state=SPACE) or (state=CONSUME) then
        result := result + c;
      state := CAPITAL;  
    end
    else if (c>='a') and (c<='z') then
    begin
      if (state=SPACE) then
        result := result + Chr(ord(c) - ord('a') + ord('A'));
      state := CONSUME;
    end
    else
      continue;
  end;

end;

end.
