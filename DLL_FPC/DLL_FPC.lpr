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
  function _intShort(w: Int16): Int16; stdcall; export;
  begin
    Result := w;
  end;

{ Parâmetros inteiros de 16 bits + parâmetro por referência
VFP:
DECLARE short _intShort2 IN (m.lcDLL) short s, short @s2
C#
[DllImport(dll)]
public static extern Int32 _intShort2(Int16 i, ref Int16 i2);
}
  function _intShort2(w: Int16; var w2: Int16): Int16; stdcall; export;
  begin
    w2 := w xor 255;
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

  function _floatSingle(d: single): single; stdcall; export;
  begin
    Result := -d;
  end;

  function _floatDouble(d: double): double; stdcall; export;
  begin
    Result := -d;
  end;

{
Função de entrada de string
VFP
DECLARE INTEGER _String IN (m.lcDLL) STRING teste
C#
[DllImport(dll)]
public static extern int _String(string texto);
}
  function _String(texto: PAnsiString): integer; stdcall; export;
  begin
    Result := integer(strlen(PChar(texto)));
  end;

{ Função de entrada de string com referência
VFP
DECLARE INTEGER _StringRef IN (m.lcDLL) STRING @teste
C#
[DllImport(dll)]
public static extern bool _StringRef([MarshalAs(UnmanagedType.VBByRefStr)] ref string texto);
}
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
  _intShort2,
  _intLongWord,
  _floatSingle,
  _floatDouble;
begin
end.

