# Flutter – MaterialApp, Material Design e Gerenciamento de Estado

---

# O que é o MaterialApp?

O `MaterialApp` é um widget fornecido pelo Flutter que serve como a base de uma aplicação construída utilizando o Material Design. Ele configura diversos aspectos globais da aplicação, como rotas, tema, navegação, idioma, título da aplicação e página inicial.

Normalmente ele é o widget raiz de aplicações Flutter que seguem as diretrizes visuais do Material Design.

## Exemplo

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Olá Flutter'),
        ),
      ),
    ),
  );
}
```

Neste exemplo, o `MaterialApp` fornece toda a infraestrutura necessária para que widgets como `Scaffold`, `AppBar`, `SnackBar` e outros componentes do Material Design funcionem corretamente.

---

# Quais parâmetros são importantes no MaterialApp?

O `MaterialApp` possui diversos parâmetros. Os mais utilizados são:

## title

Define o nome da aplicação.

```dart
MaterialApp(
  title: 'Meu Aplicativo',
)
```

---

## home

Define a tela inicial da aplicação.

```dart
MaterialApp(
  home: HomePage(),
)
```

---

## theme

Define o tema visual da aplicação.

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
)
```

---

## darkTheme

Define o tema escuro.

```dart
MaterialApp(
  darkTheme: ThemeData.dark(),
)
```

---

## themeMode

Controla qual tema será utilizado.

```dart
themeMode: ThemeMode.system
```

Opções:

* ThemeMode.light
* ThemeMode.dark
* ThemeMode.system

---

## routes

Define as rotas nomeadas.

```dart
routes: {
  '/home': (context) => HomePage(),
  '/perfil': (context) => PerfilPage(),
}
```

---

## initialRoute

Define qual rota será aberta inicialmente.

```dart
initialRoute: '/home'
```

---

## debugShowCheckedModeBanner

Remove a faixa "DEBUG".

```dart
debugShowCheckedModeBanner: false
```

---

# Como funcionam os imports no Flutter?

Os imports permitem utilizar bibliotecas, classes, widgets e funções que estão em outros arquivos.

## Importando bibliotecas do Flutter

```dart
import 'package:flutter/material.dart';
```

Este import disponibiliza todos os widgets do Material Design.

---

## Importando arquivos do projeto

```dart
import 'home_page.dart';
```

ou

```dart
import 'package:meu_app/screens/home_page.dart';
```

---

## Importando bibliotecas do Dart

```dart
import 'dart:math';
import 'dart:io';
import 'dart:async';
```

---

## Importando pacotes externos

```dart
import 'package:provider/provider.dart';
```

Esses pacotes normalmente são instalados através do arquivo `pubspec.yaml`.

---

# O que é o Material Design?

O Material Design é um sistema de design criado pelo Google.

Ele define padrões para:

* Cores
* Tipografia
* Espaçamentos
* Animações
* Componentes
* Navegação
* Experiência do usuário

Seu objetivo é criar interfaces consistentes e intuitivas.

---

# Como o Material Design é utilizado no Flutter?

O Flutter possui uma biblioteca completa baseada no Material Design.

Quando utilizamos:

```dart
import 'package:flutter/material.dart';
```

temos acesso a todos os componentes visuais do Material Design.

---

# Principais widgets do Material Design

## Scaffold

Estrutura básica da tela.

```dart
Scaffold()
```

---

## AppBar

Barra superior.

```dart
AppBar(
  title: Text('Meu App'),
)
```

---

## FloatingActionButton

Botão flutuante.

```dart
FloatingActionButton(
  onPressed: () {},
)
```

---

## Drawer

Menu lateral.

```dart
Drawer()
```

---

## BottomNavigationBar

Menu inferior.

```dart
BottomNavigationBar()
```

---

## Card

Cartões de conteúdo.

```dart
Card()
```

---

## ListTile

Item de lista.

```dart
ListTile()
```

---

## ElevatedButton

Botão elevado.

```dart
ElevatedButton()
```

---

## TextField

Campo de entrada.

```dart
TextField()
```

---

## SnackBar

Mensagem temporária.

```dart
SnackBar()
```

---

# O que são widgets Stateless?

Widgets Stateless são widgets imutáveis.

Depois de criados, eles não podem alterar seus próprios dados internos.

Seu conteúdo depende exclusivamente dos parâmetros recebidos.

---

## Exemplo

```dart
class MeuTexto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text('Olá');
  }
}
```

---

# Quando utilizar Stateless?

Utilize quando:

