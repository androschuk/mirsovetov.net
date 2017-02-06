unit Utils.Condition1;

interface

  {$DEFINE CONDITION1}    // On
  {$UNDEF  CONDITION2}    // Off

function CheckDirective1And : Boolean;
function CheckDirective1Or : Boolean;

implementation

function CheckDirective1And : Boolean;
begin
  {$IF DEFINED(CONDITION1) AND DEFINED(CONDITION2) }
    Result := True
  {$ELSE}
    Result := False;
  {$ENDIF}
end;

function CheckDirective1Or : Boolean;
begin
  {$IF DEFINED(CONDITION1) OR DEFINED(CONDITION2)}
    Result := True
  {$ELSE}
    Result := False;
  {$IFEND}
end;

end.
