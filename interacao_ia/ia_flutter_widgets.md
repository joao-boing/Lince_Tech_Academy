# Flutter – Layouts, Imagens, Textos e Listas

---

# Explique o conceito de um widget Row em Flutter

O widget `Row` é utilizado para organizar widgets horizontalmente dentro da interface.

Todos os widgets filhos são posicionados lado a lado, da esquerda para a direita.

## Exemplo

```dart
Row(
  children: [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
  ],
)
```

### Resultado

```text
[Home] [Search] [Person]
```

Todos os widgets ficam alinhados horizontalmente.

---

# Como posso adicionar espaçamento uniforme entre os widgets em um Row?

Existem várias formas.

## Utilizando MainAxisAlignment.spaceEvenly

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
  ],
)
```

O Flutter distribui os espaços igualmente.

---

## Utilizando SizedBox

```dart
Row(
  children: [
    Icon(Icons.home),
    SizedBox(width: 20),
    Icon(Icons.search),
    SizedBox(width: 20),
    Icon(Icons.person),
  ],
)
```

Neste caso o espaçamento é definido manualmente.

---

## Utilizando Spacer

```dart
Row(
  children: [
    Icon(Icons.home),
    Spacer(),
    Icon(Icons.search),
    Spacer(),
    Icon(Icons.person),
  ],
)
```

---

# Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Row?

Dentro de um Row existem dois eixos.

## Main Axis

É o eixo principal.

No Row é horizontal.

```text
← →
```

Controlado por:

```dart
mainAxisAlignment
```

---

## Cross Axis

É o eixo secundário.

No Row é vertical.

```text
↑
↓
```

Controlado por:

```dart
crossAxisAlignment
```

---

## Exemplo

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [],
)
```

---

# Explique o conceito de um widget Column em Flutter

O widget `Column` organiza widgets verticalmente.

Os widgets ficam um abaixo do outro.

## Exemplo

```dart
Column(
  children: [
    Text("Nome"),
    Text("Email"),
    Text("Telefone"),
  ],
)
```

### Resultado

```text
Nome
Email
Telefone
```

---

# Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Column?

No Column os eixos são invertidos.

---

## Main Axis

Agora é vertical.

```text
↑
↓
```

Controlado por:

```dart
mainAxisAlignment
```

---

## Cross Axis

Agora é horizontal.

```text
← →
```

Controlado por:

```dart
crossAxisAlignment
```

---

## Exemplo

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
)
```

---

# Explique o conceito de um widget Stack em Flutter

O widget `Stack` permite empilhar widgets uns sobre os outros.

É semelhante a trabalhar com camadas.

---

## Exemplo

```dart
Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    ),

    Text("Olá"),
  ],
)
```

O texto será exibido sobre o Container.

---

# Quais as vantagens de usar Stack em vez de Row ou Column?

Enquanto Row e Column apenas organizam elementos lado a lado, Stack permite sobreposição.

---

## Exemplos de uso

* Badges de notificações
* Textos sobre imagens
* Botões flutuantes
* Cartões personalizados
* Sobreposição de componentes

---

## Exemplo comum

```text
[Imagem]
     [Texto]
```

---

# Como posso posicionar widgets específicos dentro de um Stack?

Utilizamos o widget `Positioned`.

---

## Exemplo

```dart
Stack(
  children: [

    Positioned(
      top: 10,
      left: 10,
      child: Text("Superior"),
    ),

    Positioned(
      bottom: 10,
      right: 10,
      child: Text("Inferior"),
    ),
  ],
)
```

---

## Propriedades comuns

```dart
top:
bottom:
left:
right:
```

---

# Como posso exibir uma imagem de um arquivo local em Flutter?

Primeiro é necessário adicionar a imagem no projeto.

---

## Estrutura

```text
assets/
 └─ imagens/
     └─ foto.png
```

---

## Configurar no pubspec.yaml

```yaml
flutter:
  assets:
    - assets/imagens/