* A interface não muda.
* Os dados são fixos.
* Não existe interação que altere a tela.

---

## Exemplos

* Textos
* Ícones
* Logos
* Telas estáticas
* Componentes de exibição

---

# Ciclo de vida de um Stateless Widget

O ciclo é simples.

## 1. Construtor

O widget é criado.

---

## 2. build()

O Flutter desenha a interface.

```dart
Widget build(BuildContext context)
```

---

## 3. Descarte

Quando removido da árvore de widgets.

---

# Limitações dos Stateless Widgets

Não conseguem armazenar estado interno.

---

## Não é possível

```dart
contador++;
```

e atualizar a interface automaticamente.

---

## Não são adequados para

* Contadores
* Formulários dinâmicos
* Jogos
* Telas com atualizações constantes

---

# O que são widgets Stateful?

Widgets Stateful são widgets que possuem estado mutável.

Eles podem atualizar sua interface durante a execução.

---

## Exemplo

```dart
class Contador extends StatefulWidget {

  @override
  State<Contador> createState() {
    return _ContadorState();
  }
}
```

---

# Quando utilizar Stateful?

Quando a interface muda com o tempo.

---

## Exemplos

* Contadores
* Formulários
* Checkboxes
* Telas de login
* Carrinhos de compra
* Listas dinâmicas

---

# Ciclo de vida de um Stateful Widget

O ciclo de vida é mais complexo.

---

## createState()

Cria o objeto State.

```dart
createState()
```

---

## initState()

Executado uma única vez.

```dart
@override
void initState() {
  super.initState();
}
```

Ideal para:

* Requisições HTTP
* Inicializações
* Configurações

---

## build()

Constrói a interface.

```dart
Widget build(BuildContext context)
```

Pode ser chamado várias vezes.

---

## didUpdateWidget()

Executado quando o widget recebe novos parâmetros.

---

## deactivate()

Executado quando o widget sai temporariamente da árvore.

---

## dispose()

Executado antes da destruição do widget.

```dart
@override
void dispose() {
  super.dispose();
}
```

Utilizado para:

* Fechar Streams
* Cancelar Timers
* Liberar recursos

---

# Como o gerenciamento de estado é feito em widgets Stateful?

O estado é armazenado dentro da classe State.

---

## Exemplo

```dart
class _ContadorState extends State<Contador> {

  int contador = 0;

}
```

Sempre que o estado muda, a interface pode ser reconstruída.

---

# Como funciona o setState?

O método `setState()` informa ao Flutter que o estado mudou.

---

## Exemplo

```dart
setState(() {
  contador++;
});
```

---

## Processo

1. Estado é alterado.
2. setState é chamado.
3. build é executado novamente.
4. A interface é atualizada.

---

# Exemplo completo

```dart
ElevatedButton(
  onPressed: () {
    setState(() {
      contador++;
    });
  },
  child: Text('Incrementar'),
)
```

---

# Quais cuidados tomar no gerenciamento de estado?

## Evitar setState desnecessário

Cada chamada provoca reconstrução da interface.

---

## Não alterar estado fora do setState

Errado:

```dart
contador++;
```

Correto:

```dart
setState(() {
  contador++;
});
```

---

## Liberar recursos

Sempre usar dispose quando necessário.

```dart
dispose()
```

---

## Separar lógica da interface

Evitar colocar regras complexas dentro do build.

---

## Evitar rebuilds excessivos

Rebuilds desnecessários podem reduzir o desempenho.

---

# Principais diferenças entre Stateless e Stateful

| Característica               | Stateless | Stateful |
| ---------------------------- | --------- | -------- |
| Possui estado                | Não       | Sim      |
| Atualiza interface           | Não       | Sim      |
| Mais simples                 | Sim       | Não      |
| Menor consumo de memória     | Sim       | Não      |
| Possui setState              | Não       | Sim      |
| Ciclo de vida simples        | Sim       | Não      |
| Ideal para conteúdo fixo     | Sim       | Não      |
| Ideal para conteúdo dinâmico | Não       | Sim      |

---

# Resumo

O `MaterialApp` é a base de aplicações Flutter que utilizam Material Design. O Flutter oferece uma grande coleção de widgets prontos seguindo as diretrizes visuais do Google. Widgets `Stateless` são utilizados para interfaces imutáveis, enquanto widgets `Stateful` permitem alterações dinâmicas através do gerenciamento de estado utilizando `setState()`. Compreender essas diferenças é fundamental para criar aplicações organizadas, eficientes e fáceis de manter.
