# Flutter – Gerenciamento de Estado com Provider

---

# O que é gerenciamento de estados em Flutter e por que é importante?

O gerenciamento de estado é o conjunto de técnicas utilizadas para armazenar, modificar e compartilhar dados dentro de uma aplicação Flutter.

Em Flutter, a interface é construída a partir de widgets. Sempre que algum dado muda, os widgets que dependem desse dado precisam ser atualizados.

Esses dados que podem mudar ao longo da execução da aplicação são chamados de **estado**.

Exemplos:

* Usuário logado;
* Tema escuro ou claro;
* Carrinho de compras;
* Lista de tarefas;
* Dados vindos de uma API;
* Valor de um contador;
* Formulários.

---

## Por que é importante?

Uma aplicação sem gerenciamento de estado adequado pode apresentar diversos problemas:

* Código difícil de manter;
* Muitas reconstruções desnecessárias;
* Compartilhamento de dados complicado;
* Acoplamento excessivo entre widgets;
* Dificuldade para testar o código.

Um bom gerenciamento de estado torna a aplicação:

* Mais organizada;
* Mais escalável;
* Mais performática;
* Mais fácil de manter.

---

# O que é estado em Flutter?

Estado é qualquer informação que pode mudar durante a execução do aplicativo.

Exemplo:

```dart
int contador = 0;
```

Quando o valor de `contador` muda, a interface precisa ser reconstruída.

---

# Qual a diferença entre estado local e estado global em um aplicativo Flutter?

## Estado Local

É um estado utilizado apenas por um widget específico.

Exemplo:

* Checkbox;
* Campo de texto;
* Índice de uma página.

```dart
bool carregando = false;
```

Normalmente é gerenciado usando:

* StatefulWidget
* setState()

---

## Estado Global

É um estado compartilhado por vários widgets.

Exemplo:

* Usuário autenticado;
* Configuração de tema;
* Carrinho de compras;
* Lista de favoritos.

Exemplo:

```dart
Usuario usuarioLogado;
```

Esse estado geralmente é gerenciado utilizando:

* Provider;
* Riverpod;
* Bloc;
* GetX.

---

# Comparação

| Estado Local         | Estado Global     |
| -------------------- | ----------------- |
| Pertence a um widget | Compartilhado     |
| Fácil de controlar   | Mais complexo     |
| Usa setState         | Usa gerenciadores |
| Vida curta           | Vida longa        |

---

# Quais as vantagens de usar um gerenciador de estados em um projeto Flutter?

## Organização

Cada responsabilidade fica separada.

---

## Escalabilidade

A aplicação cresce sem se tornar difícil de manter.

---

## Reutilização

Os dados podem ser utilizados em várias telas.

---

## Performance

Evita reconstruções desnecessárias.

---

## Testabilidade

O código fica mais fácil de testar.

---

# O que é o pacote Provider em Flutter e para que ele serve?

O Provider é um dos gerenciadores de estado oficiais recomendados pela equipe do Flutter.

Ele permite:

* Compartilhar dados;
* Atualizar widgets automaticamente;
* Reduzir o acoplamento;
* Melhorar a organização do código.

---

## Adicionando a dependência

```yaml
dependencies:
  provider: ^6.1.2
```

---

# Como o Provider ajuda a evitar a reconstrução desnecessária de widgets?

Com `setState`, normalmente todo o widget é reconstruído.

```dart
setState(() {
  contador++;
});
```

Com o Provider, apenas os widgets que dependem do estado são reconstruídos.

Isso melhora significativamente a performance da aplicação.

---

# Como o Provider simplifica o gerenciamento de estados em Flutter?

Ele permite:

* Centralizar os dados;
* Compartilhar estados;
* Atualizar widgets automaticamente;
* Separar interface e lógica.

Fluxo:

```text
ChangeNotifier
      ↓
Provider
      ↓
Consumer
      ↓
Widgets
```

---

# O que é o ChangeNotifierProvider e como ele funciona?

O `ChangeNotifierProvider` é um provider especializado em fornecer objetos que herdam de `ChangeNotifier`.

Esses objetos podem avisar aos widgets quando houve uma alteração.

---

## Exemplo

```dart
class Contador extends ChangeNotifier {
  int valor = 0;

  void incrementar() {
    valor++;
    notifyListeners();
  }
}
```

---

# O que é notifyListeners()?

É o método responsável por avisar todos os widgets que utilizam aquele estado que houve uma alteração.

```dart
notifyListeners();
```

---

# Como posso fornecer um ChangeNotifier para a árvore de widgets usando ChangeNotifierProvider?

```dart
ChangeNotifierProvider(
  create: (_) => Contador(),
  child: MyApp(),
)
```

Normalmente é utilizado no `main.dart`.

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Contador(),
      child: MyApp(),
    ),
  );
}
```

---

# Como posso atualizar o estado do meu aplicativo usando providers?

```dart
context.read<Contador>()
    .incrementar();
