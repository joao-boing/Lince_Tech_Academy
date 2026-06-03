void main() {
  final controleDePessoas = ControleDePessoas();
  
  // Cadastrando pessoas no sistema
  controleDePessoas
    ..cadastrarPessoa(Pessoa('Jose', Mes.abril))
    ..cadastrarPessoa(Pessoa('Arthur', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Joao', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jesse', Mes.dezembro))
    ..cadastrarPessoa(Pessoa('Roberta', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Carla', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Thania', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Rafaela', Mes.marco))
    ..cadastrarPessoa(Pessoa('Yuri', Mes.junho))
    ..cadastrarPessoa(Pessoa('Jonas', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Elias', Mes.outubro))
    ..cadastrarPessoa(Pessoa('Abel', Mes.maio))
    ..cadastrarPessoa(Pessoa('Danilo', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jonathan', Mes.abril))
    ..cadastrarPessoa(Pessoa('Joseph', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Abdul', Mes.janeiro))
    ..cadastrarPessoa(Pessoa('Jean', Mes.abril));

  // Passar por todos os meses com pessoas, e imprimir os nomes das pessoa
  for (final mes in controleDePessoas.mesesComPessoas) {
    print('\n${mes.name}');

    //Retorna a lista de pessoas e imprime elas
    for (final pessoa in controleDePessoas.pessoasPorMes(mes)) {
      print(' > ${pessoa.nome}');
    }
  }
}

enum Mes {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro,
}

class Pessoa {
  Pessoa(this.nome, this.mesDeNascimento);

  final String nome;
  final Mes mesDeNascimento;
}

//Classe que representa o controle de pessoas e seus meses de nascimento
class ControleDePessoas
  {
    //Cria um map (Mais fácil por conta das chaves)
    final Map<Mes, List<Pessoa>> _pessoasPorMes = {};

    //Método cadastrar pessoa
    void cadastrarPessoa(Pessoa pessoa)
      {
        //Se o mês não existir, cria uma chave desse mês e adiciona uma lista vazia nele
        _pessoasPorMes.putIfAbsent(
          pessoa.mesDeNascimento,
          () => <Pessoa>[],
        );
        //Adiciona a pessoa a lista do mês
        _pessoasPorMes[pessoa.mesDeNascimento]!.add(pessoa);
      }

    //Método get mesesComPessoas
    List<Mes> get mesesComPessoas
      {
        //Coloca as keys de _pessoasPorMes em uma lista
        final meses = _pessoasPorMes.keys.toList();

        //Ordena a lista conforme o enum
        meses.sort(
          (a, b) => a.index.compareTo(b.index),
        );

        //Retorna a lista
        return meses;
      }

    //Método pessoasPorMes
    List<Pessoa> pessoasPorMes(Mes mes)
      {
        //retorna a lista de pessoas do mês(key) informado
        return _pessoasPorMes[mes] ?? <Pessoa>[];
      }
  }