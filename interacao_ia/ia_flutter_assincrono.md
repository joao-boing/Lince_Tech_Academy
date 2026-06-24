# Flutter – Programação Assíncrona, HTTP e JSON

---

# O que é programação assíncrona em Flutter e por que ela é importante?

A programação assíncrona é uma técnica que permite executar tarefas que levam tempo sem bloquear a execução principal da aplicação.

Em Flutter, a interface do usuário (UI) é executada em uma única thread principal. Se uma operação demorada for executada de forma síncrona, a aplicação pode travar temporariamente, gerando uma experiência ruim para o usuário.

---

## Exemplos de operações assíncronas

* Requisições HTTP
* Leitura e gravação de arquivos
* Consultas em banco de dados
* Acesso ao armazenamento local
* Operações de rede
* Downloads e uploads
* Acesso à câmera
* Geolocalização

---

## Exemplo ruim

```dart
lerArquivoGigante();
```

Enquanto o arquivo é lido, a interface pode congelar.

---

## Exemplo correto

```dart
await lerArquivoGigante();
```

A interface continua funcionando normalmente enquanto a operação é realizada.

---

# Por que ela é importante?

A programação assíncrona:

* Evita travamentos da interface.
* Melhora a experiência do usuário.
* Permite executar tarefas demoradas em segundo plano.
* Torna a aplicação mais responsiva.

---

# Quais cuidados devo ter usando programação assíncrona?

## Não esquecer o await

Errado:

```dart
salvarDados();
```

Correto:

```dart
await salvarDados();
```

---

## Sempre tratar erros

```dart
try {
  await buscarDados();
} catch (e) {
  print(e);
}
```

---

## Não fazer operações pesadas na UI

Cálculos muito grandes podem travar a aplicação.

---

## Evitar vários awaits desnecessários

Ruim:

```dart
await tarefa1();
await tarefa2();
await tarefa3();
```

Melhor:

```dart
await Future.wait([
  tarefa1(),
  tarefa2(),
  tarefa3(),
]);
```

---

## Verificar se o widget ainda existe

```dart
if (!mounted) return;
```

Muito importante em widgets Stateful.

---

# O que são isolates em Flutter?

Um Isolate é uma unidade de execução independente.

Cada isolate possui:

* sua própria memória;
* sua própria pilha de execução;
* seu próprio Event Loop.

Os isolates não compartilham memória entre si.

---

## Por que eles existem?

Para executar tarefas pesadas sem travar a interface.

---

## Exemplos

* Processamento de imagens;
* Compressão de arquivos;
* Criptografia;
* Grandes cálculos matemáticos;
* Leitura de arquivos enormes.

---

## Exemplo

```dart
final resultado =
    await compute(calcular, dados);
```

---

# Quais cuidados devo ter ao usar isolates em Flutter?

## Não usar para tarefas pequenas.

Criar um isolate possui custo.

---

## Não compartilhar objetos diretamente.

Isto não funciona:

```dart
lista.add(valor);
```

Cada isolate possui memória própria.

---

## Comunicação é feita por mensagens.

```dart
SendPort
ReceivePort
```

---

## Evitar criar muitos isolates.

Pode aumentar o consumo de memória.

---

# Qual o conceito do Loop de Eventos em Flutter?

O Event Loop é um mecanismo responsável por executar tarefas assíncronas.

Ele verifica continuamente:

* eventos da interface;
* timers;
* Futures concluídos;
* callbacks.

---

## Funcionamento simplificado

```text
Evento
 ↓
Fila de Eventos
 ↓
Event Loop
 ↓
Execução
```

---

## Exemplo

```dart
print('A');

Future(() {
  print('B');
});

print('C');
```

Saída:

```text
A
C
B
```

Porque o Future é colocado na fila de eventos.

---

# O que é um Future em Dart e como ele funciona?

Um `Future` representa um valor que estará disponível no futuro.

---

## Exemplo

```dart
Future<String>
```

Significa:

> "Eu retornarei uma String futuramente."

---

## Estados de um Future

### Incompleto

```text
Pending
```

---

### Concluído com sucesso

```text
Completed
```

---

### Concluído com erro

```text
Error
```

---

## Exemplo

```dart
Future<String> buscarNome() async {
  return 'João';
}
```

---

# Como posso usar async e await para trabalhar com Futures?

---

## async

Transforma uma função em assíncrona.

```dart
Future<void> salvar() async {

}
```

---

## await

Espera o término do Future.

```dart
await salvar();
```

---

## Exemplo

