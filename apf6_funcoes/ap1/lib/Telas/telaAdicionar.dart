//imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/estado_lista_pessoas.dart';
import '../models/pessoa.dart';

//Tela de adicionar Pessoas
class TelaAdicionar extends StatefulWidget {
  const TelaAdicionar({super.key});

  //RouteName
  static const routeName = "TelaAdicionar";

  @override
  State<TelaAdicionar> createState() => _TelaAdicionarState();
}

class _TelaAdicionarState extends State<TelaAdicionar> {
  //FormKey
  final _formKey = GlobalKey<FormState>();

  //Atributos
  String nome = '';
  String email = '';
  String telefone = '';
  String github = '';
  TipoSanguineo tipo = TipoSanguineo.aNegativo;

  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar paciente")),
      //Abrindo um Consumer para acessar os dados do provider
      body: Consumer<EstadoListaDePessoas>(
        builder: (context, lista, child) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              //FormKey
              key: _formKey,
              child: Column(
                children: [
                  //Campo Nome
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                    ),
                    //Verifica se os dados estão corretos
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Por favor, digite o nome do paciente";
                      }
                      if (value.length <= 3) {
                        return "O nome deve possuir pelo menos 4 caracteres";
                      }
                      if (value[0] == value[0].toLowerCase()) {
                        return "O nome deve começar com letra maiúscula";
                      }
                      return null;
                    },
                    //Atribui o dado inserido ao nome
                    onChanged: (text) => nome = text,
                  ),

                  SizedBox(height: 20),

                  //Campo para o Email
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Por favor, digite o email da Pessoa";
                      }
                      if (!value.contains('@')) {
                        return "O email deve possuir @";
                      }
                      return null;
                    },
                    onChanged: (text) => email = text,
                  ),

                  SizedBox(height: 20),

                  //Campo para o Telefone
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Telefone",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Por favor, digite o telefone da Pessoa";
                      }
                      int? valor = int.tryParse(value);
                      if (valor == null) {
                        return "O telefone deve possuir apenas números";
                      }
                      return null;
                    },
                    onChanged: (text) => telefone = text,
                  ),

                  SizedBox(height: 20),

                  //Campo para o Github
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "GitHub",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Por favor, digite o link do github da Pessoa";
                      }
                      if (!value.contains("https://github.com/")) {
                        return "O link não é válido";
                      }
                      return null;
                    },
                    onChanged: (text) => github = text,
                  ),

                  SizedBox(height: 20),

                  //Campo para o tipo sanguíneo
                  DropdownButtonFormField<TipoSanguineo>(
                    decoration: const InputDecoration(
                      labelText: 'Selecione o Tipo Sanguíneo',
                      border: OutlineInputBorder(),
                    ),
                    items: TipoSanguineo.values.map((TipoSanguineo tipo) {
                      return DropdownMenuItem<TipoSanguineo>(
                        value: tipo,
                        child: Text(tipo.sigla),
                      );
                    }).toList(),

                    onChanged: (novoValor) {
                      setState(() {
                        tipo = novoValor!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Por favor, selecione um tipo sanguíneo";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 30),

                  //Botão de adicionar
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Chama o método incluir
                        lista.incluir(
                          Pessoa(
                            nome: nome,
                            email: email,
                            telefone: telefone,
                            github: github,
                            tipoSanguineo: tipo,
                          ),
                        );
                        //Mensagem para informar que a pessoa foi adicionada
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Alterações salvas!'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 1),
                          ),
                        );
                        //Volta para a tela principla
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Adicionar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
