using System;
using System.Runtime.InteropServices;

namespace DLL_Test
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(Int16.MaxValue.ToString() + " = " + _intShort(Int16.MaxValue));
            Console.WriteLine(Int32.MaxValue.ToString() + " = " + _intLongWord(Int32.MaxValue));

            Int16 i = 34;
            Console.WriteLine(_intShort2(40, ref i));
            Console.WriteLine(i);

            string x = "Guionardo Furlan";

            Console.WriteLine(_StringRef(ref x));
            Console.WriteLine(x);
            Console.ReadLine();
        }

        const string dll = @"C:\Dev\fpc_shared_dll_example\DLL_FPC\DLL_FPC.DLL";

        //Declare external functions using the DllImport attribute.
        [DllImport(dll)]
        public static extern int _String(string texto);

        [DllImport(dll)]
        public static extern bool _StringRef([MarshalAs(UnmanagedType.VBByRefStr)] ref string texto);

        [DllImport(dll)]
        public static extern int _Int(int I);

        [DllImport(dll)]
        public static extern Int16 _intShort(Int16 i);

        [DllImport(dll)]
        public static extern Int32 _intLongWord(Int32 i);

        [DllImport(dll)]
        public static extern Int32 _intShort2(Int16 i, ref Int16 i2);

    }
}