```dart
Future<void> carregar() async {
  String nome =
      await buscarNome();

  print(nome);
}
```

---

# Como posso lidar com erros em operações assíncronas usando try-catch?

```dart
try {
  await buscarDados();
}
catch (e) {
  print(e);
}
```

---

## Exemplo

```dart
try {
  final resposta =
      await api.buscarUsuarios();
}
catch (e) {
  print('Erro: $e');
}
finally {
  print('Fim');
}
```

---

# Traga a explicação dos métodos HTTP.

HTTP é um protocolo de comunicação utilizado entre cliente e servidor.

---

# GET

Busca dados.

```http
GET /usuarios
```

---

# POST

Cria um novo recurso.

```http
POST /usuarios
```

---

# PUT

Atualiza um recurso inteiro.

```http
PUT /usuarios/1
```

---

# PATCH

Atualiza parcialmente um recurso.

```http
PATCH /usuarios/1
```

---

# DELETE

Remove um recurso.

```http
DELETE /usuarios/1
```

---

# Como posso lidar com diferentes códigos de resposta HTTP (200, 404, 500)?

```dart
if (response.statusCode == 200) {

}
else if (response.statusCode == 404) {

}
else if (response.statusCode == 500) {

}
```

---

## Principais códigos

| Código | Significado         |
| ------ | ------------------- |
| 200    | Sucesso             |
| 201    | Criado              |
| 204    | Sem conteúdo        |
| 400    | Requisição inválida |
| 401    | Não autorizado      |
| 403    | Proibido            |
| 404    | Não encontrado      |
| 500    | Erro interno        |

---

## Exemplo

```dart
switch (response.statusCode) {
  case 200:
    break;

  case 404:
    throw Exception('Não encontrado');

  case 500:
    throw Exception('Erro no servidor');
}
```

---

# O que é JSON e como ele é usado em Flutter?

JSON significa:

```text
JavaScript Object Notation
```

É um formato de troca de dados.

---

## Exemplo

```json
{
  "nome": "João",
  "idade": 25
}
```

Grande parte das APIs retorna dados em JSON.

---

# Como posso acessar valores específicos em um objeto JSON?

Primeiro convertemos:

```dart
final dados =
    jsonDecode(jsonString);
```

Depois:

```dart
print(dados['nome']);
print(dados['idade']);
```

---

# Como posso lidar com arrays (listas) em JSON em Flutter?

Exemplo:

```json
{
  "nomes": [
    "João",
    "Maria",
    "Pedro"
  ]
}
```

---

## Acessando

```dart
dados['nomes'];
```

---

# Como posso iterar sobre os elementos de um array JSON?

```dart
for (var nome in dados['nomes']) {
  print(nome);
}
```

---

## Usando forEach

```dart
dados['nomes'].forEach(
  (nome) {
    print(nome);
  },
);
```

---

# Por que é útil mapear JSON para classes Dart?

Sem mapeamento:

```dart
dados['usuario']['endereco']['cidade']
```

Código difícil de manter.

---

Com classes:

```dart
usuario.endereco.cidade
```

Benefícios:

* Autocompletar;
* Menos erros;
* Código organizado;
* Maior legibilidade;
* Melhor manutenção.

---

# Como posso usar factory para criar objetos Dart a partir de JSON?

## Exemplo

```dart
class Usuario {
  final String nome;
  final int idade;

  Usuario({
    required this.nome,
    required this.idade,
  });

  factory Usuario.fromJson(
      Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      idade: json['idade'],
    );
  }
}
```

---

## Utilizando

```dart
Usuario usuario =
    Usuario.fromJson(dados);
```

---

# Como posso usar toJson() para converter objetos Dart em JSON?

```dart
class Usuario {
  final String nome;
  final int idade;

  Usuario({
    required this.nome,
    required this.idade,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
    };
  }
}
```

---

## Convertendo para String JSON

```dart
String json =
    jsonEncode(usuario.toJson());
```

---

# Como organizar minhas requisições no meu código Flutter?

Uma boa prática é separar responsabilidades.

---

## Estrutura sugerida

```text
lib/
│
├── models/
│     usuario.dart
│
├── services/
│     usuario_service.dart
│
├── repositories/
│     usuario_repository.dart
│
├── screens/
│
└── widgets/
```

---

# Exemplo

## Model

```dart
usuario.dart
```

Responsável pelos dados.

---

## Service

```dart
usuario_service.dart
```

Responsável pelas chamadas HTTP.

---

## Repository

```dart
usuario_repository.dart
```

Responsável pela comunicação entre a interface e o serviço.

---

## Screen

