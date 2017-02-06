unit Main.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TMainForm = class(TForm)
    mmoResult: TMemo;
    btnCondition1: TButton;
    btnCondition2: TButton;
    procedure btnCondition1Click(Sender: TObject);
    procedure btnCondition2Click(Sender: TObject);
  private
    procedure Log(Const Value: string); overload;
    procedure Log(Const Value: string; const Args: array of const); overload;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
    Utils.Condition1, Utils.Condition2;

procedure TMainForm.Log(Const Value: string);
begin
    mmoResult.Lines.Add(Value);
end;

procedure TMainForm.btnCondition2Click(Sender: TObject);
begin
    Log('Condition 2');
    Log(' - AND condition %s', [BoolToStr(CheckDirective2And, True)]);
end;

procedure TMainForm.Log(Const Value: string; Const Args: array of const);
begin
   Log(Format(Value, Args));
end;


procedure TMainForm.btnCondition1Click(Sender: TObject);
begin
    Log('Condition 1');
    Log(' - AND condition %s', [BoolToStr(CheckDirective1And, True)]);
    Log(' - OR condition %s', [BoolToStr(CheckDirective1Or, True)]);
end;

end.
