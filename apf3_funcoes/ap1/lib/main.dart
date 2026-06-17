import 'package:flutter/material.dart';

Color corPadrao = const Color.fromARGB(255, 10, 50, 125);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: corPadrao,
      ),
      home: const Scaffold(
        body: Center(
          child: MyScreen(),
        ),
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _nome = '';
  int _idade = 0;
  bool _ativo = false;

  List<Usuario> lista = [];

  void salvarUsuario(String nome, int idade, bool ativo) {
    setState(() {
      Usuario usuario = Usuario(nome, idade, ativo);

      int indiceExistente = lista.indexWhere(
        (u) => u.nome.toLowerCase() == nome.toLowerCase()
      );

      if (indiceExistente >= 0) {
        lista[indiceExistente] = usuario;
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dados do usuário atualizados!')),
        );
      } else {
        lista.add(usuario);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Novo usuário cadastrado!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Formulário Básico",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Input do Nome
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Por favor, digite o seu nome";
                }
                if (value.length <= 3) {
                  return "Seu nome deve possuir pelo menos 4 caracteres";
                }
                if (value[0] == value[0].toLowerCase()) {
                  return "Seu nome deve começar com letra maiúscula";
                }
                return null;
              },
              onChanged: (text) => _nome = text,
            ),

            const SizedBox(height: 16),

            // Input da Idade
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Idade",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, digite a sua idade";
                }

                int? valueFormatado = int.tryParse(value);

                if (valueFormatado == null || valueFormatado <= 0 || valueFormatado > 130) {
                  return "Insira uma idade válida";
                }
                if (valueFormatado <= 17) {
                  return "Você tem que ser maior de idade";
                }
                return null;
              },
              onChanged: (text) {
                _idade = int.tryParse(text) ?? 0;
              },
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _ativo,
                  onChanged: (bool? checked) {
                    setState(() {
                      _ativo = checked ?? false;
                    });
                  },
                ),
                const Text("Ativo")
              ],
            ),

            const SizedBox(height: 16),

            // Botão Salvar
            ElevatedButton(
              onPressed: () {
                // Dispara a validação protetora dos validadores
                if (_formKey.currentState!.validate()) {
                  salvarUsuario(_nome, _idade, _ativo);
                }
              },
              child: const Text("Salvar"),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, indice) {
                  final usuario = lista[indice];

                  

                  return Container(
                    margin: EdgeInsets.all(8),
                    color: usuario.ativo ? Colors.green : Colors.grey,
                    child: ListTile(
                      title: Text(
                        'Usuário: ${usuario.nome}\nIdade: ${usuario.idade}\n${usuario.ativo ? 'Ativo' : 'Inativo'}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Modelo de dados do Usuário
class Usuario {
  final String nome;
  final int idade;
  final bool ativo;

  Usuario(this.nome, this.idade, this.ativo);
}