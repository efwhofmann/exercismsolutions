unit Sublist;

{$mode ObjFPC}{$H+}

interface

type
  TClassification = (kSublist, kSuperlist, kEqual, kUnequal);

  TCurrencyArray = Array Of Currency;


function compare(const listOne, listTwo: TCurrencyArray) : TClassification;

implementation

uses SysUtils;

function isSubList(const a, b: TCurrencyArray) :
boolean;
  var i,cnt : integer;
begin
  if length(a)=0 then
    exit(True);
  if length(a)>length(b) then
    exit(False);
  for i:=low(b) to high(b) do
  begin
    cnt:=0;
    if b[i]=a[0] then    
    begin
      while (cnt<=high(a)) and (i+cnt<=high(b)) do
      begin
        if a[cnt]<>b[i+cnt] then
          break
        else
          inc(cnt);
      end;
      if cnt=length(a) then
        exit(True);
    end;
  end;
  exit(False);
end;


function compare(const listOne, listTwo: TCurrencyArray) : TClassification;
begin
  result:=kUnequal;
  
  if isSubList(listOne, listTwo) then 
  begin
    if length(listTwo)=length(listOne) then
      result:=kEqual
    else
      result:=kSublist;
  end
  else if isSubList(listTwo, listOne) then
    result:=kSuperlist;
end;

end.
