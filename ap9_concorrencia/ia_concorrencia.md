# Futures e Programação Assíncrona em Dart

---

# O que é um Future em Dart e como ele me ajuda a lidar com tarefas que levam tempo?

Um `Future` é um objeto que representa um valor que estará disponível em algum momento no futuro.

Ele é utilizado quando uma operação demora para ser concluída e não queremos que o programa fique travado aguardando o resultado.

---

# Analogia

Imagine que você fez um pedido em uma pizzaria.

Você não fica parado na porta esperando a pizza ficar pronta.

Você faz o pedido, continua suas atividades e, quando a pizza estiver pronta, ela será entregue.

Um `Future` funciona de forma parecida:

```text
Pedido realizado → Espera → Resultado entregue
```

---

# Exemplo

```dart
Future<String> buscarUsuario() async {

  await Future.delayed(
    Duration(seconds: 3),
  );

  return "João";
}
```

A função demora 3 segundos para retornar o nome.

---

# Consumindo o Future

```dart
Future<void> main() async {

  String usuario =
      await buscarUsuario();

  print(usuario);
}
```

### Saída

```text
João
```

---

# Estados de um Future

Todo Future passa por três possíveis estados.

---

## 1. Pendente

A operação ainda está sendo executada.

```text
Future iniciado
```

---

## 2. Concluído com sucesso

A operação terminou normalmente.

```text
Resultado retornado
```

---

## 3. Concluído com erro

Ocorreu alguma falha.

```text
Exception lançada
```

---

# O que significam os termos 'assíncrono' e 'síncrono'?

---

# Programação síncrona

As instruções são executadas uma após a outra.

Cada linha espera a anterior terminar.

---

## Exemplo

```dart
print("A");

print("B");

print("C");
```

### Saída

```text
A
B
C
```

---

# Características

- Ordem previsível
- Mais simples de entender
- Pode bloquear o programa

---

# Programação assíncrona

Permite iniciar tarefas demoradas sem bloquear o restante da aplicação.

---

## Exemplo

```dart
print("Início");

buscarDados();

print("Fim");
```

### Possível saída

```text
Início
Fim
Dados recebidos
```

---

# Características

- Não bloqueia execução
- Melhor desempenho
- Ideal para operações demoradas

---

# Comparação

| Síncrono | Assíncrono |
|-----------|-----------|
| Espera terminar | Continua executando |
| Mais simples | Mais flexível |
| Pode travar interface | Mantém responsividade |

---

# O que acontece se um Future falhar e como posso lidar com esse erro?

Quando uma exceção acontece dentro de um Future, ele é concluído com erro.

---

# Exemplo

```dart
Future<String> buscarUsuario() async {

  throw Exception(
    "Erro ao buscar usuário"
  );
}
```

---

# Tratando com try/catch

```dart
Future<void> main() async {

  try {

    String usuario =
        await buscarUsuario();

    print(usuario);

  } catch (e) {

    print("Erro: $e");
  }
}
```

---

### Saída

```text
Erro: Exception: Erro ao buscar usuário
```

---

# Existe uma forma de executar várias tarefas assíncronas em paralelo?

Sim.

Podemos usar `Future.wait()`.

---

# Problema

Imagine duas operações:

```dart
await buscarUsuarios();

await buscarProdutos();
```

A segunda só começa quando a primeira termina.

---

# Solução

```dart
await Future.wait([
  buscarUsuarios(),
  buscarProdutos(),
]);
```

Agora ambas executam ao mesmo tempo.

---

# Exemplo

```dart
Future<String> tarefa1() async {

  await Future.delayed(
    Duration(seconds: 2),
  );

  return "Tarefa 1";
}

Future<String> tarefa2() async {

  await Future.delayed(
    Duration(seconds: 2),
  );

  return "Tarefa 2";
}
```

---

## Executando em paralelo

```dart
Future<void> main() async {

  List resultados =
      await Future.wait([
        tarefa1(),
        tarefa2(),
      ]);

  print(resultados);
}
```

---

### Saída

```text
[Tarefa 1, Tarefa 2]
```

As duas terminam em aproximadamente 2 segundos.

---

# Em quais situações devo usar Futures em meu código Dart?

Sempre que uma operação puder levar tempo.

---

# Casos mais comuns

---

## Requisições HTTP

```dart
http.get(...)
```

---

## Buscar dados de APIs

```dart
buscarUsuarios()
```

---

## Banco de dados

```dart
consultarClientes()
```

---

## Ler arquivos

```dart
File.readAsString()
```

---

## Salvar arquivos

```dart
File.writeAsString()
```

---

## Downloads

```dart
baixarImagem()
```

---

## Uploads

```dart
enviarArquivo()
```

---

# Quais cuidados devo tomar ao não usar await em funções Future?

Esse é um dos erros mais comuns entre iniciantes.

---

# Problema 1: Código executa antes da hora

```dart
buscarDados();

print("Finalizado");
```

### Saída

```text
Finalizado
Dados recebidos
```

Talvez você esperasse a ordem inversa.

---

# Problema 2: Resultado não disponível

```dart
Future<String> nome =
    buscarUsuario();

print(nome);
```

### Saída

```text
Instance of 'Future<String>'
```

Você recebeu o Future, não o resultado.

---

# Correto

```dart
String nome =
    await buscarUsuario();
```

---

# Problema 3: Erros podem passar despercebidos

```dart
buscarUsuario();
```

Se ocorrer uma exceção, talvez ela nunca seja tratada.

---

# Problema 4: Condições de corrida

O programa pode tentar usar dados antes de eles existirem.

---

## Exemplo

```dart
carregarUsuarios();

mostrarUsuarios();
```

Se os usuários ainda não foram carregados:

```text
Lista vazia
```

---

# Como lidar com erros usando Future?

Existem duas formas principais.

---

# Método 1: try/catch

Mais utilizado atualmente.

---

## Exemplo

```dart
try {

  String resultado =
      await buscarDados();

  print(resultado);

} catch (e) {

  print("Erro: $e");
}
```

---

# Método 2: catchError

Pode ser usado diretamente no Future.

---

## Exemplo

```dart
buscarDados()
  .then((valor) {

    print(valor);

  }).catchError((erro) {

    print("Erro: $erro");
  });
```

---

# Exemplo completo

```dart
Future<String> buscarDados() async {

  throw Exception("Falha");
}
```

```dart
buscarDados()
  .then((valor) {

    print(valor);

  }).catchError((erro) {

    print(erro);
  });
```

---

# Qual abordagem devo preferir?

Na maioria dos casos:

```dart
async + await + try/catch
```

é mais legível e mais próxima da programação tradicional.

---

# Resumo Geral

| Conceito | Descrição |
|-----------|-----------|
| Future | Resultado que chegará futuramente |
| Síncrono | Executa uma instrução por vez |
| Assíncrono | Não bloqueia a execução |
| await | Aguarda um Future terminar |
| async | Define função assíncrona |
| Future.wait() | Executa vários Futures em paralelo |
| try/catch | Trata erros de Futures |
| catchError() | Trata erros diretamente no Future |
| Future pendente | Ainda executando |
| Future concluído | Terminou com sucesso |
| Future com erro | Terminou lançando exceção |