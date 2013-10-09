program FRVariables;

uses
  Forms,
  Main.Form in '..\SOURCE\Main.Form.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
