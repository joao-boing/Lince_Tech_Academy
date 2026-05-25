# Estruturas Condicionais e de Repetição

---

# Qual a diferença entre usar `if`, `else if` e `else`?

As estruturas `if`, `else if` e `else` são utilizadas para controle de fluxo, permitindo que o programa tome decisões com base em condições.

## `if`

O `if` verifica se uma condição é verdadeira.

Se a condição for verdadeira, o bloco de código dentro dele será executado.

```java
int idade = 18;

if (idade >= 18) {
    System.out.println("Maior de idade");
}
```

### Funcionamento

- Se `idade >= 18` for verdadeiro → executa o bloco.
- Se for falso → ignora o bloco.

---

## `else if`

O `else if` serve para testar outra condição caso o `if` anterior seja falso.

```java
int nota = 7;

if (nota >= 9) {
    System.out.println("Excelente");
}
else if (nota >= 7) {
    System.out.println("Bom");
}
```

### Funcionamento

- Primeiro verifica o `if`
- Se for falso, verifica o `else if`

---

## `else`

O `else` executa quando nenhuma das condições anteriores for verdadeira.

```java
int nota = 5;

if (nota >= 7) {
    System.out.println("Aprovado");
}
else {
    System.out.println("Reprovado");
}
```

### Funcionamento

- Executa apenas se todos os testes anteriores falharem.

---

# Quais cuidados tenho que ter com `if` e `else`?

## 1. Cuidado com chaves `{}`

Mesmo quando há apenas uma linha, é recomendado usar chaves para evitar erros.

### Ruim

```java
if (idade >= 18)
    System.out.println("Maior");
    System.out.println("Entrada liberada");
```

A segunda linha executará sempre.

### Correto

```java
if (idade >= 18) {
    System.out.println("Maior");
    System.out.println("Entrada liberada");
}
```

---

## 2. Evitar condições confusas

### Ruim

```java
if (!(idade < 18))
```

### Melhor

```java
if (idade >= 18)
```

---

## 3. Ordem das condições

A ordem pode afetar o resultado.

### Errado

```java
if (nota >= 5) {
    System.out.println("Aprovado");
}
else if (nota >= 8) {
    System.out.println("Excelente");
}
```

O segundo teste nunca será alcançado.

### Correto

```java
if (nota >= 8) {
    System.out.println("Excelente");
}
else if (nota >= 5) {
    System.out.println("Aprovado");
}
```

---

# Qual a importância da palavra-chave `break` em um `switch case`?

O `break` interrompe o `switch`.

Sem ele, o programa continuará executando os próximos `cases`.

---

## Exemplo sem `break`

```java
int dia = 1;

switch (dia) {
    case 1:
        System.out.println("Segunda");
    case 2:
        System.out.println("Terça");
}
```

### Saída

```text
Segunda
Terça
```

---

## Exemplo com `break`

```java
switch (dia) {
    case 1:
        System.out.println("Segunda");
        break;

    case 2:
        System.out.println("Terça");
        break;
}
```

### Saída

```text
Segunda
```

---

# Quando devo usar `switch` em vez de uma série de `if else`?

O `switch` é mais indicado quando:

- Existe uma única variável
- Existem muitos valores possíveis
- As comparações são exatas

---

## Melhor caso para `switch`

```java
int opcao = 2;

switch (opcao) {
    case 1:
        System.out.println("Novo jogo");
        break;

    case 2:
        System.out.println("Carregar jogo");
        break;

    case 3:
        System.out.println("Sair");
        break;
}
```

---

## Melhor caso para `if`

Quando há comparações complexas.

```java
if (idade >= 18 && possuiCarteira) {
    System.out.println("Pode dirigir");
}
```

---

# Qual a diferença entre um loop `for` tradicional e um loop `for...in`?

---

## `for` tradicional

Usado quando você precisa controlar índices manualmente.

```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

### Estrutura

```java
for (inicialização; condição; incremento)
```

---

## `for...in`

Percorre elementos diretamente.

Muito comum em Dart e JavaScript.

### Dart

```dart
List<String> nomes = ["João", "Maria", "Pedro"];

for (String nome in nomes) {
  print(nome);
}
```

### Vantagem

- Código mais limpo
- Não precisa controlar índice

---

# Como posso repetir um bloco de código um número específico de vezes?

O mais comum é usar `for`.

```java
for (int i = 0; i < 10; i++) {
    System.out.println("Repetição");
}
```

### Explicação

- `i = 0` → começa em 0
- `i < 10` → executa enquanto for verdadeiro
- `i++` → aumenta 1 a cada repetição

---

# Quais são os riscos de usar um loop `while` sem uma condição de parada adequada?

O principal risco é criar um loop infinito.

---

## Exemplo

```java
while (true) {
    System.out.println("Loop infinito");
}
```

### Problemas

- Alto consumo de CPU
- Travamento do programa
- Uso excessivo de memória

---

## Outro erro comum

```java
int i = 0;

while (i < 10) {
    System.out.println(i);
}
```

### Problema

`i` nunca aumenta.

---

## Correto

```java
int i = 0;

while (i < 10) {
    System.out.println(i);
    i++;
}
```

---

# Quando é adequado usar `for` e usar `while`?

---

## Use `for` quando:

Você sabe quantas repetições serão feitas.

```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

---

## Use `while` quando:

Você NÃO sabe quantas vezes irá repetir.

```java
Scanner sc = new Scanner(System.in);

String senha = "";

while (!senha.equals("1234")) {
    senha = sc.nextLine();
}
```

---

# Qual a diferença entre os comandos `break` e `continue`?

---

## `break`

Interrompe completamente o loop.

```java
for (int i = 0; i < 10; i++) {

    if (i == 5) {
        break;
    }

    System.out.println(i);
}
```

### Saída

```text
0
1
2
3
4
```

---

## `continue`

Pula apenas a iteração atual.

```java
for (int i = 0; i < 5; i++) {

    if (i == 2) {
        continue;
    }

    System.out.println(i);
}
```

### Saída

```text
0
1
3
4
```

---

# Como posso usar `break` para sair de um loop aninhado?

Loops aninhados são loops dentro de loops.

---

## Exemplo simples

```java
for (int i = 0; i < 3; i++) {

    for (int j = 0; j < 3; j++) {

        if (j == 1) {
            break;
        }

        System.out.println(j);
    }
}
```

O `break` interrompe apenas o loop mais interno.

---

## Para sair de todos os loops

Java permite usar labels.

```java
externo:
for (int i = 0; i < 3; i++) {

    for (int j = 0; j < 3; j++) {

        if (j == 1) {
            break externo;
        }

        System.out.println(j);
    }
}
```

---

# Em quais situações é útil usar o comando `continue` em um loop?

O `continue` é útil quando queremos ignorar uma condição específica sem parar todo o loop.

---

## Exemplo: ignorar números pares

```java
for (int i = 0; i <= 10; i++) {

    if (i % 2 == 0) {
        continue;
    }

    System.out.println(i);
}
```

### Saída

```text
1
3
5
7
9
```

---

## Situações comuns

- Ignorar valores inválidos
- Pular elementos específicos
- Filtrar listas
- Evitar blocos grandes de `if`

---