unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    btnLoad: TButton;
    img1: TImage;
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
{$R 'ImgRes.res'}

uses uImage;

procedure TMainForm.btnLoadClick(Sender: TObject);
begin
  LoadPngFromRes(img1, 'HELP');
end;

end.
