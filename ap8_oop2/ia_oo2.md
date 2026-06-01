# Conceitos Avançados de Orientação a Objetos em Dart

---

# O que significa 'sobrescrever' um método em Dart e por que eu faria isso?

Sobrescrever um método significa redefinir um método herdado de uma classe pai dentro da classe filha.

Isso permite alterar o comportamento original.

---

# Exemplo básico

```dart
class Animal {

  void emitirSom() {
    print("Som genérico");
  }
}
```

---

## Classe filha sobrescrevendo

```dart
class Cachorro extends Animal {

  @override
  void emitirSom() {
    print("Au Au");
  }
}
```

---

# Resultado

```dart
Cachorro cachorro = Cachorro();

cachorro.emitirSom();
```

### Saída

```text
Au Au
```

---

# Por que sobrescrever métodos?

---

# 1. Personalizar comportamento

Cada objeto pode agir de maneira diferente.

---

# 2. Aplicar polimorfismo

Permite tratar objetos diferentes de forma genérica.

---

# 3. Especializar classes filhas

A classe filha adapta funcionalidades herdadas.

---

# Exemplo de polimorfismo

```dart
class Gato extends Animal {

  @override
  void emitirSom() {
    print("Miau");
  }
}
```

---

# Como posso chamar o método original de uma classe pai em um método sobrescrito?

Usamos a palavra-chave `super`.

---

# Exemplo

```dart
class Animal {

  void dormir() {
    print("Animal dormindo");
  }
}
```

---

## Classe filha

```dart
class Cachorro extends Animal {

  @override
  void dormir() {

    super.dormir();

    print("Cachorro sonhando");
  }
}
```

---

# Resultado

```text
Animal dormindo
Cachorro sonhando
```

---

# O que o `super` faz?

O `super` acessa membros da classe pai.

---

## Pode acessar

- Métodos
- Construtores
- Atributos

---

# Como posso criar um getter para acessar um atributo privado de uma classe?

Getters permitem leitura controlada de atributos privados.

---

# Exemplo

```dart
class Conta {

  double _saldo = 1000;

  double get saldo {
    return _saldo;
  }
}
```

---

# Utilizando

```dart
Conta conta = Conta();

print(conta.saldo);
```

---

# Forma simplificada

```dart
class Conta {

  double _saldo = 1000;

  double get saldo => _saldo;
}
```

---

# Como funciona?

- `_saldo` é privado
- `saldo` é o getter público

---

# Em quais situações é melhor usar getters e setters em vez de acessar atributos diretamente?

Getters e setters são úteis quando precisamos controlar acesso aos dados.

---

# Vantagens

---

# 1. Validação

```dart
class Pessoa {

  int _idade = 0;

  set idade(int valor) {

    if (valor >= 0) {
      _idade = valor;
    }
  }
}
```

---

# 2. Segurança

Impede alterações inválidas.

---

# 3. Encapsulamento

Esconde detalhes internos.

---

# 4. Facilidade de manutenção

Mudanças internas não afetam o restante do código.

---

# Exemplo completo

```dart
class Produto {

  double _preco = 0;

  double get preco => _preco;

  set preco(double valor) {

    if (valor > 0) {
      _preco = valor;
    }
  }
}
```

---

# O que é uma 'classe abstrata' e como ela difere de uma classe normal?

Uma classe abstrata serve como modelo para outras classes.

Ela NÃO pode ser instanciada diretamente.

---

# Classe normal

```dart
class Pessoa {

}
```

Pode criar objetos normalmente.

```dart
Pessoa p = Pessoa();
```

---

# Classe abstrata

```dart
abstract class Animal {

}
```

---

# Tentativa inválida

```dart
Animal a = Animal();
```

Isso gera erro.

---

# Classes abstratas podem conter:

- Métodos normais
- Métodos abstratos
- Atributos

---

# Método abstrato

```dart
abstract class Animal {

  void emitirSom();
}
```

Sem implementação.

---

# Classe concreta implementando

```dart
class Cachorro extends Animal {

  @override
  void emitirSom() {
    print("Au Au");
  }
}
```

---

# Quando devo usar classes abstratas em vez de classes concretas?

Use classes abstratas quando quiser definir um modelo obrigatório.

---

# Situações comuns

---

# 1. Padronizar comportamento

```dart
abstract class Pagamento {

  void pagar();
}
```

---

# 2. Criar contratos genéricos

Todas subclasses devem implementar.

---

# 3. Evitar instanciação direta

Não faz sentido criar objeto genérico.

---

# Exemplo

```dart
Animal animal = Cachorro();
```

Faz sentido.

```dart
Animal animal = Animal();
```

Não faz sentido.

---

# O que é 'herança' em Dart e como ela funciona?

Herança permite que uma classe reutilize características de outra.

---

# Sintaxe

```dart
class Filho extends Pai {

}
```

---

# Exemplo

```dart
class Veiculo {

  void ligar() {
    print("Ligando");
  }
}
```

---

## Classe filha

```dart
class Carro extends Veiculo {

}
```

