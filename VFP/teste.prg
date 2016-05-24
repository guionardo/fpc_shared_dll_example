CLEAR
CLEAR DLLS
LOCAL lcDLL
m.lcDLL="C:\Dev\fpc_shared_dll_example\DLL_FPC\DLL_FPC.DLL"


DECLARE INTEGER _String IN (m.lcDLL) STRING teste
DECLARE INTEGER _StringRef IN (m.lcDLL) STRING @teste
DECLARE INTEGER _Int IN (m.lcDLL) INTEGER i
DECLARE Short _IntRef IN (m.lcDLL) INTEGER @i

DECLARE short _intShort IN (m.lcDLL) short s
DECLARE short _intShort2 IN (m.lcDLL) short s, short @s2

DECLARE single _floatSingle IN (m.lcDLL) single s
DECLARE double _floatDouble IN (m.lcDLL) double d


? _String("GUIONARDO")

x = "Guionardo Furlan0"
? _StringRef(@x)
? x

? _Int(10)
z = 11

? _IntRef(@z)
? z

? "SHORT"
? _intShort(-5)

k = 34
? _intShort2(40,@k)
? k

? _floatSingle(12345678901234.023)
? _floatDouble(12345678901234.023)

CLEAR DLLS