```

---

## Exibir imagem

```dart
Image.asset(
  'assets/imagens/foto.png',
)
```

---

# Quais propriedades posso usar para controlar a aparência do texto?

A aparência é controlada pelo `TextStyle`.

---

## Exemplo

```dart
Text(
  "Olá Flutter",
  style: TextStyle(
    fontSize: 24,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)
```

---

## Principais propriedades

### Cor

```dart
color: Colors.red
```

---

### Tamanho

```dart
fontSize: 20
```

---

### Peso

```dart
fontWeight: FontWeight.bold
```

---

### Itálico

```dart
fontStyle: FontStyle.italic
```

---

### Fonte personalizada

```dart
fontFamily: 'Roboto'
```

---

### Espaçamento

```dart
letterSpacing: 2
```

---

# Como posso exibir um texto em várias linhas?

O Text já suporta múltiplas linhas.

---

## Exemplo

```dart
Text(
  "Linha 1\nLinha 2\nLinha 3",
)
```

---

## Limitar quantidade de linhas

```dart
Text(
  texto,
  maxLines: 3,
)
```

---

## Quebra automática

```dart
Text(
  textoGrande,
  softWrap: true,
)
```

---

# Como posso criar uma lista de rolagem vertical em Flutter?

Utilizamos o widget `ListView`.

---

## Exemplo

```dart
ListView(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)
```

A lista será rolável automaticamente.

---

# Como posso adicionar itens dinamicamente a um ListView?

Utilizando ListView.builder.

---

## Exemplo

```dart
List<String> nomes = [
  "João",
  "Maria",
  "Pedro",
];
```

```dart
ListView.builder(
  itemCount: nomes.length,
  itemBuilder: (context, index) {

    return Text(
      nomes[index],
    );
  },
)
```

---

# Quais as diferenças entre ListView.builder e ListView.separated?

---

# ListView.builder

Cria apenas os itens.

```dart
ListView.builder()
```

---

## Exemplo

```dart
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return Text("Item $index");
  },
)
```

---

# ListView.separated

Cria itens e separadores.

```dart
ListView.separated()
```

---

## Exemplo

```dart
ListView.separated(
  itemCount: 10,

  itemBuilder: (context, index) {
    return Text("Item");
  },

  separatorBuilder: (context, index) {
    return Divider();
  },
)
```

---

# Comparação

| Builder               | Separated            |
| --------------------- | -------------------- |
| Apenas itens          | Itens + separadores  |
| Mais simples          | Mais organizado      |
| Menos controle visual | Mais controle visual |

---

# Como posso usar ListTile para criar itens de lista em um ListView?

O widget `ListTile` representa um item de lista já formatado.

---

## Exemplo

```dart
ListView(
  children: [

    ListTile(
      title: Text("João"),
    ),

    ListTile(
      title: Text("Maria"),
    ),
  ],
)
```

---

# Componentes do ListTile

## Título

```dart
title:
```

---

## Subtítulo

```dart
subtitle:
```

---

## Ícone à esquerda

```dart
leading:
```

---

## Widget à direita

```dart
trailing:
```

---

## Exemplo completo

```dart
ListTile(
  leading: Icon(Icons.person),

  title: Text("João"),

  subtitle: Text("Programador"),

  trailing: Icon(Icons.arrow_forward),
)
```

---

# Como posso tornar os itens ListTile interativos?

Utilizando o parâmetro:

```dart
onTap:
```

---

## Exemplo

```dart
ListTile(
  title: Text("Perfil"),

  onTap: () {
    print("Clicou");
  },
)
```

---

## Duplo clique

```dart
onLongPress:
```

```dart
ListTile(
  onLongPress: () {
    print("Pressionado");
  },
)
```

---

# Quais as vantagens de usar ListTile em vez de widgets de texto simples?

O ListTile já oferece uma estrutura pronta para listas.

---

## Texto simples

```dart
Text("João")
```

Possui poucos recursos.

---

## ListTile

```dart
ListTile(
  leading: Icon(Icons.person),
  title: Text("João"),
  subtitle: Text("Desenvolvedor"),
)
```

Possui:

* Ícones
* Título
* Subtítulo
* Eventos de clique
* Layout responsivo
* Melhor aparência

---

# Principais vantagens

* Menos código
* Interface padronizada
* Fácil manutenção
* Melhor experiência do usuário
* Integração com Material Design

---

# Resumo

| Widget             | Função                           |
| ------------------ | -------------------------------- |
| Row                | Organiza widgets horizontalmente |
| Column             | Organiza widgets verticalmente   |
| Stack              | Sobrepõe widgets                 |
| Positioned         | Posiciona widgets em um Stack    |
| Image.asset        | Exibe imagens locais             |
| Text               | Exibe textos                     |
| TextStyle          | Personaliza textos               |
| ListView           | Lista rolável                    |
| ListView.builder   | Lista dinâmica                   |
| ListView.separated | Lista com separadores            |
| ListTile           | Item de lista pronto             |
| onTap              | Evento de clique                 |
| onLongPress        | Evento de pressão longa          |