# Flutter – Rotas e Navegação

---

# O que são rotas anônimas em Flutter e como elas funcionam?

Rotas anônimas são páginas que são navegadas diretamente através da criação de um widget no momento da navegação, sem a necessidade de registrar previamente a rota em uma tabela de rotas.

Cada tela é criada diretamente quando o método de navegação é chamado.

---

## Exemplo

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SegundaTela(),
  ),
);
```

Neste exemplo, a tela `SegundaTela` é criada diretamente no momento da navegação.

---

## Como funciona internamente?

O Flutter mantém uma pilha (Stack) de telas.

```text
Tela Inicial
     ↓
Segunda Tela
     ↓
Terceira Tela
```

Cada chamada de `Navigator.push()` adiciona uma nova tela ao topo da pilha.

Quando usamos `Navigator.pop()`, a tela atual é removida da pilha.

---

# Quais métodos do Navigator são comumente utilizados e por quê?

O widget `Navigator` é responsável por controlar a navegação entre telas.

Os métodos mais utilizados são:

---

## Navigator.push()

Adiciona uma nova tela à pilha.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SegundaTela(),
  ),
);
```

---

## Navigator.pop()

Remove a tela atual e retorna para a anterior.

```dart
Navigator.pop(context);
```

---

## Navigator.pushReplacement()

Substitui a tela atual por outra.

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => HomePage(),
  ),
);
```

Muito utilizado em telas de login.

---

## Navigator.pushNamed()

Navega para uma rota nomeada.

```dart
Navigator.pushNamed(
  context,
  '/perfil',
);
```

---

## Navigator.pushNamedAndRemoveUntil()

Remove várias telas da pilha.

```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,
);
```

Muito utilizado após login ou logout.

---

## Navigator.popUntil()

Volta até uma rota específica.

```dart
Navigator.popUntil(
  context,
  ModalRoute.withName('/home'),
);
```

---

# Qual a função do Navigator.push() na navegação com rotas anônimas?

O método `push()` adiciona uma nova rota na pilha de navegação.

---

## Exemplo

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => PerfilPage(),
  ),
);
```

---

## Funcionamento

Antes:

```text
Home
```

Após o push:

```text
Home
 ↓
Perfil
```

A tela Home permanece na memória.

Caso o usuário volte:

```dart
Navigator.pop(context);
```

A tela Perfil é removida e a Home reaparece.

---

# Quais as vantagens e desvantagens de usar rotas anônimas?

## Vantagens

### Simplicidade

Fáceis de implementar.

```dart
Navigator.push(...)
```

---

### Boas para projetos pequenos

Quando existem poucas telas.

---

### Permitem passar parâmetros facilmente

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => PerfilPage(
      usuario: usuario,
    ),
  ),
);
```

---

## Desvantagens

### Difícil manutenção

Projetos grandes podem ter muitas navegações espalhadas.

---

### Acoplamento maior

A tela de origem conhece diretamente a tela de destino.

---

### Menor organização

Pode dificultar a escalabilidade.

---

# O que são rotas nomeadas em Flutter e como elas funcionam?

Rotas nomeadas são rotas registradas previamente no `MaterialApp`.

Cada tela recebe um nome único.

---

## Exemplo

```dart
routes: {
  '/': (context) => HomePage(),
  '/perfil': (context) => PerfilPage(),
}
```

---

## Navegação

```dart
Navigator.pushNamed(
  context,
  '/perfil',
);
```

O Flutter procura a rota registrada e abre a tela correspondente.

---

# Como posso navegar para uma rota nomeada específica?

Utilizando:

```dart
Navigator.pushNamed()
```

---

## Exemplo

```dart
Navigator.pushNamed(
  context,
  '/configuracoes',
);
```

---

## Com retorno

```dart
final resultado =
    await Navigator.pushNamed(
      context,
      '/cadastro',
    );
```

---

# Quais as vantagens de usar rotas nomeadas em relação às rotas anônimas?

## Centralização

Todas as rotas ficam em um único local.

---

## Organização

Facilita manutenção.

---

## Escalabilidade

Ideal para aplicações grandes.

---

## Reutilização

A mesma rota pode ser chamada de vários locais.

---

## Menor acoplamento

A tela de origem não precisa conhecer a implementação da tela de destino.

---

# Como posso definir rotas nomeadas em meu aplicativo Flutter?

No MaterialApp.

---

## Exemplo

```dart
MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/perfil': (context) => PerfilPage(),
    '/configuracoes':
        (context) => ConfigPage(),
  },
)
```

---

## Utilizando constantes

```dart
class Rotas {
  static const home = '/';
  static const perfil = '/perfil';
}
```

---

## Navegação

```dart
Navigator.pushNamed(
  context,
  Rotas.perfil,
);
```

---

# Como posso acessar os parâmetros passados em uma rota nomeada?

Os parâmetros são enviados através de:

```dart
arguments
```

---

## Enviando

```dart
Navigator.pushNamed(
  context,
  '/perfil',
  arguments: 'João',
);
```

---

## Recebendo

```dart
final nome =
    ModalRoute.of(context)!
        .settings
        .arguments as String;
```

---

## Exemplo completo

```dart
Text(nome);
```

---

# Como posso tornar os parâmetros opcionais em uma rota nomeada?

Utilizando nullable types.

---

## Exemplo

```dart
final nome =
    ModalRoute.of(context)
        ?.settings
        .arguments as String?;
```

---

## Definindo valor padrão

```dart
final nome =
    ModalRoute.of(context)
        ?.settings
        .arguments as String? ??
    'Visitante';
```

---

## Resultado

Se nenhum parâmetro for enviado:

```text
Visitante
```

será utilizado automaticamente.

---

# Quais cuidados devo ter ao usar as rotas?

## Evitar nomes duplicados

Errado:

```dart
'/perfil'
'/perfil'
```

---

## Evitar strings espalhadas

Prefira constantes.

```dart
Rotas.perfil
```

---

## Cuidado com argumentos nulos

Sempre verificar.

```dart
if(argumento != null)
```

---

## Evitar empilhar telas desnecessariamente

Muitos push consecutivos podem consumir memória.

---

## Utilizar pop corretamente

Sempre remover telas que não são mais necessárias.

---

# Quais as boas práticas ao usar rotas em Flutter?

## Centralizar rotas

Criar uma classe específica.

```dart
class Rotas {}
```

---

## Utilizar constantes

```dart
static const perfil = '/perfil';
```

---

## Organizar telas por pasta

```text
lib/
 ├─ pages/
 ├─ screens/
 ├─ routes/
```

---

## Utilizar rotas nomeadas em projetos grandes

Melhora manutenção.

---

## Validar argumentos recebidos

```dart
if(args == null)
```

---

## Evitar lógica complexa dentro da navegação

A navegação deve apenas trocar telas.

---

## Utilizar pushReplacement quando necessário

Especialmente em:

* Login
* Splash Screen
* Logout

---

## Limpar pilha quando necessário

```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,
);
```