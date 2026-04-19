unit CircularBuffer;

{$mode ObjFPC}{$H+}

interface

type
  generic TCircularBuffer<T> = class
  private
    capacity, count, newest, oldest : integer;
    buff : array of T;
  public
    constructor Create(const aCapacity : integer);
    function  Read : T;
    procedure Write(const aItem : T);
    procedure Overwrite(const aItem : T);
    procedure Clear;
  end;

implementation

uses SysUtils;

constructor TCircularBuffer.Create(const aCapacity : integer);
begin
  if aCapacity <= 0 then
    raise Exception.create('capacity must be positive');
  SetLength(buff, aCapacity);
  capacity := aCapacity;
  count := 0;
  oldest := 0;
  newest := 0;
end;

function TCircularBuffer.Read : T;
begin
  if count<>0 then
  begin
    result := buff[oldest];
    oldest := (oldest+1) mod capacity;
    dec(count);
  end
  else
    raise Exception.Create('buffer is empty');
end;

procedure TCircularBuffer.Write(const aItem : T);
begin
  if count>= capacity then
    raise Exception.Create('buffer is full')
  else if length(buff)<capacity then
    Insert(aItem, buff, length(buff))
  else
    begin
      buff[newest] := aItem;
      inc(count);
      newest := (newest + 1) mod capacity;
    end;
end;

procedure TCircularBuffer.Overwrite(const aItem : T);
begin
  if count<capacity then
    write(aItem)
  else
    begin
      buff[oldest] := aItem;
      oldest := (oldest + 1) mod capacity;
    end;
end;

procedure TCircularBuffer.Clear;
begin
  count := 0;
  oldest := 0;
  newest := 0;
end;

end.
