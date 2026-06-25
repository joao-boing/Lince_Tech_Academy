//Imports
import 'package:ap1/models/pessoa.dart';
import 'package:flutter/material.dart';


class EstadoListaDePessoas with ChangeNotifier {
  //Adicionando pessoa à lista
  final _listaDePessoas = <Pessoa>[
    Pessoa(
      nome: "Adam",
      email: "Adam@hotmail.com",
      github: "https://github.com/adam",
      telefone: "5547999999999",
      tipoSanguineo: TipoSanguineo.aPositivo,
    ),
    Pessoa(
      nome: "Vanessa",
      email: "Vanessa@gmail.com",
      github: "https://github.com/Vanessa",
      telefone: "554788888888",
      tipoSanguineo: TipoSanguineo.bNegativo,
    ),
    Pessoa(
      nome: "Alisson",
      email: "Alisson@outlook.com",
      github: "https://github.com/Alisson",
      telefone: "554712512512",
      tipoSanguineo: TipoSanguineo.abPositivo,
    ),
    Pessoa(
      nome: "Matheus",
      email: "Matheus@gmail.com",
      github: "https://github.com/Matheus",
      telefone: "55479123123221",
      tipoSanguineo: TipoSanguineo.abPositivo,
    ),
    Pessoa(
      nome: "Emily",
      email: "Emily@hotmail.com",
      github: "https://github.com/Emily",
      telefone: "554712353211",
      tipoSanguineo: TipoSanguineo.oNegativo,
    ),
  ];

  //Atributos de filtragem
  String _buscaNome = '';
  TipoSanguineo? _filtroTipoSanguineo;

  //Get pessoas modificado para a filtragem
  List<Pessoa> get pessoas {
    //Retorna apenas as pessoas com os filtros
    return _listaDePessoas.where((pessoa) {
      //Bool nomeFiltro recebe se o nome da pessoa confere com o nome de busca
      final nomeFiltro = pessoa.nome.toLowerCase().contains(_buscaNome.toLowerCase());
      
      //Bool tipoFiltro recebe se o tipo da pessoa confere com o tipo de busca
      final tipoFiltro = _filtroTipoSanguineo == null ||pessoa.tipoSanguineo == _filtroTipoSanguineo;
      
      //Retorna os booleanos (Se for verdade, retorna a pessoa)
      return nomeFiltro && tipoFiltro;
    }).toList();
  }

  //Método para aplicar os filtros na busca
  void aplicarFiltros({String? nome, TipoSanguineo? tipo, bool limparTipo = false}) {
    if (nome != null) _buscaNome = nome;
    if (tipo != null) _filtroTipoSanguineo = tipo;
    if (limparTipo) _filtroTipoSanguineo = null;
    
    notifyListeners();
  }

  //Método incluir pessoa
  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  //Método excluir pessoa
  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  //Verifica o tipo da pessoa para a sua determinada cor
  Color verificarTipoSanguineo(Pessoa pessoa) {
    switch (pessoa.tipoSanguineo) {
      case TipoSanguineo.aPositivo:
        return Colors.blue;

      case TipoSanguineo.aNegativo:
        return Colors.red;

      case TipoSanguineo.bPositivo:
        return Colors.purple;

      case TipoSanguineo.bNegativo:
        return Colors.orange;

      case TipoSanguineo.oPositivo:
        return Colors.green;

      case TipoSanguineo.oNegativo:
        return Colors.yellow;

      case TipoSanguineo.abPositivo:
        return Colors.cyan;

      case TipoSanguineo.abNegativo:
        return Colors.white;
    }
  }

  //Método para atualizar os dados da pessoa
  void atualizar({required Pessoa pessoa, String? nomeNovo, String? emailNovo, String? telefoneNovo, String? githubNovo, TipoSanguineo? tipoNovo}) {
  //Pega os indice da pessoa na lista
  final indice = _listaDePessoas.indexOf(pessoa);

    //Se o indice não for negativo
    if (indice > -1) {
      //A pessoa atualizada é criada com os novo atributos
      final pessoaAtualizada = Pessoa(
        //Se o atributo foi enviado, ele muda, se não, mantém o original
        nome: nomeNovo ?? pessoa.nome,
        email: emailNovo ?? pessoa.email,
        telefone: telefoneNovo ?? pessoa.telefone,
        github: githubNovo ?? pessoa.github,
        tipoSanguineo: tipoNovo ?? pessoa.tipoSanguineo,
      );

      //Substitui pela pessoa antiga
      _listaDePessoas[indice] = pessoaAtualizada;

      notifyListeners();
    }
  }
}