Responsável apenas pela interface.

---

# Exemplo de fluxo

```text
Tela
 ↓
Repository
 ↓
Service
 ↓
API
```

---

# Resumo

| Conceito   | Finalidade                   |
| ---------- | ---------------------------- |
| Future     | Resultado futuro             |
| async      | Torna função assíncrona      |
| await      | Espera um Future             |
| Isolate    | Execução paralela            |
| Event Loop | Gerencia eventos assíncronos |
| GET        | Buscar dados                 |
| POST       | Criar dados                  |
| PUT        | Atualizar totalmente         |
| PATCH      | Atualizar parcialmente       |
| DELETE     | Remover dados                |
| JSON       | Formato de troca de dados    |
| fromJson   | Converter JSON em objeto     |
| toJson     | Converter objeto em JSON     |
| try-catch  | Tratar erros                 |
| Repository | Organizar acesso aos dados   |

A programação assíncrona é uma das bases do Flutter moderno, permitindo que a aplicação permaneça fluida enquanto executa operações demoradas. O uso correto de `Future`, `async`, `await`, `HTTP` e `JSON` é essencial para construir aplicações robustas, escaláveis e capazes de consumir APIs de forma eficiente.

# Flutter – Mensagens de Carregamento e Consumo de APIs

---

# Como posso exibir uma mensagem de carregamento enquanto a requisição HTTP está em andamento?

Em aplicações Flutter, as requisições HTTP geralmente levam algum tempo para serem concluídas. Durante esse período, é importante informar ao usuário que algo está acontecendo, evitando a sensação de que o aplicativo travou.

As formas mais comuns de exibir um carregamento são:

* `CircularProgressIndicator`
* `LinearProgressIndicator`
* Texto de carregamento
* Dialogs de carregamento
* Widget `FutureBuilder`

---

# Utilizando uma variável de controle

A forma mais simples é criar uma variável booleana que indique se a requisição está sendo executada.

```dart
bool carregando = false;
```

---

## Iniciando a requisição

```dart
setState(() {
  carregando = true;
});
```

---

## Finalizando a requisição

```dart
setState(() {
  carregando = false;
});
```

---

## Exibindo o indicador

```dart
carregando
  ? CircularProgressIndicator()
  : Text('Dados carregados');
```

---

# Exemplo completo

```dart
bool carregando = false;

Future<void> buscarDados() async {
  setState(() {
    carregando = true;
  });

  await Future.delayed(
    Duration(seconds: 3),
  );

  setState(() {
    carregando = false;
  });
}
```

---

## Interface

```dart
Column(
  children: [

    if (carregando)
      CircularProgressIndicator(),

    ElevatedButton(
      onPressed: buscarDados,
      child: Text('Buscar'),
    ),
  ],
)
```

---

# Utilizando CircularProgressIndicator

É o indicador de carregamento mais utilizado no Flutter.

```dart
CircularProgressIndicator()
```

---

## Exemplo

```dart
Center(
  child: CircularProgressIndicator(),
)
```

---

# Utilizando LinearProgressIndicator

```dart
LinearProgressIndicator()
```

---

## Exemplo

```dart
Column(
  children: [
    LinearProgressIndicator(),
    Text('Carregando...')
  ],
)
```

---

# Exibindo uma mensagem de carregamento

```dart
Column(
  children: [
    CircularProgressIndicator(),
    SizedBox(height: 20),
    Text('Buscando informações...')
  ],
)
```

---

# Exibindo um Dialog de carregamento

```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (_) {
    return Center(
      child:
          CircularProgressIndicator(),
    );
  },
);
```

---

## Fechando o dialog

```dart
Navigator.pop(context);
```

---

# Utilizando FutureBuilder

O `FutureBuilder` é um widget criado especificamente para trabalhar com operações assíncronas.

---

## Exemplo

```dart
FutureBuilder(
  future: buscarUsuarios(),
  builder: (context, snapshot) {

    if (snapshot.connectionState ==
        ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    if (snapshot.hasError) {
      return Text(
        'Erro ao carregar dados',
      );
    }

    return Text(
      'Dados carregados',
    );
  },
)
```

---

# Estados do FutureBuilder

| Estado  | Significado           |
| ------- | --------------------- |
| none    | Nenhuma operação      |
| waiting | Carregando            |
| active  | Operação em andamento |
| done    | Operação concluída    |

---

# De exemplos de consumo a API's em Flutter?

Para consumir APIs em Flutter, normalmente utilizamos o pacote:

```yaml
dependencies:
  http: ^1.2.0
```

---

## Import

