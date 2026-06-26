# Flutter – Persistência de Dados e SharedPreferences

---

# O que é persistência de dados em aplicativos Flutter e por que é importante?

Persistência de dados é a capacidade de armazenar informações de forma permanente, permitindo que elas continuem disponíveis mesmo após o aplicativo ser fechado ou o dispositivo ser desligado.

Sem persistência, todos os dados armazenados em memória são perdidos quando o aplicativo é encerrado.

## Exemplos de dados que geralmente precisam ser persistidos:

* Usuário logado;
* Preferência de tema (claro ou escuro);
* Configurações do aplicativo;
* Idioma escolhido pelo usuário;
* Histórico de pesquisas;
* Dados de formulários;
* Informações de autenticação;
* Dados baixados da internet para uso offline.

---

# Por que a persistência é importante?

A persistência de dados melhora significativamente a experiência do usuário porque:

* Evita que o usuário tenha que configurar o aplicativo novamente;
* Permite utilizar o aplicativo offline;
* Reduz requisições desnecessárias à internet;
* Mantém preferências e informações pessoais;
* Permite salvar o progresso do usuário.

Exemplo:

Um aplicativo de notas precisa salvar as anotações para que elas continuem disponíveis mesmo após o fechamento do aplicativo.

---

# Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?

O Flutter oferece diversas formas de armazenamento, dependendo da complexidade dos dados.

## 1. Dados simples

Exemplos:

* String;
* int;
* double;
* bool;
* List<String>.

Normalmente utiliza-se:

* SharedPreferences.

---

## 2. Dados estruturados

Exemplos:

* Usuários;
* Produtos;
* Mensagens;
* Pedidos.

Normalmente utiliza-se:

* SQLite;
* Hive;
* Isar.

---

## 3. Arquivos

Exemplos:

* PDFs;
* Imagens;
* Vídeos;
* Arquivos de configuração.

Utiliza-se:

* dart:io;
* path_provider.

---

## 4. Dados remotos

Exemplos:

* Informações em um servidor;
* Banco de dados na nuvem.

Utiliza-se:

* APIs REST;
* Firebase.

---

# O que é o pacote SharedPreferences em Flutter e como ele funciona?

O `SharedPreferences` é um pacote utilizado para armazenar pequenas quantidades de dados em formato de chave e valor.

Seu funcionamento é semelhante a um pequeno banco de configurações.

Exemplo:

```text
nome → João
idade → 22
temaEscuro → true
```

---

## Adicionando a dependência

```yaml
dependencies:
  shared_preferences: ^2.2.3
```

---

## Importando

```dart
import 'package:shared_preferences/shared_preferences.dart';
```

---

# Salvando dados

## Salvando uma String

```dart
final prefs =
    await SharedPreferences.getInstance();

await prefs.setString(
  'nome',
  'João',
);
```

---

## Salvando um inteiro

```dart
await prefs.setInt(
  'idade',
  22,
);
```

---

## Salvando um boolean

```dart
await prefs.setBool(
  'temaEscuro',
  true,
);
```

---

## Salvando um double

```dart
await prefs.setDouble(
  'altura',
  1.80,
);
```

---

## Salvando uma lista de Strings

```dart
await prefs.setStringList(
  'cidades',
  [
    'São Paulo',
    'Curitiba',
    'Florianópolis',
  ],
);
```

---

# Lendo dados

## String

```dart
String? nome =
    prefs.getString('nome');
```

---

## Inteiro

```dart
int? idade =
    prefs.getInt('idade');
```

---

## Boolean

```dart
bool? tema =
    prefs.getBool('temaEscuro');
```

---

## Lista

```dart
List<String>? cidades =
    prefs.getStringList(
      'cidades',
    );
```

---

# Removendo um dado

```dart
await prefs.remove('nome');
```

---

# Limpando tudo

```dart
await prefs.clear();
```

---

# Quais são as limitações do SharedPreferences em termos de armazenamento de dados?

Apesar de ser extremamente útil, o SharedPreferences possui algumas limitações.

## Não é um banco de dados.

Ele não foi criado para armazenar grandes volumes de dados.

---

## Não suporta objetos complexos diretamente.

Isto não funciona:

```dart
Usuario usuario;
```

É necessário converter o objeto para JSON.

---

## Não é adequado para:

* milhares de registros;
* imagens;
* vídeos;
* arquivos grandes;
* consultas complexas.

