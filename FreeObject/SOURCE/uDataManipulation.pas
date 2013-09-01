unit uDataManipulation;

interface

uses
  VCL.StdCtrls, System.Classes;

  ///<summary>Процедура добавляет значение в ComboBox</summary>
  ///<param name="AComboBox: TComboBox">Объект в который добавляется запись</param>
  ///<param name="ACity: string">Добавляемая строка (названия города)</param>
  ///<remarks>В список добавляются значения и нумеруются, помле добавления этот элемент списка выбирается
  ///</remarks>
  procedure AddObject(var AComboBox: TComboBox; const ACity: string);

  ///<summary>Процедура освобождение объектов</summary>
  ///<param name="AStrings: TStrings">Список в котором могут содержаться объекты</param>
  procedure FreeObjects(const AStrings: TStrings);

implementation

uses
  System.SysUtils, uCity;

procedure AddObject(var AComboBox: TComboBox;const ACity: string);
var
  Value: string;
  CountItem: Integer;
begin
  CountItem := AComboBox.Items.Count;
  Value := Format('%d. %s',[CountItem, ACity]);
  AComboBox.Items.AddObject(Value, TCity.Create(Value));
  AComboBox.ItemIndex := CountItem;
end;

procedure FreeObjects(const AStrings: TStrings);
var
  I : Integer;
  Obj: TObject;
begin
  for I := 0 to Pred(AStrings.Count) do
  begin
    Obj := AStrings.Objects[I];
    if Assigned(Obj) then
      FreeAndNil(Obj);
  end;
end;



end.
