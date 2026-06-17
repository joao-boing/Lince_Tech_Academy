# Flutter – TextField, TextFormField, Validação, CheckBox e Radio

---

# O que é um widget TextField em Flutter e para que ele serve?

O widget `TextField` é um componente utilizado para permitir que o usuário digite informações na aplicação.

Ele é um dos widgets mais utilizados em Flutter, sendo fundamental para a criação de formulários, telas de login, pesquisas, cadastros e qualquer situação que exija entrada de dados.

---

## Exemplos de uso

- Login
- Cadastro de usuários
- Campo de busca
- Comentários
- Mensagens
- Formulários em geral

---

## Exemplo básico

```dart
TextField()
```

---

## Exemplo completo

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Nome',
    hintText: 'Digite seu nome',
  ),
)
```

---

# Como posso obter o valor digitado pelo usuário em um TextField?

Existem duas formas principais.

---

# Utilizando TextEditingController

É a forma mais comum e recomendada.

---

## Criando o controlador

```dart
final TextEditingController nomeController =
    TextEditingController();
```

---

## Associando ao TextField

```dart
TextField(
  controller: nomeController,
)
```

---

## Obtendo o valor

```dart
String nome = nomeController.text;

print(nome);
```

---

## Exemplo completo

```dart
TextEditingController nomeController =
    TextEditingController();

TextField(
  controller: nomeController,
);

