unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    btnWrite: TButton;
    mmoResult: TMemo;
    edtFileLocation: TEdit;
    lblFileLocation: TLabel;
    procedure btnWriteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PrepareAndSaveText(const FileName, Text: string; WriteBOM: Boolean);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
    uOperations, System.IOUtils;

const
    cText = 'text';

procedure TFormMain.btnWriteClick(Sender: TObject);
begin
    PrepareAndSaveText('FileWithBOM.txt', cText, True);
    PrepareAndSaveText('FileWithotBOM.txt', cText, False);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
    // exe location
    edtFileLocation.Text := ExtractFilePath(ParamStr(0));
end;

procedure TFormMain.PrepareAndSaveText(const FileName, Text: string; WriteBOM: Boolean);
var
    FilePath: string;
begin
    FilePath := TPath.Combine(edtFileLocation.Text, FileName);
    SaveText(FilePath, Text, WriteBOM);
    mmoResult.Lines.Add(Format('Save - OK [UseBOM: %s] [Location: %s]', [BoolToStr(WriteBOM, True), FilePath]))
end;

end.
