unit uStringList;

interface

uses
  System.Classes;

type
  TWorkThread = class(TThread)
  private
    FCount: Int64;
    FUnique: Boolean;
  protected
    procedure Execute; override;
  public
    constructor Create(Const ACount: Int64;Const AUnique: Boolean);
  end;

implementation

uses
  System.SysUtils, Winapi.Windows, Main.Form, System.Diagnostics;

constructor TWorkThread.Create(Const ACount: Int64;Const AUnique: Boolean);
begin
  inherited Create(True);
  FCount := ACount;
  FUnique := AUnique;
end;

procedure TWorkThread.Execute;
var
  StrList: TStringList;
  I: Integer;
  Str: string;
  Timer: TStopwatch;
begin
  Randomize;

  Timer := TStopwatch.StartNew;
  StrList := TStringList.Create;
  try
    if FUnique then
    begin
      StrList.Sorted := True;
      StrList.Duplicates := dupIgnore;
    end;

    for I := 0 to FCount - 1 do
    begin
      if Terminated then
        Exit;

      Str := Format('%d some string %d', [Random(10524), Random(10524)]);
      StrList.Add(Str);
    end;
  finally
    Timer.Stop;

    Synchronize(procedure
    begin
      MainForm.Stop(Format('Count: %d/%d; Time: %d ms; Unique: %s',
        [StrList.Count, FCount, Timer.ElapsedMilliseconds, BoolToStr(FUnique, True)]));
    end);

    FreeAndNil(StrList);
  end;
end;

end.
