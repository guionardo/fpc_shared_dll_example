# fpc_shared_dll_example
Exemplo de biblioteca compartilhada em FPC

Passei um tempo me debatendo com um problema, onde eu precisava de uma DLL com código (relativamente) protegido que seria utilizada em outras aplicações.
Basicamente, a DLL é desenvolvida em [Freepascal](http://freepascal.org) e seus métodos serão usados em aplicações em [Visual Fox Pro](https://msdn.microsoft.com/en-us/vfoxpro/bb190225.aspx) e [C#](https://pt.wikipedia.org/wiki/C_Sharp).

Inicialmente, encontrei algumas informações aqui:<br />

* http://wiki.freepascal.org/shared_library
* http://wiki.freepascal.org/Using_Pascal_Libraries_with_.NET_and_Mono

E por fim, depois de alguns testes, cheguei a um código base que pode ser aplicado com segurança:

É importante frisar o uso dos tipos nativos do VFP e do C#, para encontrar a equivalência no FPC.

## Tipos

### Inteiros

No VFP, os inteiros disponíveis são Short e Integer. Portanto, verifique a equivalência no FPC (Int16/Int32)

### Reais

No VFP, os reais disponíveis são Single e Double.

### Boolean

No VFP, os Boolean são tratados como números, e podem causar problemas. Ao implementar sua rotina em FPC que trata um valor booleano, converta-o para inteiro e use o padrão 0=Falso / 1=Verdadeiro ao passar/receber o valor para o VFP.

### String

Aqui, a pegadinha fica por conta do C#.

O tipo de dado usado para as strings no FPC é o PAnsiString, que é um ponteiro.
Este ponteiro refere a uma área de memória alocada pela aplicação e não pela DLL. 
Se o valor será alterado, isto é, a variável for passada por referência, deve-se incluir o atributo [Marshal](https://msdn.microsoft.com/en-us/library/system.runtime.interopservices.marshal%28v=vs.100%29.aspx) para o parâmetro de referência (vide o exemplo em C#).
Se apenas o parâmetro for inputado a função da DLL sem referência, basta declará-lo como string.

Importante: Um string passado por referência deve ter seu conteúdo previamente criado e a função na DLL deve checar o seu tamanho para evitar [SIGSEGV](https://pt.wikipedia.org/wiki/SIGSEGV) e estourar uma exceção que vai trazer uma mensagem genérica e fazer você quebrar a cabeça até achar onde deixou cair as calças.
