unit Main.Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, StdCtrls;

type
  TMainForm = class(TForm)
    btnOpenReport: TButton;
    rep1: TfrxReport;
    procedure btnOpenReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
uses
  frxDesgn, frxVariables;

procedure TMainForm.btnOpenReportClick(Sender: TObject);
const
  CATEGORY_NAME = 'User Variables';
begin
  rep1.Variables.Clear;
  //Созание категории
  rep1.Variables[' ' + CATEGORY_NAME] := Null;
  rep1.Variables.AddVariable(CATEGORY_NAME, 'UserID', 1);
  rep1.Variables.AddVariable(CATEGORY_NAME, 'UserName', QuotedStr('Александр'));
  rep1.Variables.AddVariable(CATEGORY_NAME, 'TeachYear', QuotedStr('2012-2013'));
  //Открытие дизайнера
  rep1.DesignReport(True);
end;

end.
