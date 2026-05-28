# Orientação a Objetos em Dart

---

# Quais são os principais conceitos da orientação a objetos?

A Programação Orientada a Objetos (POO) é um paradigma baseado na organização do código em objetos.

Os principais conceitos são:

- Classe
- Objeto
- Atributos
- Métodos
- Encapsulamento
- Herança
- Polimorfismo
- Abstração

---

# Classe

A classe funciona como um molde.

Ela define:

- Características
- Comportamentos

---

## Exemplo

```dart
class Pessoa {
  String nome = "";
  int idade = 0;
}
```

---

# Objeto

O objeto é uma instância da classe.

---

## Exemplo

```dart
Pessoa pessoa1 = Pessoa();
```

Agora `pessoa1` possui:

- nome
- idade

---

# Atributos

Atributos representam características do objeto.

---

## Exemplo

```dart
class Carro {
  String modelo = "";
  int ano = 0;
}
```

- `modelo`
- `ano`

são atributos.

---

# Métodos

Métodos representam ações/comportamentos.

---

## Exemplo

```dart
class Cachorro {

  void latir() {
    print("Au Au");
  }
}
```

---

# Encapsulamento

Protege dados internos da classe.

Em Dart usamos `_`.

---

## Exemplo

```dart
class Conta {

  double _saldo = 0;
}
```

O `_saldo` fica privado.

---

# Herança

Permite que uma classe herde características de outra.

---

## Exemplo

```dart
class Animal {

  void dormir() {
    print("Dormindo");
  }
}

class Gato extends Animal {

}
```

`Gato` herdou o método `dormir`.

---

# Polimorfismo

Permite que métodos tenham comportamentos diferentes.

---

## Exemplo

```dart
class Animal {

  void emitirSom() {
    print("Som genérico");
  }
}

class Cachorro extends Animal {

  @override
  void emitirSom() {
    print("Au Au");
  }
}
```

---

# Abstração

Oculta detalhes complexos e mostra apenas o necessário.

---

# Quais as vantagens de usar orientação a objetos em comparação com outras formas de programação?

A POO oferece várias vantagens.

---

# 1. Organização do código

O sistema fica dividido em partes menores.

---

## Exemplo

```text
Classe Cliente
Classe Produto
Classe Pedido
```

---

# 2. Reutilização

Com herança e composição podemos reutilizar código.

---

# 3. Facilidade de manutenção

Alterações ficam mais simples.

---

# 4. Escalabilidade

Projetos grandes ficam mais organizados.

---

# 5. Segurança dos dados

Encapsulamento protege informações internas.

---

# 6. Código mais próximo do mundo real

Objetos representam entidades reais.

---

## Exemplo

```text
Pessoa
Carro
ContaBancaria
Funcionario
```

---

# O que é uma 'classe' e como ela se relaciona com 'objetos'?

---

# Classe

A classe é um modelo.

Ela define:

- atributos
- métodos

---

## Exemplo

```dart
class Pessoa {

  String nome = "";
  int idade = 0;

  void apresentar() {
    print("Olá");
  }
}
```

---

# Objeto

O objeto é uma instância real da classe.

---

## Criando objetos

```dart
Pessoa p1 = Pessoa();
Pessoa p2 = Pessoa();
```

Cada objeto possui seus próprios dados.

---

## Exemplo

```dart
p1.nome = "João";
p2.nome = "Maria";
```

---

# Relação entre eles

| Classe | Objeto |
|---|---|
| Molde | Instância |
| Define estrutura | Usa estrutura |
| Abstrata | Concreto |

---

# O que são 'métodos' e como eles funcionam dentro de uma classe?

Métodos são funções dentro de classes.

Eles definem comportamentos.

---

# Exemplo

```dart
class Calculadora {

  int somar(int a, int b) {
    return a + b;
  }
}
```

---

# Funcionamento

- Recebem parâmetros
- Executam ações
- Podem retornar valores

---

## Usando método

```dart
Calculadora calc = Calculadora();

print(calc.somar(2, 3));
```

---

# Métodos podem:

- Alterar atributos
- Retornar dados
- Executar lógica
- Chamar outros métodos

---

# Exemplo completo

