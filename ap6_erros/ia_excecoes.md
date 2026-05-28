# Tratamento de Erros e Exceções em Dart

---

# Qual a diferença entre um erro e uma exceção em Dart?

Em Dart, erros e exceções representam problemas que acontecem durante a execução do programa, porém possuem objetivos diferentes.

---

# Erro (`Error`)

Os erros representam problemas graves de programação.

Normalmente indicam falhas que deveriam ser corrigidas no código e não tratadas durante a execução.

## Exemplos de erros

- Índice inexistente em uma lista
- Stack overflow
- Null check em valor nulo
- Erros internos da linguagem

---

## Exemplo

```dart
List<int> numeros = [1, 2, 3];

print(numeros[10]);
```

### Resultado

```text
RangeError
```

O programa tentou acessar uma posição inexistente da lista.

---

# Exceção (`Exception`)

As exceções representam situações inesperadas, mas recuperáveis.

Normalmente acontecem devido a:

- Entrada inválida do usuário
- Arquivo inexistente
- Falha de conexão
- Conversão inválida

---

## Exemplo

```dart
String texto = "abc";

int numero = int.parse(texto);
```

### Resultado

```text
FormatException
```

---

# Resumo

| Tipo | Objetivo |
|---|---|
| `Error` | Problemas graves de programação |
| `Exception` | Situações inesperadas tratáveis |

---

# Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção?

---

# Situações comuns de `Error`

Os erros geralmente indicam falhas do programador.

## Exemplos

- Acessar índice inválido
- Variável nula indevida
- Recursão infinita
- Uso incorreto de tipos

---

## Exemplo

```dart
String? nome;

print(nome!.length);
```

### Resultado

```text
Null check operator used on a null value
```

---

# Situações comuns de `Exception`

As exceções costumam envolver fatores externos.

## Exemplos

- Usuário digitou valor inválido
- Arquivo não encontrado
- Internet desconectada
- API indisponível

---

## Exemplo

```dart
double valor = double.parse("abc");
```

### Resultado

```text
FormatException
```

---

# O que fazem os blocos `try`, `catch` e `finally` em Dart?

Esses blocos são utilizados para tratamento de exceções.

---

# `try`

O bloco `try` contém o código que pode gerar erro.

```dart
try {
  int numero = int.parse("abc");
}
```

---

# `catch`

O `catch` captura a exceção.

```dart
try {
  int numero = int.parse("abc");
}
catch (e) {
  print("Erro encontrado");
}
```

---

# `finally`

O `finally` executa sempre, independentemente de erro.

```dart
try {
  print("Tentando...");
}
catch (e) {
  print("Erro");
}
finally {
  print("Finalizado");
}
```

---

# Fluxo de execução

```text
try → catch → finally
```

ou

```text
try → finally
```

caso não exista erro.

---

# Como posso capturar diferentes tipos de exceções usando `catch`?

Dart permite usar `on`.

---

## Exemplo

```dart
try {
  int numero = int.parse("abc");
}
on FormatException {
  print("Formato inválido");
}
```

---

# Capturando múltiplos tipos

```dart
try {
  List<int> numeros = [1, 2];

  print(numeros[10]);
}
on FormatException {
  print("Erro de formato");
}
on RangeError {
  print("Índice inválido");
}
```

---

# Capturando objeto da exceção

```dart
try {
  int.parse("abc");
}
catch (e) {
  print(e);
}
```

---

# Capturando stack trace

```dart
try {
  int.parse("abc");
}
catch (e, stack) {
  print(e);
  print(stack);
}
```

---

# Em quais situações é útil usar o bloco `finally`?

O `finally` é útil quando precisamos garantir que algo será executado.

---

# Situações comuns

- Fechar arquivos
- Encerrar conexão com banco
- Fechar scanner
- Liberar memória
- Mostrar mensagem final

---

## Exemplo

```dart
try {
  print("Abrindo arquivo");
}
catch (e) {
  print("Erro");
}
finally {
  print("Arquivo fechado");
}
```

---

# Por que eu precisaria lançar uma exceção em meu código?

Lançar exceções permite informar que algo inválido aconteceu.

Isso ajuda:

- Validar regras
- Evitar estados inválidos
- Informar erros claramente
- Facilitar depuração

---

## Exemplo

```dart
void sacar(double valor) {

  if (valor <= 0) {
    throw Exception("Valor inválido");
  }

  print("Saque realizado");
}
```

---

# Como posso personalizar mensagens de erro ao lançar exceções?

Você pode criar mensagens específicas.

---

## Exemplo simples

```dart
throw Exception("Senha incorreta");
```

---

## Exemplo mais detalhado

```dart
throw Exception(
  "Idade inválida. O valor deve ser maior que 0."
);
```

---

# Criando exceções personalizadas

```dart
class IdadeInvalidaException implements Exception {

  String mensagem;

  IdadeInvalidaException(this.mensagem);

  @override
  String toString() {
    return mensagem;
  }
}
```

---

## Usando

```dart
throw IdadeInvalidaException(
  "A idade não pode ser negativa"
);
```

---

# Quais são as melhores práticas para lançar exceções em Dart?

---

# 1. Lance exceções apenas quando necessário

Evite usar exceções para controle normal do programa.

---

## Ruim

```dart
try {
  lista[0];
}
catch (e) {
}
```

---

# 2. Use mensagens claras

Mensagens ajudam na manutenção.

---

## Bom exemplo

```dart
throw Exception(
  "CPF inválido: tamanho incorreto"
);
```

---

# 3. Prefira exceções específicas

Evite usar apenas `Exception`.

---

## Melhor

```dart
throw FormatException("Formato inválido");
```

---

# 4. Não esconda erros

Evite catch vazio.

---

## Ruim

```dart
catch (e) {

}
```

---

# 5. Use `finally` para limpeza

Garantir fechamento de recursos.

---

# Qual a diferença entre usar `assert` e lançar uma exceção para verificar condições?

---

# `assert`

O `assert` é usado principalmente durante desenvolvimento e depuração.

Ele verifica condições internas.

---

## Exemplo

```dart
int idade = -1;

assert(idade >= 0);
```

---

# Características do `assert`

- Usado para detectar bugs
- Pode ser desativado em produção
- Não deve validar entrada do usuário

---

# Exceções (`throw`)

Exceções são usadas para erros reais da aplicação.

---

## Exemplo

```dart
if (idade < 0) {
  throw Exception("Idade inválida");
}
```

---

# Diferença principal

| `assert` | `throw` |
|---|---|
| Desenvolvimento | Produção |
| Detecta bugs | Trata erros reais |
| Pode ser desativado | Sempre executa |

---

# Em quais situações o `assert` é mais útil durante o desenvolvimento?

O `assert` é útil para validar suposições internas do sistema.

---

# Situações comuns

- Verificar parâmetros
- Detectar estados inválidos
- Encontrar bugs rapidamente
- Garantir invariantes

---

## Exemplo

```dart
void dividir(int a, int b) {

  assert(b != 0);

  print(a / b);
}
```

---

# Outro exemplo

```dart
class Produto {

  double preco;

  Produto(this.preco)
      : assert(preco >= 0);
}
```

---

# Vantagens do `assert`

- Facilita depuração
- Detecta erros cedo
- Melhora confiabilidade
- Ajuda documentação do código

---

# Resumo Geral

| Conceito | Função |
|---|---|
| `Error` | Problema grave de programação |
| `Exception` | Problema tratável |
| `try` | Bloco que pode gerar erro |
| `catch` | Captura exceção |
| `finally` | Executa sempre |
| `throw` | Lança exceção |
| `assert` | Verificação para desenvolvimento |