---

## Não possui relacionamentos.

Não existem:

* tabelas;
* chaves estrangeiras;
* consultas SQL.

---

## Não possui criptografia nativa.

Dados sensíveis não devem ser armazenados diretamente.

Exemplos:

* senhas;
* tokens bancários;
* informações financeiras.

Para isso, recomenda-se:

* flutter_secure_storage.

---

# Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?

O SharedPreferences é ideal para pequenas configurações.

Exemplos:

* tema claro/escuro;
* usuário já autenticado;
* idioma;
* primeira execução do aplicativo;
* configurações simples.

---

## Exemplo

Salvar o tema:

```dart
await prefs.setBool(
  'darkMode',
  true,
);
```

---

## Exemplo

Salvar se o usuário já viu o tutorial:

```dart
await prefs.setBool(
  'tutorial',
  true,
);
```

---

# Quando NÃO usar SharedPreferences?

Evite utilizar para:

* lista de produtos;
* sistema de mensagens;
* grande quantidade de dados;
* armazenamento de arquivos;
* banco de dados completo.

Nesses casos é melhor utilizar:

* SQLite;
* Hive;
* Isar;
* Firebase.

---

# Como posso lidar com erros ao usar SharedPreferences?

Embora seja simples de utilizar, ainda é uma boa prática tratar possíveis erros.

## Exemplo

```dart
try {
  final prefs =
      await SharedPreferences
          .getInstance();

  await prefs.setString(
    'nome',
    'João',
  );
}
catch (e) {
  print(
    'Erro ao salvar: $e',
  );
}
```

---

## Lendo com segurança

```dart
String nome =
    prefs.getString(
      'nome',
    ) ??
    'Usuário';
```

O operador `??` evita erros caso o valor não exista.

---

# Quais são as melhores práticas para usar SharedPreferences de forma eficiente?

## 1. Utilize apenas para dados pequenos.

✔ Correto:

```dart
temaEscuro = true
```

❌ Errado:

```dart
listaCom10000Produtos
```

---

## 2. Centralize o acesso em uma classe.

Exemplo:

```dart
class Preferencias {
  Future<void>
      salvarTema(
    bool valor,
  ) async {
    final prefs =
        await SharedPreferences
            .getInstance();

    await prefs.setBool(
      'tema',
      valor,
    );
  }
}
```

---

## 3. Utilize constantes para as chaves.

```dart
const chaveTema =
    'temaEscuro';
```

Evita erros de digitação.

---

## 4. Sempre trate valores nulos.

```dart
bool tema =
    prefs.getBool(
      'temaEscuro',
    ) ??
    false;
```

---

## 5. Não salve informações sensíveis.

Evite armazenar:

* senhas;
* tokens bancários;
* informações pessoais críticas.

---

## 6. Carregue as preferências apenas quando necessário.

Evite:

```dart
await SharedPreferences
    .getInstance();
```

várias vezes seguidas sem necessidade.

---

# Exemplo completo

## Salvando um tema

```dart
Future<void> salvarTema(
  bool escuro,
) async {
  final prefs =
      await SharedPreferences
          .getInstance();

  await prefs.setBool(
    'tema',
    escuro,
  );
}
```

---

## Lendo o tema

```dart
Future<bool> obterTema()
async {
  final prefs =
      await SharedPreferences
          .getInstance();

  return prefs.getBool(
        'tema',
      ) ??
      false;
}
```

---

# Resumo

| Recurso                | Finalidade               |
| ---------------------- | ------------------------ |
| SharedPreferences      | Pequenos dados           |
| setString              | Salvar String            |
| setInt                 | Salvar inteiro           |
| setBool                | Salvar boolean           |
| setDouble              | Salvar decimal           |
| setStringList          | Salvar lista             |
| getString              | Ler String               |
| remove                 | Remover dado             |
| clear                  | Limpar tudo              |
| flutter_secure_storage | Dados sensíveis          |
| SQLite/Hive/Isar       | Grandes volumes de dados |

O `SharedPreferences` é uma excelente solução para armazenar pequenas configurações e preferências do usuário em aplicações Flutter. Ele é simples, rápido e fácil de utilizar, mas não deve ser utilizado como substituto de um banco de dados completo. Escolher a solução de persistência adequada é essencial para construir aplicações escaláveis, seguras e de fácil manutenção.