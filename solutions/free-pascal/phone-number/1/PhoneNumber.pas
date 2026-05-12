unit PhoneNumber;

{$mode ObjFPC}{$H+}

interface

function clean(const phrase : string) : string;

implementation

uses SysUtils;

function removeNonDigits(const phrase : string) : string;
var c : char;
begin
  result:='';
  for c in phrase do
  begin
    if (c>='0') and (c<='9') then
      result += c
    else if ((c>='a') and (c<='z')) 
      or ((c>='A') and (c<='Z')) then
      raise Exception.create('letters not permitted')
    else if (c>'9') then
      raise Exception.create('punctuations not permitted')
  end;
end;

function validate(const phoneNo : string) : boolean;
var len : integer;
begin
  len := length(phoneNo);
  if (len < 10) then 
    raise Exception.create('must not be fewer than 10 digits')
  else if (len>11) then
    raise Exception.create('must not be greater than 11 digits')
  else if (len=11) and (phoneNo[1]<>'1') then
    raise Exception.create('11 digits must start with 1')
  else if (ord(phoneNo[len-9]) - ord('0'))<2 then
    if phoneNo[len-9]='1' then
      raise Exception.create('area code cannot start with one')
    else
      raise Exception.create('area code cannot start with zero')  
  else if  (ord(phoneNo[len-6]) - ord('0'))<2 then
    if phoneNo[len-6]='1' then
      raise Exception.create('exchange code cannot start with one')
    else
      raise Exception.create('exchange code cannot start with zero');
  result := true;
end;

function clean(const phrase : string) : string;
var
  proper : string;
  start : integer;
begin
  proper:= removeNonDigits(phrase);
  validate(proper);
  if length(proper)=11 then 
     start :=2
  else 
    start := 1;
  result := copy(proper, start, length(proper) + 1-start);
end;

end.
