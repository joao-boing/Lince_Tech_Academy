# <u> Quais as boas práticas no uso de listas em dart? </u>


## Sempre tipar listas

```dart
List<String> nomes = [];
```

Evita erros e melhora a segurança do código.

---

## Usar `final` quando possível

```dart
final List<int> numeros = [];
```

A lista pode ser alterada, mas a variável não pode apontar para outra lista.

---

## Usar `const` para listas imutáveis

```dart
const List<String> estados = ["SC", "PR"];
```

A lista nunca poderá ser modificada.

---

## Evitar `dynamic`

```dart
List<dynamic> itens = [];
```

Permite qualquer tipo e reduz a segurança do código.

---

## Usar `.isEmpty` e `.isNotEmpty`

```dart
if (lista.isEmpty)
```

Mais legível do que usar `length`.

---

## Verificar antes de acessar índices

```dart
if (lista.isNotEmpty) {
  print(lista[0]);
}
```

Evita erros ao acessar listas vazias.

---

## Preferir `for in`

```dart
for (final nome in nomes)
```

Mais limpo quando não precisa do índice.

---

## Aproveitar métodos da List

```dart
lista.add();
lista.remove();
lista.contains();
lista.where();
```

Deixa o código mais simples e organizado.

---

## Evitar alterar listas durante loops

```dart
lista.removeWhere((item) => item == "João");
```

Mais seguro do que remover manualmente dentro do loop.

---

## Usar `Set` para valores únicos

```dart
Set<String> nomes = {};
```

Impede elementos repetidos.

---

## Usar classes para dados complexos

```dart
class Pessoa {}
```

Melhor do que listas genéricas com muitos tipos diferentes.

# <u> Boas práticas para melhorar performance com List em Dart </u>

---

## Definir tipos na lista

```dart
List<String> nomes = [];
```

Listas tipadas possuem melhor segurança e otimização.

---

## Preferir `for in` ou `forEach`

```dart
for (final nome in nomes)
```

Mais limpo e geralmente mais eficiente para leitura simples.

---

## Evitar loops desnecessários

Ruim:

```dart
if (lista.contains(valor))
```

dentro de vários loops.

Melhor organizar a lógica para evitar múltiplas buscas.

---

## Usar `Set` para buscas rápidas

```dart
Set<int> numeros = {};
```

`Set` possui busca muito mais rápida que `List` para verificar existência.

---

## Evitar adicionar/remover no meio da lista

```dart
lista.insert(0, valor);
```

Pode mover vários elementos na memória.

Adicionar no final é mais eficiente:

```dart
lista.add(valor);
```

---

## Evitar recriar listas constantemente

Ruim:

```dart
lista = [];
```

Muitas recriações aumentam uso de memória.

---

## Usar `.length` com cuidado em loops complexos

Guardar tamanho:

```dart
final tamanho = lista.length;
```

Pode evitar leituras repetidas em loops grandes.

---

## Evitar listas gigantes quando possível

Separar dados em estruturas menores pode melhorar memória e organização.

---

## Utilizar métodos nativos

```dart
where()
map()
removeWhere()
```

Os métodos internos do Dart geralmente são mais otimizados do que lógica manual.

---

# Resumo

| Prática | Benefício |
|---|---|
| Usar `final` | menos recriação |
| Tipar listas | mais otimização |
| Evitar `dynamic` | melhor performance |
| Usar `Set` para buscas | acesso mais rápido |
| Evitar inserções no início | menos movimentação |
| Evitar recriar listas | menos memória |
| Usar métodos nativos | código otimizado |

# <u> Como entender quando usar List e Map em Dart </u>

## Use `List` quando:

- a ordem dos elementos importa
- existem vários valores do mesmo tipo
- precisa acessar por índice
- os dados representam uma sequência

---

## Exemplo de List

```dart
List<String> nomes = [
  "João",
  "Maria",
  "Carlos"
];
```

Acesso por posição:

```dart
nomes[0]
```

Resultado:

```text
João
```

---

# Use `Map` quando:

- cada valor possui uma chave
- precisa associar informações
- quer acessar dados por nome
- os dados representam atributos

---

## Exemplo de Map

```dart
Map<String, dynamic> pessoa = {
  "nome": "João",
  "idade": 17,
  "ativo": true
};
```

Acesso por chave:

```dart
pessoa["nome"]
```

Resultado:

```text
João
```

# <u> Boas práticas no uso de Map em Dart </u>

## Sempre tipar Maps

```dart
Map<String, int> notas = {};
```

Melhora segurança e organização.

---

## Usar `final` quando possível

```dart
final Map<String, String> usuario = {};
```

Evita reatribuições desnecessárias.

---

## Utilizar chaves claras

```dart
"nome"
"idade"
"email"
```

