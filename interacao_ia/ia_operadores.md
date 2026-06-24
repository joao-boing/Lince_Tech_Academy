# Operadores, condições e notação em cascata em Dart

---

# O que acontece se eu comparar valores de tipos diferentes usando operadores relacionais em Dart?

Em Dart, alguns tipos podem ser comparados normalmente, principalmente tipos numéricos.

Exemplo:

```dart
print(10 == 10.0);
```

Resultado:

```text
true
```

Mesmo sendo:

- `10` → `int`
- `10.0` → `double`

o Dart entende que os valores numéricos são equivalentes.

---

Porém, comparar tipos incompatíveis pode gerar erro.

Exemplo:

```dart
print(10 > "20");
```

O Dart não consegue comparar:

- número
- string

---

## Operadores relacionais

| Operador | Função |
|---|---|
| `==` | igual |
| `!=` | diferente |
| `>` | maior |
| `<` | menor |
| `>=` | maior ou igual |
| `<=` | menor ou igual |

---

# Qual a diferença entre os operadores de divisão `/` e `~/`?

## `/`

Realiza divisão decimal.

Sempre retorna `double`.

```dart
print(10 / 3);
```

Resultado:

```text
3.3333333333333335
```

---

## `~/`

Realiza divisão inteira.

Descarta as casas decimais.

```dart
print(10 ~/ 3);
```

Resultado:

```text
3
```

---

## Diferença prática

| Operador | Retorno |
|---|---|
| `/` | `double` |
| `~/` | `int` |

---

# Como verifico se uma variável é de um determinado tipo em Dart?

Utilizando o operador `is`.

Exemplo:

```dart
print(nome is String);
```

Resultado:

```text
true
```

---

Também é possível negar:

```dart
print(nome is! String);
```

---

## Exemplos

```dart
print(10 is int);
print(10.5 is double);
print(true is bool);
```

---

# Qual a função do operador `?` em testes de tipo?

O `?` indica que um tipo pode aceitar `null`.

Exemplo:

```dart
String? nome;
```

Isso significa:

```text
nome pode ser:
- String
- null
```

---

Sem `?`:

```dart
String nome;
```

A variável obrigatoriamente precisa possuir um valor válido.

---

## Exemplo

```dart
String? sobrenome = null;
```

Funciona normalmente.

---

# Quando usar operadores de valores opcionais e requeridos em funções?

---

# Parâmetros opcionais

São usados quando o valor não é obrigatório.

## Opcionais posicionais

```dart
void mensagem([String? nome])
```

A função pode ser chamada:

```dart
mensagem();
```

ou:

```dart
mensagem("João");
```

---

# Parâmetros nomeados

```dart
void usuario({String? nome})
```

Chamada:

```dart
usuario(nome: "João");
```

---

# required

Usado quando um parâmetro nomeado precisa ser obrigatório.

```dart
void usuario({required String nome})
```

Agora o Dart exige:

```dart
usuario(nome: "João");
```

---

## Quando usar

| Tipo | Uso |
|---|---|
| opcional | valor pode faltar |
| required | valor obrigatório |

---

# Quais são os operadores de atribuição compostos?

Esses operadores realizam:

1. operação
2. atribuição

ao mesmo tempo.

---

## Tabela

| Operador | Equivalente |
|---|---|
| `+=` | `x = x + valor` |
| `-=` | `x = x - valor` |
| `*=` | `x = x * valor` |
| `/=` | `x = x / valor` |
| `~/=` | divisão inteira |
| `%=` | resto da divisão |

---

## Exemplo

```dart
int x = 10;

x += 5;
```

Equivale a:

```dart
x = x + 5;
```

Resultado:

```text
15
```

---

# Como usar os operadores `&&` e `||`?

---

# `&&` → E lógico

Todas as condições precisam ser verdadeiras.

```dart
idade >= 18 && ativo
```

---

## Exemplo

```dart
if (idade >= 18 && ativo) {
  print("Acesso permitido");
}
```

---

# `||` → OU lógico

Apenas uma condição precisa ser verdadeira.

```dart
idade >= 18 || admin
```

---

## Exemplo

```dart
if (idade >= 18 || responsavel) {
  print("Entrada permitida");
}
```

---

# Diferença entre usar `if-else` e expressões condicionais

---

# if-else

Melhor para:

- blocos grandes
- múltiplas instruções
- maior legibilidade

```dart
if (idade >= 18) {
  print("Maior");
} else {
  print("Menor");
}
```

---

# Expressão condicional (`? :`)

Melhor para decisões simples.

```dart
print(idade >= 18 ? "Maior" : "Menor");
```

---

## Estrutura

```dart
condicao ? valorSeTrue : valorSeFalse
```

---

# Em quais situações a notação em cascata pode tornar o código mais legível?

A notação em cascata (`..`) é útil quando vários métodos ou propriedades são usados no mesmo objeto.

---

## Sem cascata

```dart
usuario.nome = "João";
usuario.idade = 17;
usuario.ativar();
```

---

## Com cascata

```dart
usuario
  ..nome = "João"
  ..idade = 17
  ..ativar();
```

---

## Benefícios

- menos repetição
- código mais compacto
- leitura mais organizada

---

# Qual a diferença entre usar a notação em cascata e chamar métodos separadamente?

---

# Chamadas separadas

```dart
obj.nome = "João";
obj.idade = 17;
```

O objeto é repetido várias vezes.

---

# Cascata

```dart
obj
  ..nome = "João"
  ..idade = 17;
```

O Dart continua usando o mesmo objeto automaticamente.

---

## Quando cascata é interessante

- configurações
- builders
- objetos grandes
- múltiplas alterações consecutivas

---

# Como a notação em cascata pode ser usada para modificar um objeto após realizar testes de tipo?

Após verificar o tipo com `is`, o Dart entende qual é o tipo do objeto.

---

## Exemplo

```dart
if (obj is Pessoa) {
  obj
    ..nome = "João"
    ..idade = 17
    ..ativar();
}
```

---

## O que acontece

1. `is Pessoa` verifica o tipo
2. o Dart faz promoção de tipo
3. a cascata modifica o objeto diretamente

---

# Resumo geral

| Conceito | Objetivo |
|---|---|
| `is` | verificar tipo |
| `?` | permitir null |
| `required` | tornar obrigatório |
| `&&` | E lógico |
| `||` | OU lógico |
| `~/` | divisão inteira |
| `..` | cascata |
| `? :` | condição curta |
| `+=` | atribuição composta |
```