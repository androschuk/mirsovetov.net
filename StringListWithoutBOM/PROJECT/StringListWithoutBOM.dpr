program StringListWithoutBOM;

uses
  Vcl.Forms,
  Main.Form in '..\SOURCE\Main.Form.pas' {FormMain},
  uOperations in '..\SOURCE\uOperations.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