```dart
class Conta {

  double saldo = 0;

  void depositar(double valor) {
    saldo += valor;
  }
}
```

---

# Como posso acessar os métodos de um objeto em Dart?

Usamos o operador `.`.

---

# Exemplo

```dart
class Pessoa {

  void falar() {
    print("Olá");
  }
}
```

---

## Criando objeto

```dart
Pessoa p = Pessoa();
```

---

## Chamando método

```dart
p.falar();
```

---

# Outro exemplo

```dart
class Carro {

  void ligar() {
    print("Carro ligado");
  }
}

void main() {

  Carro carro = Carro();

  carro.ligar();
}
```

---

# Qual a diferença entre atributos 'públicos' e 'privados'?

---

# Públicos

Podem ser acessados de qualquer lugar.

---

## Exemplo

```dart
class Pessoa {

  String nome = "";
}
```

---

## Acesso

```dart
Pessoa p = Pessoa();

p.nome = "João";
```

---

# Privados

Em Dart usamos `_`.

---

## Exemplo

```dart
class Conta {

  double _saldo = 0;
}
```

---

# Características

- Só podem ser acessados dentro do arquivo
- Protegem dados internos

---

# Exemplo de encapsulamento

```dart
class Conta {

  double _saldo = 0;

  void depositar(double valor) {
    _saldo += valor;
  }

  double obterSaldo() {
    return _saldo;
  }
}
```

---

# Vantagens do privado

- Segurança
- Controle
- Evita alterações indevidas
- Facilita manutenção

---

# Qual a diferença entre um construtor padrão e um construtor nomeado?

Construtores inicializam objetos.

---

# Construtor padrão

É o construtor principal.

---

## Exemplo

```dart
class Pessoa {

  String nome;

  Pessoa(this.nome);
}
```

---

## Uso

```dart
Pessoa p = Pessoa("João");
```

---

# Construtor nomeado

Permite múltiplas formas de criação.

---

## Exemplo

```dart
class Pessoa {

  String nome;

  Pessoa(this.nome);

  Pessoa.anonimo()
      : nome = "Anônimo";
}
```

---

## Uso

```dart
Pessoa p = Pessoa.anonimo();
```

---

# Vantagens do construtor nomeado

- Mais organização
- Melhor legibilidade
- Diferentes formas de inicialização

---

# Outro exemplo

```dart
class Produto {

  String nome;
  double preco;

  Produto(this.nome, this.preco);

  Produto.gratis(this.nome)
      : preco = 0;
}
```

---

# O que são 'factories' em Dart e quando devo usá-las?

Factories são construtores especiais.

Elas usam a palavra-chave `factory`.

---

# Diferença principal

Um construtor normal SEMPRE cria novo objeto.

Uma factory pode:

- retornar objeto existente
- controlar criação
- retornar subclasses
- validar dados antes

---

# Sintaxe

```dart
class Pessoa {

  String nome;

  Pessoa(this.nome);

  factory Pessoa.criar(String nome) {

    return Pessoa(nome);
  }
}
```

---

# Exemplo de validação

```dart
class Usuario {

  String nome;

  Usuario._(this.nome);

  factory Usuario(String nome) {

    if (nome.isEmpty) {
      throw Exception("Nome inválido");
    }

    return Usuario._(nome);
  }
}
```

---

# Exemplo Singleton

```dart
class Config {

  static final Config _instancia =
      Config._interno();

  Config._interno();

  factory Config() {
    return _instancia;
  }
}
```

---

# Quando usar `factory`?

---

# 1. Validação antes da criação

```dart
factory Usuario(String nome)
```

---

# 2. Reutilização de objetos

Evita criar objetos repetidos.

---

# 3. Singleton

Garantir apenas uma instância.

---

# 4. Retornar subclasses

Factories podem retornar objetos diferentes.

---

# Resumo Geral

| Conceito | Função |
|---|---|
| Classe | Molde de objetos |
| Objeto | Instância da classe |
| Método | Comportamento |
| Atributo | Característica |
| Público | Acesso livre |
| Privado | Protegido com `_` |
| Construtor padrão | Inicialização principal |
| Construtor nomeado | Forma alternativa de criar |
| Factory | Construtor especial |