---

# Resultado

```dart
Carro carro = Carro();

carro.ligar();
```

---

# Vantagens da herança

- Reutilização
- Organização
- Menos repetição
- Polimorfismo

---

# Qual a diferença entre herança e composição?

---

# Herança

Representa relação "É UM".

---

## Exemplo

```text
Cachorro É UM Animal
```

---

# Composição

Representa relação "TEM UM".

---

## Exemplo

```text
Carro TEM UM Motor
```

---

# Exemplo de composição

```dart
class Motor {

  void ligar() {
    print("Motor ligado");
  }
}
```

---

```dart
class Carro {

  Motor motor = Motor();
}
```

---

# Diferença principal

| Herança | Composição |
|---|---|
| É UM | TEM UM |
| extends | objeto interno |
| Forte acoplamento | Mais flexível |

---

# O que é uma 'interface' em Dart e como ela define um contrato de comportamento?

Interface define comportamentos obrigatórios.

Em Dart qualquer classe pode funcionar como interface.

---

# Exemplo

```dart
class Animal {

  void emitirSom() {

  }
}
```

---

# Interface obriga implementação

```dart
class Cachorro implements Animal {

  @override
  void emitirSom() {
    print("Au Au");
  }
}
```

---

# Contrato

A classe é obrigada a implementar todos os métodos.

---

# Como uma classe pode implementar uma interface?

Usando `implements`.

---

# Exemplo

```dart
class Forma {

  double calcularArea() {
    return 0;
  }
}
```

---

## Implementando

```dart
class Quadrado implements Forma {

  @override
  double calcularArea() {
    return 25;
  }
}
```

---

# Qual a diferença entre herança e implementação de interfaces?

---

# Herança (`extends`)

Herda implementação pronta.

---

## Exemplo

```dart
class Animal {

  void dormir() {
    print("Dormindo");
  }
}
```

---

```dart
class Gato extends Animal {

}
```

`Gato` já possui `dormir`.

---

# Interface (`implements`)

Herda apenas obrigação.

---

## Exemplo

```dart
class Gato implements Animal {

  @override
  void dormir() {
    print("Dormindo");
  }
}
```

---

# Diferença principal

| `extends` | `implements` |
|---|---|
| Reutiliza código | Obriga implementação |
| Herança real | Contrato |
| Pode sobrescrever | Deve implementar tudo |

---

# Quais cenários devo usar métodos estáticos em vez de métodos de instância?

Métodos estáticos pertencem à classe e não ao objeto.

---

# Use métodos estáticos quando:

---

# 1. Não dependem de atributos do objeto

---

## Exemplo

```dart
class Matematica {

  static int somar(int a, int b) {
    return a + b;
  }
}
```

---

# 2. Funções utilitárias

---

# 3. Constantes globais

---

# 4. Helpers

---

# Como posso acessar um método estático sem criar uma instância da classe?

Usamos o nome da classe.

---

# Exemplo

```dart
class Calculadora {

  static int dobrar(int valor) {
    return valor * 2;
  }
}
```

---

# Chamando

```dart
print(Calculadora.dobrar(5));
```

---

# O que são 'enumeradores' em Dart e para que servem?

Enumeradores (`enum`) representam um conjunto fixo de valores.

---

# Exemplo

```dart
enum DiaSemana {

  segunda,
  terca,
  quarta,
  quinta,
  sexta
}
```

---

# Utilizando

```dart
DiaSemana dia = DiaSemana.segunda;
```

---

# Vantagens

- Evita strings soltas
- Mais segurança
- Facilita leitura
- Reduz erros

---

# Exemplo com switch

```dart
switch (dia) {

  case DiaSemana.segunda:
    print("Início da semana");
    break;

  case DiaSemana.sexta:
    print("Fim da semana");
    break;

  default:
    print("Outro dia");
}
```

---

# Em quais situações é melhor usar enumeradores em vez de constantes?

Enums são melhores quando existe um conjunto limitado de opções.

---

# Exemplos ideais

- Dias da semana
- Status de pedido
- Níveis de acesso
- Estados do jogo
- Tipos de pagamento

---

# Ruim usando strings

```dart
String status = "aprovado";
```

Pode gerar erros de digitação.

---

# Melhor usando enum

```dart
enum Status {

  aprovado,
  reprovado,
  pendente
}
```

---

# Vantagens do enum

| Enum | Constantes String |
|---|---|
| Mais seguro | Mais propenso a erro |
| Melhor autocomplete | Sem validação |
| Melhor manutenção | Mais difícil manter |

---

# Resumo Geral

| Conceito | Função |
|---|---|
| Sobrescrita | Alterar comportamento herdado |
| `super` | Acessar classe pai |
| Getter | Ler atributo privado |
| Setter | Modificar atributo com controle |
| Classe abstrata | Modelo não instanciável |
| Herança | Reutilização |
| Composição | Relação "tem um" |
| Interface | Contrato obrigatório |
| Método estático | Pertence à classe |
| Enum | Conjunto fixo de valores |
