# Processo-Seletivo-Luiza-Labs

O MobileChallengeLuizaLabs é um app sample, baseado nas APIs do GitHub, que possibilita o usuário visualizar ver os repositórios escritos em swift, bem como seus pull request e a página do pull request através de uma webview.

## Arquitetura

A arquitetura base escolhida, para o projeto, foi MVC (Model-View-Controller), por está ter uma sinergia muito grande com a forma como o UIKit(framework de desenvolvimento de interfaces utlizada neste sample) é construído.

Para navegação foi utilizado um modelo de Coordinator uni direcional(O coordinator não possui uma referência a view controller, e ela conhece apenas a abstração do coordinator). Tal arquitetura foi escolhida para podermos desacoplar a navegação da ViewController e então conseguirmos objetos reutilizáveis com as responsabilidades bem definidas. O modelo uni direcional foi definido por permitir um nível maior de abstração, além de evitar memory leaks em strong references.

A estrutura de Networking foi dividida em três camadas. A de mais baixo nível, sendo um client que é quem se comunica com a framework de Networking(A utilizada foi o URLSession). Após o client temos um service, para cada módulo de feature, que é o responsável por definir qual a response e a request da chamada. Por fim temos o provider, para cada feature, que é o objeto responsável por deixar a requisição mais atraente para o objeto de lógica de negócio(ViewController), além de apenas expor as requisições necessárias para aquela feature.

## Desenvolvimento de Interfaces

Para a construção de interfaces, a framwork escolhida foi o UIKit com ViewCode. A opção por ViewCode se deu por:

* Torna a injeção de dependências algo mais natural e straightforward;
* Facilita o processo de manutenção e homogeneização da code base, do projeto;
* Melhor para trabalhar em equipe (não tem storyboard merge hell).

## Dependências

Foram utilizados dois gerenciadores de dependência para o projeto, sendo eles O [Swift Package Manager](https://github.com/apple/swift-package-manager) e o [Cocoapods](https://github.com/CocoaPods/CocoaPods)

### Swift Package Manager

O [Swift Package Manager](https://github.com/apple/swift-package-manager) foi a ferramenta escolhido como uma das ferramentas de gerenciamento de depedências do projeto, por trazer o benefício de ser completamente integrado com o Xcode, tornando o trabalho mais produtivo. Abaixo estão as depedências no SPM deste projeto:

* [SnapKit](https://github.com/SnapKit/SnapKit)

### Cocoapods

O [Cocoapods](https://github.com/CocoaPods/CocoaPods) foi escolhido para ser uma ferramenta de gerenciamento de dependências por ser amplamente utilizado pela comunidade, com grande parte dos maiores projetos dando suporte para a ferramenta. Abaixo estão as depedências no Cocoapods deste projeto:

* [SwiftGen](https://github.com/SwiftGen/SwiftGen)
* [Quick](https://github.com/Quick/Quick)
* [Nimble](https://github.com/Quick/Nimble)
* [Nimble Snapshots](https://github.com/ashfurrow/Nimble-Snapshots)

## Modularização

O tipo de modularização escolhida foi a de monorepo com XCFrameworks. Existem três tipos de módulos no app:

* Main -> Pode depender de todos os módulos, mas nenhum pode depender dele
* Tool -> Pode depender de outro módulo de tool, e qualquer módulo pode depender dele
* Feature -> Pode depender de apenas módulos de tool, e apenas o Main pode depender dele

Está divisão foi definida para evitarmos dependency hell!

A escolha por monorepo se deu por:

* Simplificar o Workflow por centralizar toda a CodeBase em um único repositório
* Estar alinhado a tools, adotados por grandes apps, como Buck e Bazel, facilitando um futura possível migração

## Integração Contínua e Deploy continuo

Foi configurado um CI para este projeto utilizando o [Bitrise](https://www.bitrise.io), com o intuito de evitar a regressão de código. Além de aprimorar o WorkFlow de Code Review e integração de código.

## Como executar o projeto

Para realizar o setup inicial do projeto, são necessários alguns passos

* Clonar o projeto ```git clone https://github.com/pedrohgsilveiraV2/Processo-Seletivo-Luiza-Labs.git```;
* Entrar no diretório do projeto ```cd $/MobileChallengeLuizaLabs```;
* Instalar o Bundle ```bundle install```;
* Instalar as dependências ```bundle exec pod install```;

obs: **É necessário que a versão do ruby utilizada seja a 2.6.5**

## Dúvidas

Qualquer dúvida ou problema podem entrar em contato comigo, espero que gostem do projeto! =)

