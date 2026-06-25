//Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pessoa.dart';
import '../providers/estado_lista_pessoas.dart';

//Tela de editar
class TelaEditar extends StatefulWidget {
  static const routeName = "/Editar"; // Certifique-se de registrar essa rota no main.dart
  const TelaEditar({super.key});

  @override
  State<TelaEditar> createState() => _TelaEditarState();
}

class _TelaEditarState extends State<TelaEditar> {
  //Iniciando a formKey
  final _formKey = GlobalKey<FormState>();

  //Iniciando a pessoa original (Dados recebidos da telaLista)
  Pessoa? pessoaOriginal;

  //Iniciando os dados a serem atribuidos
  String _nome = '';
  String _email = '';
  String _telefone = '';
  String _github = '';
  TipoSanguineo? _tipoSelected;

  //Diz se já inicializou
  bool _inicializado = false;

  @override
  Widget build(BuildContext context) {
    
    //Verifica se ja foi inicializado pro build não retornar os atributos originais
    if (!_inicializado) {
      final argumentos = ModalRoute.of(context)?.settings.arguments;

      //Se os argumentos passados for uma pessoa ele atribui os dados
      if (argumentos is Pessoa) {
        pessoaOriginal = argumentos;
        _nome = argumentos.nome;
        _email = argumentos.email;
        _telefone = argumentos.telefone;
        _github = argumentos.github;
        _tipoSelected = argumentos.tipoSanguineo;
      }
      
      //Inicializou
      _inicializado = true; 
    }

    //Se a pessoa for nula, mostra que nenhum dados foi recebido
    if (pessoaOriginal == null) {
      return const Scaffold(
        body: Center(child: Text("Nenhum dado recebido.")),
      );
    }

    //Resto da tela
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Cadastro")),
      body: Form(
        key: _formKey,
        child: Consumer<EstadoListaDePessoas>(
          builder:(context, lista, child) =>
            Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //Campo nome
                TextFormField(
                  initialValue: _nome,
                  decoration: const InputDecoration(labelText: "Nome", border: OutlineInputBorder()),
                  //Validator para entrada certa de dados
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return "Digite o nome";
          
                    if (value.length <= 3) return "O nome deve possuir pelo menos 4 caracteres";
          
                    if (value[0] == value[0].toLowerCase()) return "O nome deve começar com letra maiúscula";
          
                    return null;
                  },
                  //atribui o texto para o novo nome
                  onChanged: (text) => _nome = text,
                ),
                const SizedBox(height: 15),

                //Campo email
                TextFormField(
                  initialValue: _email,
                  decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                  //Validator para entrada certa de dados
                  validator: (value) {
                        if (value == null || value.trim().isEmpty) return "Por favor, digite o email da Pessoa";
          
                        if (!value.contains('@')) return "O email deve possuir @";
          
                        return null;
                      },
                  //atribui o texto para o novo email  
                  onChanged: (text) => _email = text,
                ),
                const SizedBox(height: 15),

                //Campo telefone
                TextFormField(
                  initialValue: _telefone,
                  decoration: const InputDecoration(labelText: "Telefone", border: OutlineInputBorder()),
                  //Validator para entrada certa de dados
                  validator: (value) {
                        if (value == null || value.trim().isEmpty) return "Por favor, digite o telefone da Pessoa";
          
                        int? valor = int.tryParse(value);
          
                        if (valor == null) return "O telefone deve possuir apenas números";
          
                        return null;
                      },
                  //atribui o texto para o novo telefone  
                  onChanged: (text) => _telefone = text,
                ),
                const SizedBox(height: 15),
          
                // Campo GitHub
                TextFormField(
                  initialValue: _github,
                  decoration: const InputDecoration(labelText: "GitHub", border: OutlineInputBorder()),
                  //Validator para entrada certa de dados
                  validator: (value) {
                        if (value == null || value.trim().isEmpty) return "Por favor, digite o link do github da Pessoa";
          
                        if (!value.contains("https://github.com/")) return "O link não é válido";
          
                        return null;
                      },
                  //atribui o texto para o novo github 
                  onChanged: (text) => _github = text,
                ),
                const SizedBox(height: 15),

                //Campo Tipo Sanguíneo (DropButton)
                DropdownButtonFormField<TipoSanguineo>(
                  //Inicia com o tipo padrão
                  value: _tipoSelected,
                  decoration: const InputDecoration(labelText: 'Tipo Sanguíneo', border: OutlineInputBorder()),
                  //adiciona os itens do enum TipoSanguineo
                  items: TipoSanguineo.values.map((t) => DropdownMenuItem(value: t, child: Text(t.sigla))).toList(),
                  //Quando muda, ele muda o estado da página e muda para o novo tipo
                  onChanged: (novo) => setState(() => _tipoSelected = novo),
                ),
          
                const SizedBox(height: 30),

                //Botão para salvar as alterações
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  child: const Text("Salvar Alterações"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //Chama o método atualizar
                      lista.atualizar(
                        pessoa: pessoaOriginal!,
                        nomeNovo: _nome,
                        emailNovo: _email,
                        telefoneNovo: _telefone,
                        githubNovo: _github,
                        tipoNovo: _tipoSelected,
                      );
                      //Retorna para a tela de lista ao salvar
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}