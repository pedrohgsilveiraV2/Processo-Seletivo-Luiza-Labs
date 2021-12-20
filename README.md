# Processo-Seletivo-Luiza-Labs

O MobileChallengeLuizaLabs é um app sample, baseado nas APIs do GitHub, que possibilita o usuário visualizar os repositórios escritos em swift, bem como seus pull requests e os detalhes do pull request através de uma webview.

## Arquitetura

A arquitetura base escolhida para o projeto, foi MVC (Model-View-Controller). Esta arquitetura foi escolhida por ter uma sinergia muito grande com a forma como o UIKit (framework de desenvolvimento de interfaces utlizada neste sample) é construído.

Para navegação foi utilizado um modelo de Coordinator unidirecional (O coordinator não possui uma referência a view controller, e esta conhece apenas a abstração do coordinator). Tal arquitetura foi escolhida para podermos desacoplar a navegação da ViewController e conseguirmos objetos reutilizáveis com as responsabilidades bem definidas. O modelo unidirecional foi definido para permitir um nível maior de abstração, além de evitar memory leaks devido a strong references.

A estrutura de Networking foi dividida em três camadas. A de mais baixo nível, sendo um client que é quem se comunica com o objeto de Networking (O utilizado foi o URLSession). Um service, para cada módulo de feature, que é o responsável por definir qual a response e a request da chamada. O provider é um objeto, presente em cada feature, responsável por deixar a requisição mais atraente para o objeto de lógica de negócio (ViewController), além de expor apenas as requisições necessárias para aquela feature.

## Desenvolvimento de Interfaces

Para a construção de interfaces, a framework escolhida foi o UIKit com ViewCode. A opção por ViewCode se deu por:

* Tornar a injeção de dependências algo mais natural e direto
* Facilitar o processo de manutenção e homogeneização da code base, do projeto
* Melhor para trabalhar em equipe (evita problemas de merge com o .XML do storyboard)

## Dependências

Foram utilizados dois gerenciadores de dependência para o projeto, sendo eles O [Swift Package Manager](https://github.com/apple/swift-package-manager) e o [Cocoapods](https://github.com/CocoaPods/CocoaPods). Foram utilizadas duas ferramentas por algumas dependências e.g. Quick, não darem suporte a SPM.

### Swift Package Manager

O [Swift Package Manager](https://github.com/apple/swift-package-manager) foi uma das ferramentas escolhidas para o gerenciamento de depedências do projeto, por trazer o benefício de ser completamente integrado com o Xcode, tornando o trabalho mais produtivo. Abaixo estão as depedências gerenciadas via SPM neste projeto:

* [SnapKit](https://github.com/SnapKit/SnapKit)

### Cocoapods

O [Cocoapods](https://github.com/CocoaPods/CocoaPods) foi escolhido para ser uma ferramenta de gerenciamento de dependências por ser amplamente utilizado pela comunidade, com grande parte dos maiores projetos dando suporte para a ferramenta. Abaixo estão as depedências gerenciadas via Cocoapods neste projeto:

* [SwiftGen](https://github.com/SwiftGen/SwiftGen)
* [Quick](https://github.com/Quick/Quick)
* [Nimble](https://github.com/Quick/Nimble)
* [Nimble Snapshots](https://github.com/ashfurrow/Nimble-Snapshots)

## Modularização

A estratégia de modularização escolhida foi a de monorepo divididos em XCFrameworks. Existem três tipos de módulos no app:

* Main -> Pode depender de todos os módulos, mas nenhum pode depender dele
* Tool -> Pode depender de outro módulo de Tool, e qualquer módulo pode depender dele
* Feature -> Pode depender de apenas módulos de Tool, e apenas o Main pode depender dele

Está divisão foi definida para evitarmos dependência cíclica.

A escolha desta estratégia foi para:

* Simplificar o fluxo de trabalho, centralizando toda a CodeBase em um único repositório
* Estar alinhado com as ferramentas, adotadas por grandes apps, como Buck e Bazel, facilitando possíveis migrações

## Integração Contínua e Deploy continuo

Foi configurado uma CI para este projeto utilizando o [Bitrise](https://www.bitrise.io), com o intuito de aprimorar o fluxo de Code Review e integrações no código.

## Como executar o projeto

Para realizar o setup inicial do projeto, são necessários alguns passos

* Clonar o projeto ```git clone https://github.com/pedrohgsilveiraV2/Processo-Seletivo-Luiza-Labs.git```
* Entrar no diretório do projeto ```cd $/MobileChallengeLuizaLabs```
* Instalar o Bundle ```bundle install```;
* Instalar as dependências ```bundle exec pod install```;

Observações: 
* **É necessário que a versão do ruby utilizada seja a 2.6.5**
* **Para executar o comando bundle install, é preciso ter o [bundler instalado](https://bundler.io/)**

## Dúvidas

Qualquer dúvida ou problema podem entrar em contato comigo, espero que gostem do projeto! =)

