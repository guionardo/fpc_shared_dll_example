CLEAR
CLEAR DLLS
LOCAL lcDLL
m.lcDLL="C:\Dev\fpc_shared_dll_example\DLL_FPC\DLL_FPC.DLL"

DECLARE INTEGER _String IN (m.lcDLL) STRING teste
DECLARE INTEGER _StringRef IN (m.lcDLL) STRING @teste
DECLARE INTEGER _Int IN (m.lcDLL) INTEGER i
DECLARE Short _IntRef IN (m.lcDLL) INTEGER @i

DECLARE short _intShort IN (m.lcDLL) short s

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

CLEAR DLLS
