program OutputDebugString;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

begin
  try

     Windows.OutputDebugString('Some message 1');
     Windows.OutputDebugString('Some message 2');

     Readln;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
