unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    ListBox1: TListBox;
    btnCreateForm: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCreateFormClick(Sender: TObject);
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
  Rtti;

procedure TMainForm.btnCreateFormClick(Sender: TObject);
var
  Cur: string;
  Frm: TForm;
  pos: TPosition;
begin
  Cur := ListBox1.Items[ListBox1.ItemIndex];
  pos := TRttiEnumerationType.GetValue<TPosition>(Cur);

  Frm := TForm.Create(self);
  Frm.Caption := Format('Position - %s', [Cur]);
  Frm.Position := pos;
  Frm.Show;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  pos: TPosition;
  Cur: string;
begin
  for pos := Low(TPosition) to High(TPosition) do
  begin
    Cur := TRttiEnumerationType.GetName(pos);
    ListBox1.Items.Add(cur);
  end;

  ListBox1.ItemIndex := 0;
end;

end.
