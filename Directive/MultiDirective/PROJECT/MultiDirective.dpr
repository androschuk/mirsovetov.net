program MultiDirective;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.Form in '..\SOURCE\Main.Form.pas' {MainForm},
  Utils.Condition1 in '..\SOURCE\Utils.Condition1.pas',
  Utils.Condition2 in '..\SOURCE\Utils.Condition2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
