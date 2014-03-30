unit Form.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, idMessageParts, IdAttachmentFile;

type
  TfrmMain = class(TForm)
    grpSettings: TGroupBox;
    lblAdress: TLabel;
    lblPass: TLabel;
    lblPop3: TLabel;
    lblPort: TLabel;
    edtAdress: TEdit;
    edtPass: TEdit;
    edtPop3: TEdit;
    edtPort: TEdit;
    tmrChecker: TTimer;
    grpCheck: TGroupBox;
    lblCheckAfter: TLabel;
    edtCheckAfter: TEdit;
    btnSetup: TButton;
    mmoResult: TMemo;
    IdPOP3: TIdPOP3;
    btnTest: TButton;
    SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    chkUseSSL: TCheckBox;
    cbSSLType: TComboBox;
    lbMessageInfo: TListBox;
    IdMessage1: TIdMessage;
    lst1: TListBox;
    procedure btnSetupClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure tmrCheckerTimer(Sender: TObject);
  private
    function StartTimer(T: TTimer; int: Integer): string;
    function CheckMail(IP: TIdPOP3; User, Pass, Host: string;
      Port: Integer): String;
    procedure SetupSSL;
    procedure SaveToLog(idMessage: TidMessage);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnSetupClick(Sender: TObject);
begin
  mmoResult.Lines.Add(StartTimer(tmrChecker, strToInt(edtCheckAfter.Text)));
end;

function TfrmMain.StartTimer(T:TTimer; int:Integer):string;
var
   sec:Integer; // объявляем переменную для записи в неё количество мсек.
begin
   T.Enabled:=false; //остановка таймера
   sec:=int*60000; // определяем интервал проверки
   T.Interval:=sec; // задаём интервал проверки
   T.Enabled:=true; //запускаем таймера
   Result:='Почта будет проверена через '+IntToStr(int)+' мин.'; // передача обратно оповещения
end;

procedure TfrmMain.tmrCheckerTimer(Sender: TObject);
begin
  mmoResult.Lines.add(CheckMail(IdPOP3,edtAdress.Text,edtPass.Text,edtPop3.Text,StrToInt(edtPort.Text)));
end;

procedure TfrmMain.btnTestClick(Sender: TObject);
begin
  mmoResult.Lines.add(CheckMail(IdPOP3,edtAdress.Text,edtPass.Text,edtPop3.Text,StrToInt(edtPort.Text)));
end;

procedure TfrmMain.SaveToLog(idMessage: TidMessage);
begin
  mmoResult.Lines.Add(IdMessage1.UID);
  mmoResult.Lines.Add(IdMessage1.From.Text);
  mmoResult.Lines.Add(IdMessage1.Recipients.EmailAddresses);
  mmoResult.Lines.Add(IdMessage1.CCList.EMailAddresses);
  mmoResult.Lines.Add(IdMessage1.Subject);
  mmoResult.Lines.Add(FormatDateTime('dd mmm yyyy hh:mm:ss', IdMessage1.Date));
  mmoResult.Lines.Add(IdMessage1.ReceiptRecipient.Text);
  mmoResult.Lines.Add(IdMessage1.Organization);
end;

procedure TfrmMain.SetupSSL;
begin
  if chkUseSSL.Checked then  //если включена опция использовать SSL
  begin
    IdPOP3.IOHandler := SSLHandler; //устанавливаем SSL Handler для IdPOP3
    IdPOP3.UseTLS := utUseImplicitTLS;  //использовать неявный TSL

    //Устанавливаем тип SSL
    case cbSSLType.ItemIndex of
      0: SSLHandler.SSLOptions.Method := sslvSSLv2;
      1: SSLHandler.SSLOptions.Method := sslvSSLv23;
      2: SSLHandler.SSLOptions.Method := sslvSSLv3;
      3: SSLHandler.SSLOptions.Method := sslvTLSv1;
    else
      raise Exception.Create('Выберите тип SSL');
    end;
  end
  else
  begin
    IdPOP3.IOHandler := nil; //если не используем SSL - устанавливаем все по умолчанию
    IdPOP3.UseTLS := utNoTLSSupport;
  end;
end;

function TfrmMain.CheckMail(IP:TIdPOP3;User,Pass,Host:string;Port:Integer):String;
var
  NumOfMsgs:Integer; // Количество писем
  I: Integer;
  J:Integer;
  attfile: TIdMessageParts;
  CountMessages: Integer;
  AttachPath: string;
begin
  try
    IP.Username:=User; // адрес электронной почты в формате (xxx@xxx.xx)
    IP.Password:=Pass; // пароль к данному почтовому ящику
    IP.Host:=Host; // POP3 сервер (pop.mail.ru; pop3.ukr.net)
    IP.Port:=Port; // порт

    SetupSSL;  // настройка SSL соединения

    IP.Connect; // подключаемся

    if IP.Connected then // если подключение прошло успешно
    begin
       // записываем в NumOfMsgs количество писем
       NumOfMsgs := IP.CheckMessages;
       // Возвращаем результат
       Result:='Подключение прошло успешно!'+#13#10;
       Result:=Result+'У вас '+IntToStr(NumOfMsgs)+' сообщений';


       for I := 1 to NumOfMsgs do
       begin
         if not IP.Retrieve(I, IdMessage1) then
         begin
          //записать в гол что не удалось получить сообщение с ID = I
          Exit;
         end;
//         IP.UIDL(lst1.Items);

         SaveToLog(IdMessage1);

         //Создаем папку
         AttachPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))+'Attach');
         ForceDirectories(AttachPath);

         for J := 0 to IdMessage1.MessageParts.Count - 1 do
          if IdMessage1.MessageParts[J].PartType = mptAttachment then
          begin
            (IdMessage1.MessageParts[J] as TidAttachmentFile).SaveToFile(AttachPath + IdMessage1.MessageParts[J].FileName);
          end;
       end;


    end
  except // Если произошла ошибка- возвращаем текст ошибки
    on E:Exception do Result:='Ошибка подключения! '+E.Message;
  end;

  IP.Disconnect; // Отключаемся
end;

end.
