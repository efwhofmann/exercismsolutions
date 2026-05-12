unit ListOps;

{$mode ObjFPC}{$H+}

interface

type
  generic TListOps<T> = class
  type
    TArr        = array of T;
    TArr2D      = array of TArr;
    TFilterFunc = function(const el: T): boolean;
    TMapFunc    = function(const el: T): T;
    TFoldFunc   = function(const acc, el: T): T;
  public
    class function append(const list1, list2: TArr): TArr;
    class function concat(const lists: TArr2D): TArr;
    class function filter(const list: TArr; func: TFilterFunc): TArr;
    class function len(const list: TArr): integer;
    class function map(const list: TArr; func: TMapFunc): TArr;
    class function foldl(const list: TArr; initial: T; func: TFoldFunc): T;
    class function foldr(const list: TArr; initial: T; func: TFoldFunc): T;
    class function reverse(const list: TArr): TArr;
  end;

implementation

uses SysUtils;

class function TListOps.append(const list1, list2: TArr): TArr;
var item : T;
begin
  result := list1;
  for item in list2 do begin
    insert(item, result, length(result));
  end;
end;

class function TListOps.concat(const lists: TArr2D): TArr;
var lst : TArr;
begin
  result := [];
  for lst in lists do
  begin
    result:=TlistOps.append(result, lst);
  end;
  
end;

class function TListOps.filter(const list: TArr; func: TFilterFunc): TArr;
var item : T;
begin
  result := [];
  for item in list do
  begin 
    if func(item) then
      insert(item, result, length(result));
  end;
end;

class function TListOps.len(const list: TArr): integer;
var 
  item : T;
begin
  result:=0;
  for item in list do
  begin
    inc(result);
  end;
end;

class function TListOps.map(const list: TArr; func: TMapFunc): TArr;
var item : T;
begin
  result := [];
  for item in list do
  begin 
    insert(func(item), result, length(result));
  end;
end;

class function TListOps.foldl(const list: TArr; initial: T; func: TFoldFunc): T;
var item : T;
begin
  result:=initial;
  for item in list do
  begin    
    result:=func(result,item);    
  end;
end;

class function TListOps.foldr(const list: TArr; initial: T; func: TFoldFunc): T;
var 
  i : integer;
begin
  result:=initial;
  for i:=high(list) downto low(list) do
  begin    
    result:=func(result, list[i]);    
  end;
end;

class function TListOps.reverse(const list: TArr): TArr;
var 
  i : integer;
begin
  result := [];
  for i:=high(list) downto low(list) do
  begin
    insert(list[i], result, length(result));
  end;
end;

end.