ElevatedButton(
  onPressed: () {

    print(nomeController.text);

  },
  child: Text('Enviar'),
);
```

---

# Utilizando onChanged

Permite capturar o valor enquanto o usuário digita.

---

## Exemplo

```dart
TextField(
  onChanged: (valor) {

    print(valor);

  },
)
```

Sempre que o texto mudar, o callback será executado.

---

# Qual a diferença entre um TextField e um TextFormField?

Embora sejam parecidos, possuem finalidades diferentes.

---

# TextField

É utilizado para entrada simples de texto.

---

## Exemplo

```dart
TextField()
```

Não possui validação integrada.

---

# TextFormField

É uma versão avançada do TextField.

---

## Exemplo

```dart
TextFormField()
```

Possui integração com formulários e validação.

---

# Comparação

| Característica | TextField | TextFormField |
|---------------|-----------|---------------|
| Entrada de texto | Sim | Sim |
| Validação integrada | Não | Sim |
| Integração com Form | Não | Sim |
| Ideal para formulários | Não | Sim |

---

# Exemplo de validação

```dart
TextFormField(
  validator: (valor) {

    if (valor == null || valor.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  },
)
```

---

# Quais parâmetros importantes do TextField?

---

# controller

Controla o conteúdo digitado.

```dart
controller: nomeController
```

---

# decoration

Personaliza a aparência.

```dart
decoration: InputDecoration(
  labelText: 'Nome',
)
```

---

# keyboardType

Define o tipo de teclado.

```dart
keyboardType: TextInputType.number
```

---

## Exemplos

```dart
TextInputType.text
```

```dart
TextInputType.number
```

```dart
TextInputType.emailAddress
```

```dart
TextInputType.phone
```

---

# obscureText

Oculta o texto.

Muito utilizado para senhas.

```dart
obscureText: true
```

---

# maxLength

Limita caracteres.

```dart
maxLength: 50
```

---

# maxLines

Define quantidade de linhas.

```dart
maxLines: 5
```

---

# readOnly

Impede edição.

```dart
readOnly: true
```

---

# enabled

Habilita ou desabilita.

```dart
enabled: false
```

---

# onChanged

Executado quando o texto muda.

```dart
onChanged: (texto) {}
```

---

# onSubmitted

Executado quando o usuário conclui a digitação.

```dart
onSubmitted: (texto) {}
```

---

# O que significa validar um campo de texto em Flutter?

Validar significa verificar se os dados digitados atendem determinadas regras antes de serem processados.

---

# Exemplos de validação

Verificar:

- Campo vazio
- E-mail válido
- Senha mínima
- CPF válido
- Telefone válido
- Valor numérico

---

## Exemplo

```dart
validator: (valor) {

  if (valor == null || valor.isEmpty) {
    return 'Campo obrigatório';
  }

  return null;
}
```

---

# Por que validar?

A validação ajuda a:

- Evitar erros
- Garantir dados corretos
- Melhorar a experiência do usuário
- Aumentar a segurança

---

# Qual a diferença entre validação síncrona e assíncrona?

---

# Validação síncrona

Acontece imediatamente.

Não depende de internet ou banco de dados.

---

## Exemplo

```dart
validator: (valor) {

  if (valor!.length < 6) {
    return 'Senha muito curta';
  }

  return null;
}
```

Resultado instantâneo.

---

# Validação assíncrona

Depende de uma operação externa.

Pode exigir:

- API
- Banco de dados
- Servidor

---

## Exemplo

```dart
Future<bool> verificarEmail(
    String email) async {

  return await api.emailExiste(email);
}
```

---

## Casos comuns

- Verificar usuário existente
- Verificar e-mail cadastrado
- Consultar CPF
- Buscar dados online

---

# Comparação

| Tipo | Velocidade | Requer Internet |
|--------|------------|----------------|
| Síncrona | Instantânea | Não |
| Assíncrona | Pode demorar | Geralmente sim |

---

# O que é um widget CheckBox em Flutter e para que ele serve?

O widget `Checkbox` permite que o usuário marque ou desmarque uma opção.

---

## Exemplo visual

```text
☑ Aceito os termos
```

ou

```text
☐ Aceito os termos
```

---

# Exemplo básico

```dart
bool aceito = false;

Checkbox(
  value: aceito,
  onChanged: (valor) {

    setState(() {
      aceito = valor!;
    });

  },
)
```

---

# Aplicações comuns

- Termos de uso
- Preferências
- Configurações
- Seleção múltipla

---

# Como posso alterar a cor e a forma de um CheckBox?

---

# Cor

```dart
Checkbox(
  activeColor: Colors.green,
)
```

---

# Cor da borda

```dart
Checkbox(
  side: BorderSide(
    color: Colors.red,
    width: 2,
  ),
)
```

---

# Forma

```dart
Checkbox(
  shape: RoundedRectangleBorder(
    borderRadius:
      BorderRadius.circular(8),
  ),
)
```

---

## Exemplo completo

```dart
Checkbox(
  value: valor,
  activeColor: Colors.blue,

  shape: RoundedRectangleBorder(
    borderRadius:
      BorderRadius.circular(10),
  ),

  onChanged: (v) {},
)
```

---

# O que é um widget Radio em Flutter e qual sua aplicabilidade?

O widget `Radio` permite selecionar apenas uma opção dentre várias disponíveis.

---

## Exemplo

```text
( ) Masculino
(*) Feminino
( ) Outro
```

Apenas uma opção pode estar selecionada.

---

# Quando utilizar?

- Sexo
- Forma de pagamento
- Tema do aplicativo
- Escolha única de opções

---

# Exemplo básico

```dart
String opcao = 'A';
```

```dart
Radio<String>(
  value: 'A',
  groupValue: opcao,

  onChanged: (valor) {

    setState(() {
      opcao = valor!;
    });

  },
)
```

---

# Como funciona?

---

## value

Representa a opção atual.

```dart
value: 'A'
```

---

## groupValue

Representa a opção selecionada.

```dart
groupValue: opcao
```

Quando os dois valores coincidem, o Radio aparece marcado.

---

# Exemplo completo

```dart
Column(
  children: [

    Radio<String>(
      value: 'Masculino',
      groupValue: sexo,
      onChanged: (valor) {
        setState(() {
          sexo = valor!;
        });
      },
    ),

    Radio<String>(
      value: 'Feminino',
      groupValue: sexo,
      onChanged: (valor) {
        setState(() {
          sexo = valor!;
        });
      },
    ),
  ],
)
```

---

# Como posso alterar a cor e a forma de um Radio?

---

# Cor

```dart
Radio(
  activeColor: Colors.green,
)
```

---

# Cor usando fillColor

Mais moderno.

```dart
Radio(
  fillColor:
      WidgetStateProperty.all(
          Colors.blue),
)
```

---

# Forma

O widget Radio possui formato circular por padrão.

Atualmente o Flutter não permite alterar completamente o formato do Radio para quadrado ou outros formatos usando apenas propriedades simples.

Caso seja necessário um formato diferente, normalmente utiliza-se:

- Widgets personalizados
- Containers customizados
- Pacotes externos

---

# Exemplo

```dart
Radio<String>(
  value: 'A',
  groupValue: opcao,
  activeColor: Colors.purple,
  onChanged: (valor) {},
)
```