Facilita leitura do código.

---

## Verificar existência de chaves

```dart
map.containsKey("nome");
```

Evita erros ao acessar valores inexistentes.

---

## Aproveitar métodos do Map

```dart
map.keys
map.values
map.entries
map.remove()
```

Deixa o código mais limpo.

---

## Evitar Maps muito grandes

Quando houver muitos atributos, prefira classes.

```dart
class Pessoa {}
```

# <u> Métodos úteis para List e Set em Dart </u>

## Métodos comuns em List e Set

### `add()`

Adiciona um elemento.

```dart
nomes.add("João");
```

---

### `remove()`

Remove um elemento.

```dart
nomes.remove("João");
```

---

### `contains()`

Verifica se o elemento existe.

```dart
nomes.contains("Maria");
```

---

### `length`

Retorna quantidade de elementos.

```dart
nomes.length
```

---

### `isEmpty`

Verifica se está vazio.

```dart
nomes.isEmpty
```

---

### `isNotEmpty`

Verifica se possui elementos.

```dart
nomes.isNotEmpty
```

---

# Métodos úteis de List

## `sort()`

Ordena elementos.

```dart
numeros.sort();
```

---

## `shuffle()`

Embaralha a lista.

```dart
nomes.shuffle();
```

---

## `insert()`

Insere em posição específica.

```dart
nomes.insert(0, "Carlos");
```

---

## `removeAt()`

Remove por índice.

```dart
nomes.removeAt(1);
```

---

## `where()`

Filtra elementos.

```dart
numeros.where((n) => n > 10);
```

---

## `map()`

Transforma elementos.

```dart
nomes.map((n) => n.toUpperCase());
```

---

# Métodos úteis de Set

## `union()`

Une dois conjuntos.

```dart
a.union(b);
```

---

## `intersection()`

Retorna elementos em comum.

```dart
a.intersection(b);
```

---

## `difference()`

Retorna elementos diferentes.

```dart
a.difference(b);
```

# <u> Cuidados ao usar Set em Dart </u>

## Lembrar que Set não permite repetição

```dart
Set<int> numeros = {1, 1, 2};
```

Resultado:

```text
{1, 2}
```

Valores duplicados são removidos automaticamente.

---

## Não depender da ordem dos elementos

`Set` não foi feito para acesso ordenado.

Se ordem importa, prefira `List`.

---

## Não acessar por índice

Errado:

```dart
set[0]
```

`Set` não possui índices como listas.

---

## Tipar corretamente

```dart
Set<String> nomes = {};
```

Evita erros e melhora organização.

---

## Usar `contains()` para buscas

```dart
nomes.contains("João");
```

É uma das grandes vantagens do `Set`.

---

## Converter para List quando precisar de índice

```dart
final lista = set.toList();
```

Permite acessar posições específicas.

---

## Ter cuidado ao modificar durante loops

```dart
for (final item in set)
```

Modificar o próprio `Set` durante iteração pode gerar erros.

---

## Escolher Set apenas quando fizer sentido

Use `Set` quando:

- não quiser repetição
- precisar de buscas rápidas
- trabalhar com valores únicos

Caso contrário, `List` pode ser melhor.

---

# <u>`elementAtOrNull` em Dart </u>

## O que é

O método `elementAtOrNull()` retorna o elemento em um índice específico.

A diferença para `elementAt()` é que:

- `elementAt()` gera erro se o índice não existir
- `elementAtOrNull()` retorna `null`

---

# Sintaxe

```dart
iterable.elementAtOrNull(indice)
```

---

# Exemplo

```dart
List<String> nomes = [
  "João",
  "Maria"
];

print(nomes.elementAtOrNull(1));
```

Resultado:

```text
Maria
```

---

# Índice inexistente

```dart
print(nomes.elementAtOrNull(5));
```

Resultado:

```text
null
```

---

# Diferença entre `elementAt()` e `elementAtOrNull()`

| Método | Com índice inválido |
|---|---|
| `elementAt()` | gera erro |
| `elementAtOrNull()` | retorna `null` |

---

# Vantagem

Evita erros como:

```text
RangeError
```

quando o índice não existe.

---

# Retorno

```dart
E?
```

Ou seja:

- retorna o elemento
- ou `null`

---

# Onde funciona

Pode ser usado em:

- `List`
- `Set`
- outros `Iterable`

---

# Exemplo com Set

```dart
Set<String> nomes = {
  "João",
  "Maria"
};

print(nomes.elementAtOrNull(0));
```

---

# Observação importante

`elementAtOrNull()` pertence às extensões de `Iterable`.

Em algumas versões do Dart pode ser necessário:

```dart
import 'package:collection/collection.dart';
```

dependendo do ambiente/projeto.