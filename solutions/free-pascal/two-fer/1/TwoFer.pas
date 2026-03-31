unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils;

function TwoFer(const name : string) : string;
var nomen : string;
begin
  if Length(name)>0 then
    nomen := name
  else
    nomen := 'you';
    
  result:='One for ' + nomen + ', one for me.';

end;

end.
