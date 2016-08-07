unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uStringList;

type
  TMainForm = class(TForm)
    btnAdd: TButton;
    lblResult: TLabel;
    mmoResult: TMemo;
    gbCount: TGroupBox;
    lblRecCount: TLabel;
    edtCount: TEdit;
    cbUnique: TCheckBox;
    btnStop: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FWorThread: TWorkThread;
    { Private declarations }
  public
    procedure StopThread;
    procedure Stop(AMessage: string);
    procedure ChangeStatus(Start: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnAddClick(Sender: TObject);
var
  Value: Int64;
begin

  if Not TryStrToInt64(edtCount.Text, Value) then
  begin
    ShowMessage(' оличество должно быть целым числом');
    Exit;
  end;

  FWorThread := TWorkThread.Create(Value, cbUnique.Checked);
  FWorThread.Resume;

  ChangeStatus(False);
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  StopThread;
end;

procedure TMainForm.ChangeStatus(Start: Boolean);
begin
  btnAdd.Enabled := Start;
  btnStop.Enabled := Not Start;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopThread;
end;

procedure TMainForm.Stop(AMessage: string);
begin
  MainForm.mmoResult.Lines.Add(AMessage);
  ChangeStatus(True);
end;

procedure TMainForm.StopThread;
begin
  if (FWorThread <> Nil) then
  begin
    FWorThread.Terminate;
    FWorThread.WaitFor;

    ChangeStatus(True);
  end;
end;

end.
