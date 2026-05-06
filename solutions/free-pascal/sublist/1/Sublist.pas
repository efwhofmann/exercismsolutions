unit Sublist;

{$mode ObjFPC}{$H+}

interface

type
  TClassification = (kSublist, kSuperlist, kEqual, kUnequal);

  TCurrencyArray = Array Of Currency;


function compare(const listOne, listTwo: TCurrencyArray) : TClassification;

implementation

uses SysUtils;

function areEqual(const listOne, listTwo: TCurrencyArray) : 
boolean;
var i : integer;
begin  
  if length(listOne)<>length(listTwo) then 
    exit(false)
  else if (length(listOne)=0) and (length(listTwo)=0) then
    exit(true);
  for i:=low(listOne) to high(listOne) do
  begin
    if listOne[i]<>listTwo[i] then exit(false);
  end;
  result := true;
end;

function firstIsSuper(const listOne, listTwo: TCurrencyArray) : boolean;
var i, count, max : integer;
  next: integer;
begin
  count := 0;
  max:=length(listTwo);
  if max=0 then exit(true);
  i:=0;
  next:=0;
  while i<= high(listOne) do
  begin
    if listOne[i]=listTwo[count] then
     begin 
      if count=0 then
        next:=i+1;
      inc(count);    
    end
    else 
      begin
        count:=0;      
        if (next<i) and (listOne[next]=listTwo[count]) then  
        begin
          i:=next;
          continue;
        end;
      end;      
    if count=max then break;
    inc(i);
  end;
  result:=(count=max);
end;


function compare(const listOne, listTwo: TCurrencyArray) : TClassification;
begin
  if firstIsSuper(listOne, listTwo) then 
    if areEqual(listOne, listTwo) then 
      result:= kEqual
    else 
      result:= kSuperlist
  else if firstIsSuper(listTwo, listOne) then 
    result:=kSublist
  else
    result:=kUnequal;
  end;
end.
