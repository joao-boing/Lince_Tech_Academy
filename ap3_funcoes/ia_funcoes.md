# Funções em Dart

Funções são blocos de código reutilizáveis responsáveis por executar tarefas específicas.  
Elas ajudam na organização, reutilização e manutenção do código.

---

# Cuidados ao Criar Funções em Dart

## 1. Crie Funções com Apenas Uma Responsabilidade

Uma função deve resolver apenas um problema.

## Ruim

```dart
void usuario() {
  validarLogin();
  calcularSalario();
  enviarEmail();
}
```

A função está fazendo várias tarefas diferentes.

---

## Melhor

```dart
void validarLogin() {}
void calcularSalario() {}
void enviarEmail() {}
```

Cada função possui uma única responsabilidade.

---

# 2. Use Nomes Claros e Descritivos

O nome da função deve indicar exatamente o que ela faz.

## Ruim

```dart
void x() {}
```

---

## Melhor

```dart
void calcularMedia() {}
```

---

# 3. Evite Funções Muito Grandes

Funções muito longas:
- dificultam leitura
- aumentam complexidade
- dificultam manutenção

Prefira dividir em funções menores.

---

# 4. Defina Tipos Corretamente

Sempre informe:
- tipo dos parâmetros
- tipo do retorno

## Melhor prática

```dart
double calcularMedia(double n1, double n2)
```

---

# 5. Evite Uso Excessivo de `dynamic`

O `dynamic` remove a verificação de tipos do Dart.

## Problemas

- erros aparecem apenas em execução
- reduz segurança do código
- dificulta autocomplete
- dificulta manutenção

---

## Exemplo

```dart
dynamic valor = "10";

print(valor + 5);
```

Pode gerar erro em tempo de execução.

---

# 6. Evite Muitos Parâmetros

Funções com muitos parâmetros:
- ficam difíceis de entender
- aumentam erros
- dificultam reutilização

---

# Posso Chamar Minha Função Dentro Dela Mesma?

Sim. Isso se chama **recursão**.

Uma função pode executar ela mesma repetidamente.

---

# Exemplo de Recursão

```dart
void contar(int numero) {
  if (numero == 0) {
    return;
  }

  print(numero);

  contar(numero - 1);
}
```

---

# Importante: Condição de Parada

Toda recursão precisa de uma condição de parada.

Sem isso:

```dart
void teste() {
  teste();
}
```

o programa entrará em loop infinito e causará:

```dart
Stack Overflow
```

---

# Existe Limite de Parâmetros em Uma Função?

O Dart suporta muitos parâmetros, mas não existe um limite pequeno fixo.

Mesmo assim, não é recomendado exagerar.

---

# Problemas de Muitos Parâmetros

## Exemplo ruim

```dart
void cadastro(
  String nome,
  int idade,
  String email,
  String cpf,
  String telefone,
  String endereco
)
```

---

# Problemas

- difícil memorizar ordem
- chamadas confusas
- manutenção complicada

---

# Melhor Solução

Usar parâmetros nomeados.

```dart
void cadastro({
  required String nome,
  required int idade
})
```

---

# É Recomendado Usar `dynamic`?

Na maioria dos casos, não.

---

# O Que o `dynamic` Faz?

Ele desativa a segurança de tipos.

---

# Exemplo

```dart
dynamic valor = 10;

valor = "texto";
valor = true;
```

A variável aceita qualquer coisa.

---

# Problemas do `dynamic`

| Problema | Explicação |
|---|---|
| Menos segurança | Erros aparecem apenas em execução |
| Menos autocomplete | IDE ajuda menos |
| Mais difícil manter | Tipos ficam confusos |
| Código menos previsível | Qualquer valor pode ser enviado |

---

# Quando Usar `dynamic`?

Use apenas quando:
- o tipo realmente pode variar
- trabalhar com JSON
- APIs externas
- bibliotecas genéricas

---

# Quando Usar Parâmetros Opcionais?

Use quando o parâmetro não for obrigatório.

---

# Parâmetros Opcionais Posicionais

Usam `[]`.

```dart
void mensagem([String? texto])
```

---

# Chamada

```dart
mensagem();
mensagem("Olá");
```

---

# Quando Usar `required`?

Use quando o parâmetro:
- é obrigatório
- está em parâmetros nomeados

---

# Exemplo

```dart
void usuario({
  required String nome
})
```

---

# Sem o valor

```dart
usuario();
```

gera erro.

---

# O Que São Parâmetros Nomeados?

São parâmetros identificados pelo nome na chamada da função.

---

# Exemplo

```dart
void cadastro({
  String nome = "",
  int idade = 0
})
```

---

# Chamada

```dart
cadastro(nome: "João", idade: 18);
```

---

# Vantagens

| Vantagem | Explicação |
|---|---|
| Mais legível | Fica fácil entender |
| Ordem não importa | Pode trocar posição |
| Menos erros | Mais clareza |
| Melhor manutenção | Código mais organizado |

---

# Diferença Entre Posicionais e Nomeados

## Posicionais

```dart
somar(10, 20);
```

A ordem importa.

---

## Nomeados

```dart
somar(a: 10, b: 20);
```

Mais claro e seguro.

---

# Métodos e Propriedades de `Function`

Funções em Dart também são objetos.

---

# Principais Métodos

| Método/Propriedade | Função |
|---|---|
| `call()` | Executa a função |
| `runtimeType` | Mostra tipo da função |
| `hashCode` | Código único do objeto |
| `toString()` | Converte para texto |

---

# `call()`

Executa a função manualmente.

```dart
funcao.call();
```

É equivalente a:

```dart
funcao();
```

---

# `runtimeType`

Mostra o tipo da função.

```dart
print(funcao.runtimeType);
```

---

# Diferença Entre `olaMundo` e `olaMundo()`

Essa diferença é extremamente importante.

---

# `olaMundo`

Representa a referência da função.

Ela NÃO executa.

---

# Exemplo

```dart
print(olaMundo);
```

Você está apontando para a função.

---

# `olaMundo()`

Executa a função.

Os parênteses significam:
- chamada
- execução

---

# Exemplo

```dart
olaMundo();
```

---

# Comparação

| Código | Resultado |
|---|---|
| `olaMundo` | Referência da função |
| `olaMundo()` | Executa a função |

---

# Uso Comum de Referência de Função

Muito usado em:
- callbacks
- botões
- eventos
- listas
- programação assíncrona

---

# Exemplo Conceitual

```dart
botao.onClick = olaMundo;
```

Aqui a função será executada depois.