```

ou

```dart
Provider.of<Contador>(
  context,
  listen: false,
).incrementar();
```

---

# O que é o Consumer e como ele funciona?

O `Consumer` é um widget que escuta alterações em um Provider.

Sempre que o estado mudar, ele reconstrói apenas o widget que está dentro dele.

---

## Exemplo

```dart
Consumer<Contador>(
  builder: (
    context,
    contador,
    child,
  ) {
    return Text(
      '${contador.valor}',
    );
  },
)
```

---

# Como o Consumer ajuda a reconstruir apenas os widgets que dependem do estado?

Sem Consumer:

```text
Tela inteira reconstruída
```

Com Consumer:

```text
Somente o Text é reconstruído
```

Isso melhora a performance da aplicação.

---

# Como posso usar o Consumer para acessar o estado fornecido pelo ChangeNotifierProvider?

```dart
Consumer<Contador>(
  builder:
      (context, contador, child) {
    return Text(
      '${contador.valor}',
    );
  },
)
```

---

# Qual a diferença entre usar Consumer e Provider.of() para acessar o estado?

## Consumer

```dart
Consumer<Contador>()
```

Reconstrói apenas o widget interno.

---

## Provider.of()

```dart
Provider.of<Contador>(context)
```

Pode reconstruir o widget inteiro.

---

# Comparação

| Consumer             | Provider.of        |
| -------------------- | ------------------ |
| Mais performático    | Menos performático |
| Reconstrução parcial | Reconstrução maior |
| Mais recomendado     | Uso mais simples   |

---

# Como posso otimizar o uso do Consumer para evitar reconstruções desnecessárias?

Utilize o Consumer apenas no widget que realmente depende do estado.

Errado:

```dart
Consumer(
  builder: (_) {
    return Scaffold(
      ...
    );
  },
)
```

Correto:

```dart
Scaffold(
  body: Consumer(
    builder: (_) {
      return Text(...);
    },
  ),
)
```

---

# Aplicativo contador usando ChangeNotifierProvider e Consumer

## Classe do estado

```dart
class ContadorProvider
    extends ChangeNotifier {

  int contador = 0;

  void incrementar() {
    contador++;
    notifyListeners();
  }

  void decrementar() {
    contador--;
    notifyListeners();
  }
}
```

---

## main.dart

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create:
          (_) => ContadorProvider(),
      child: MyApp(),
    ),
  );
}
```

---

## Tela

```dart
class HomePage
    extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text('Contador'),
      ),
      body: Center(
        child:
            Consumer<
                ContadorProvider>(
          builder: (
            context,
            contador,
            child,
          ) {
            return Text(
              '${contador.contador}',
              style:
                  const TextStyle(
                fontSize: 40,
              ),
            );
          },
        ),
      ),
      floatingActionButton:
          Column(
        mainAxisAlignment:
            MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () {
              context
                  .read<
                      ContadorProvider>()
                  .incrementar();
            },
            child:
                const Icon(Icons.add),
          ),

          const SizedBox(
            height: 10,
          ),

          FloatingActionButton(
            onPressed: () {
              context
                  .read<
                      ContadorProvider>()
                  .decrementar();
            },
            child:
                const Icon(
                    Icons.remove),
          ),
        ],
      ),
    );
  }
}
```

---

# De exemplos de consumo a API's em Flutter?

## Service

```dart
class UsuarioService {

  Future<List<Usuario>>
      buscarUsuarios() async {

    final response =
        await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    final dados =
        jsonDecode(response.body);

    return dados
        .map<Usuario>(
          (json) =>
              Usuario.fromJson(
                  json),
        )
        .toList();
  }
}
```

---

## Provider

```dart
class UsuarioProvider
    extends ChangeNotifier {

  final service =
      UsuarioService();

  List<Usuario> usuarios = [];

  bool carregando = false;

  Future<void> carregar() async {
    carregando = true;
    notifyListeners();

    usuarios =
        await service
            .buscarUsuarios();

    carregando = false;
    notifyListeners();
  }
}
```

---

## Tela

```dart
Consumer<UsuarioProvider>(
  builder:
      (context, provider, child) {

    if (provider.carregando) {
      return const Center(
        child:
            CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount:
          provider.usuarios.length,
      itemBuilder:
          (context, index) {

        final usuario =
            provider.usuarios[index];

        return ListTile(
          title:
              Text(usuario.nome),
        );
      },
    );
  },
)
```

---

# Aplicativo de tema claro e escuro usando Provider

## Provider

```dart
class TemaProvider
    extends ChangeNotifier {

  bool temaEscuro = false;

  void alternarTema() {
    temaEscuro =
        !temaEscuro;

    notifyListeners();
  }
}
```

---

## main.dart

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create:
          (_) => TemaProvider(),
      child: const MyApp(),
    ),
  );
}
```

---

## MyApp

```dart
class MyApp
    extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(
      BuildContext context) {

    return Consumer<
        TemaProvider>(
      builder:
          (context, tema, child) {

        return MaterialApp(
          theme:
              ThemeData.light(),
          darkTheme:
              ThemeData.dark(),
          themeMode:
              tema.temaEscuro
                  ? ThemeMode.dark
                  : ThemeMode.light,
          home:
              const HomePage(),
        );
      },
    );
  }
}
```

---

## Tela

```dart
class HomePage
    extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(
      appBar:
          AppBar(
        title:
            const Text('Tema'),
      ),
      body: Center(
        child:
            Consumer<
                TemaProvider>(
          builder:
              (context,
                  tema,
                  child) {
            return Switch(
              value:
                  tema.temaEscuro,
              onChanged: (_) {
                tema.alternarTema();
              },
            );
          },
        ),
      ),
    );
  }
}
```

---

# Resumo

| Conceito               | Finalidade            |
| ---------------------- | --------------------- |
| Estado                 | Dados que podem mudar |
| Estado Local           | Pertence a um widget  |
| Estado Global          | Compartilhado         |
| Provider               | Gerenciador de estado |
| ChangeNotifier         | Notifica alterações   |
| notifyListeners        | Atualiza a interface  |
| ChangeNotifierProvider | Fornece o estado      |
| Consumer               | Escuta mudanças       |
| context.read           | Atualiza estado       |
| context.watch          | Observa estado        |

O Provider é uma das soluções mais utilizadas no Flutter para gerenciamento de estado, pois oferece simplicidade, boa performance e excelente integração com a árvore de widgets. Ele é ideal para aplicações pequenas e médias e serve como uma excelente introdução aos conceitos de gerenciamento de estado em Flutter.