```dart
import 'package:http/http.dart'
    as http;
```

---

# Exemplo 1 – Consumindo uma API GET

API:

```text
https://jsonplaceholder.typicode.com/users
```

---

## Fazendo a requisição

```dart
Future<void> buscarUsuarios()
async {

  final response =
      await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/users',
        ),
      );

  print(response.body);
}
```

---

# Exemplo 2 – Convertendo JSON

```dart
import 'dart:convert';
```

```dart
final dados =
    jsonDecode(response.body);
```

---

## Percorrendo os dados

```dart
for (var usuario in dados) {
  print(usuario['name']);
}
```

---

# Exemplo 3 – Criando uma classe

```dart
class Usuario {
  final int id;
  final String nome;
  final String email;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory Usuario.fromJson(
      Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['name'],
      email: json['email'],
    );
  }
}
```

---

# Convertendo o JSON em objetos

```dart
List<Usuario> usuarios =
    dados.map<Usuario>((json) {
      return Usuario.fromJson(json);
    }).toList();
```

---

# Exemplo completo

```dart
Future<List<Usuario>>
buscarUsuarios() async {

  final response =
      await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/users',
        ),
      );

  if (response.statusCode == 200) {
    final dados =
        jsonDecode(response.body);

    return dados
        .map<Usuario>((json) =>
            Usuario.fromJson(json))
        .toList();
  }

  throw Exception(
      'Erro ao buscar usuários');
}
```

---

# Exibindo na tela

```dart
FutureBuilder<List<Usuario>>(
  future: buscarUsuarios(),
  builder: (context, snapshot) {

    if (snapshot.connectionState ==
        ConnectionState.waiting) {
      return Center(
        child:
            CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Text(
        'Erro ao carregar usuários',
      );
    }

    final usuarios =
        snapshot.data!;

    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) {

        final usuario =
            usuarios[index];

        return ListTile(
          title: Text(usuario.nome),
          subtitle:
              Text(usuario.email),
        );
      },
    );
  },
)
```

---

# Exemplo 4 – Enviando dados com POST

```dart
Future<void> criarUsuario()
async {

  final response =
      await http.post(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/users',
        ),
        body: {
          'name': 'João',
          'email':
              'joao@email.com',
        },
      );

  print(response.statusCode);
}
```

---

# Exemplo 5 – Enviando JSON

```dart
await http.post(
  Uri.parse(url),
  headers: {
    'Content-Type':
        'application/json',
  },
  body: jsonEncode({
    'nome': 'João',
    'idade': 22,
  }),
);
```

---

# Exemplo 6 – Atualizando dados

```dart
await http.put(
  Uri.parse(
    '$url/1',
  ),
  body: {
    'nome': 'João Silva',
  },
);
```

---

# Exemplo 7 – Deletando dados

```dart
await http.delete(
  Uri.parse(
    '$url/1',
  ),
);
```

---

# Estrutura recomendada para APIs

```text
lib/
│
├── models/
│     usuario.dart
│
├── services/
│     api_service.dart
│
├── repositories/
│     usuario_repository.dart
│
├── screens/
│
└── widgets/
```

---

# Exemplo de organização

```text
Tela
 ↓
Repository
 ↓
Service
 ↓
API
```

---

# Fluxo completo de uma requisição

```text
Usuário clica no botão
            ↓
      Exibe Loading
            ↓
       Faz HTTP GET
            ↓
Recebe JSON da API
            ↓
 Converte para objetos
            ↓
 Atualiza a interface
            ↓
 Esconde o Loading
```

---

# Resumo

| Recurso                   | Finalidade                    |
| ------------------------- | ----------------------------- |
| CircularProgressIndicator | Loading circular              |
| LinearProgressIndicator   | Barra de progresso            |
| FutureBuilder             | Trabalhar com Futures         |
| http.get                  | Buscar dados                  |
| http.post                 | Criar dados                   |
| http.put                  | Atualizar dados               |
| http.delete               | Remover dados                 |
| jsonDecode                | Converter JSON                |
| jsonEncode                | Converter para JSON           |
| fromJson                  | Criar objeto a partir do JSON |
| toJson                    | Converter objeto para JSON    |

Exibir um indicador de carregamento é uma prática essencial em aplicações Flutter, pois melhora significativamente a experiência do usuário. O consumo de APIs normalmente envolve requisições HTTP, tratamento de erros, conversão de JSON e atualização da interface de forma assíncrona, sendo o `FutureBuilder` e o `CircularProgressIndicator` duas das ferramentas mais utilizadas nesse processo.