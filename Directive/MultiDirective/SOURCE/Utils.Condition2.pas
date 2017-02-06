unit Utils.Condition2;

interface

{$DEFINE CONDITION1}

function CheckDirective2And : Boolean;

implementation

const
    Const1 = 1.1;

function CheckDirective2And : Boolean;
begin
  {$IF DEFINED(CONDITION1) and (Const1 > 2.0) }
    Result := True
  {$ELSE}
    Result := False
  {$ENDIF}
end;

end.
