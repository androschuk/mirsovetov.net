unit uCity;

interface

type
  TCity = class
  strict private
    FName: string;
  public
    constructor Create(const AName: string);
    property Name: string read FName write FName;
  end;

implementation

{ TTestObject }

constructor TCity.Create(const AName: string);
begin
  FName := AName;
end;

end.
