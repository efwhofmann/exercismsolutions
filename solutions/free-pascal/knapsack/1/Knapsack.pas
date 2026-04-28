unit Knapsack;

{$mode ObjFPC}{$H+}

interface

type
  TItem = record
    weight: Integer;
    value: Integer;
  end;

  TItemArray = Array Of TItem;

function maximumValue(const maximumWeight : Integer; const items : TItemArray) : Integer;

implementation

uses SysUtils;

type 
  TIntArray = Array of Integer;
  TTable = Array of TIntArray;

function maximumValue(const maximumWeight : Integer; const items : TItemArray) : Integer;
var
  line : TIntArray = ();
  table : TTable = ();
  current : TItem;
  count, newValue, oldValue : integer;
  i, j, weight: integer;
begin
  if (length(items)=0) or (maximumWeight<=0) then 
    exit(0);
  count:=length(items);  
  for i:=0 to count do
  begin
    setlength(line, maximumWeight+1);
    Insert(line,table,length(table));
    line := [];    
  end;
  
  for j:=low(items) to high(items) do
  begin
    current := items[j];
    for weight:=1 to maximumWeight do
    begin
      oldValue := table[j][weight];
      if weight>= current.weight then 
      begin
        newValue:= table[j][weight - current.weight] + current.value;
        if newValue>oldValue then
          table[j+1][weight] := newValue
        else
          table[j+1][weight] := oldValue;
      end
      else
        table[j+1][weight] := oldValue;
    end;
  end;
  result:=table[count][maximumWeight];
end;

end.
