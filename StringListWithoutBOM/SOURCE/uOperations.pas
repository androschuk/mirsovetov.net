unit uOperations;

interface

procedure SaveText(FileName, Text: string; WriteBOM: Boolean);

implementation

uses
  System.Classes, System.SysUtils;

type
  TUTF8EncodingNoBOM = class(TUTF8Encoding)
  public
    function GetPreamble: TBytes; override;
  end;

function TUTF8EncodingNoBOM.GetPreamble: TBytes;
begin
  SetLength(Result, 0);
end;

procedure SaveText(FileName, Text: string; WriteBOM: Boolean);
var
  List: TStringList;
  Encoding: TEncoding;
begin
  List := TStringList.Create;
  try
    List.Add(Text);

    {$IF CompilerVersion < 23.0}  // CompilerVersion < XE2
        if WriteBOM then
            Encoding := TUTF8Encoding.Create
        else
            Encoding := TUTF8EncodingNoBOM.Create;
    {$ELSE}
        Encoding := TUTF8Encoding.Create;
        List.WriteBOM := WriteBOM;
    {$ENDIF}

    List.SaveToFile(FileName, Encoding);
  finally
    FreeAndNil(List);
    FreeAndNil(Encoding);
  end;
end;

end.
