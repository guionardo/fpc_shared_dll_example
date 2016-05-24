# fpc_shared_dll_example
Exemplo de biblioteca compartilhada em FPC

Passei um tempo me debatendo com um problema, onde eu precisava de uma DLL com código (relativamente) protegido que seria utilizada em outras aplicações.
Basicamente, a DLL é desenvolvida em [Freepascal](http://freepascal.org) e seus métodos serão usados em aplicações em [Visual Fox Pro](https://msdn.microsoft.com/en-us/vfoxpro/bb190225.aspx) e [C#](https://pt.wikipedia.org/wiki/C_Sharp).

Inicialmente, encontrei algumas informações aqui:<br />

* http://wiki.freepascal.org/shared_library
* http://wiki.freepascal.org/Using_Pascal_Libraries_with_.NET_and_Mono

E por fim, depois de alguns testes, cheguei a um código base que pode ser aplicado com segurança:<br />
