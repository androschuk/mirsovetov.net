program TestStringList;

uses
  Vcl.Forms,
  Main.Form in '..\SOURCE\Main.Form.pas' {MainForm},
  uStringList in '..\SOURCE\uStringList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
