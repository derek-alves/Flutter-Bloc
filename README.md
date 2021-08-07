# Flutter + bloc + testes unitários + injeção de dependência + git hooks 

Projeto com a finalidade de estudar e entender melhor esses conceitos/ferramentas

> ###  **BLoC**
- BLoC é a sigla para Business Logic Object Components,nada mais é do que a separação das regras de negócio da sua interface, algo recomendado em diversas tecnologias.

> ### **Stream / Sink**
- O conceito de stream esta relacionado com a programação assíncrona. (A tradução literal para stream seria fluxo. Pense em um stream como um fluxo assincrono de dados.), é utilizado em conjunto ao bloc para fazer todas gerência de estado da sua aplicação.
    - Streams fornecem uma sequência assíncrona de dados;
    - Sequências de dados incluem eventos gerados pelo usuário e leitura de dados de arquivos;
    - Você pode processar um stream usando await for ou listen() a partir da API Stream;
    - Os streams fornecem uma maneira de responder a erros;
    - Existem dois tipos de streams:  single subscription(assinatura única) ou broadcast 
    (múltiplas assinaturas);


> ### **Testes unitários**
- Os testes de unidades/unitários basicamente são úteis para verificar o comportamennto de uma unica função, método ou classe, garantindo que sua aplicação continue funcionando conforme mais recursos são adicionados ou uma funcionalidade seja alterada.
    -  Foi o utilizado a biblioteca **bloc_test** para facilitar na criação dos testes.
    - Foi o utilizada  **Mocktail** para realizar o mock das entidades (objetos que simulam comportamentos de objetos reais de forma controlada).

> ### **Injeção de dependência**

-  Ele permite a criação de objetos dependentes fora de uma classe e fornece esses objetos a uma classe de diferentes maneiras. Usando DI, movemos a criação e vinculação dos objetos dependentes para fora da classe que depende deles. Isso traz uma organização bem maior e consequentemente permite testes melhores também, facilita encontrar bugs e principalmente crescer. 
    - Foi utilizado a biblioteca **get_it** para realizar a injeção de dependência nesse projeto
    
> ### **Git Hooks**
- Git hooks são scripts executados automaticamente sempre que ocorre um determinado evento em um repositório Git . Eles permitem que você personalize o comportamento interno do Git e acione ações personalizáveis ​​em pontos-chave no ciclo de vida de desenvolvimento.
    - Foi o utilizado **lefthook** para execução dos hooks

 #### **Conteúdos para estudos**:    
- [BLoC](https://bloclibrary.dev/#/)
- [bloc_test](https://pub.dev/packages/bloc_test)
- [Mocktail](https://pub.dev/packages/mocktail)
- [get_it](https://pub.dev/packages/get_it)
- [LeftHook](https://evilmartians.com/chronicles/lefthook-knock-your-teams-code-back-into-shape?utm_source=lefthook)
- [Dart: Stream / Sink ](https://dart.dev/tutorials/language/streams)