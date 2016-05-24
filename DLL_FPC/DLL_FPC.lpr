library DLL_FPC;

{$mode objfpc}{$H+}

uses
  SysUtils;

{ Parâmetros inteiros de 16 bits = Word / Int16

VFP:
  DECLARE SHORT _intShort IN DLL_FPC.DLL SHORT w

C#
  [DllImport(dll)]
  public static extern Int16 _intShort(Int16 i);
}
  function _intShort(w: word): word; stdcall; export;
  begin
    Result := w;
  end;

{ Parâmetros inteiros de 32 bits = LongWord / Int32

VFP:
    DECLARE INTEGER _intLongWord in DLL_FPC.DLL INTEGER

C#
  [DllImport(dll)]
  public static extern Int32 _intLongWord(Int32 i);
}
  function _intLongWord(d: DWord): DWord; stdcall; export;
  begin
    Result := d;
  end;

{
Função de entrada de string
}
  function _String(texto: PAnsiString): integer; stdcall; export;
  begin
    Result := integer(strlen(PChar(texto)));
  end;

  function _StringRef(texto: PChar): boolean; stdcall; export;
  begin
    StrPLCopy(texto, strupper(texto), strlen(texto));
    Result := odd(strlen(PChar(texto)));
  end;

  function _Int(i: integer): integer; stdcall; export;
  begin
    Result := -i;
  end;

  function _IntRef(var i: integer): integer; stdcall; export;
  begin
    i := -i;
    if (odd(i)) then
      Result := 1
    else
      Result := 0;
  end;

exports
  _String,
  _StringRef,
  _Int,
  _IntRef,
  _intShort,
  _intLongWord;
begin
end.

