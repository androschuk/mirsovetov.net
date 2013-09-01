unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    btnWithoutMemoryLeek: TButton;
    cboxTest1: TComboBox;
    btnGenMemoryLeek: TButton;
    cBoxTest2: TComboBox;
    procedure btnWithoutMemoryLeekClick(Sender: TObject);
    procedure btnGenMemoryLeekClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  uDataManipulation;

const
  KIEV = 'ส่ๅโ';

procedure TMainForm.btnGenMemoryLeekClick(Sender: TObject);
begin
  AddObject(cboxTest2, KIEV);
end;

procedure TMainForm.btnWithoutMemoryLeekClick(Sender: TObject);
begin
  AddObject(cboxTest1, KIEV);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeObjects(cboxTest1.Items);
end;

end.
