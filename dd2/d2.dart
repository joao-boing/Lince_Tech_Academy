import 'dart:math';

var random = Random();

void main() {
  //Instanciando o random
  final random = Random();
  //Instanciando Pessoa
  final pessoa = Pessoa();

  //Lista de fornecedores
  List<Fornecedor> fornecedores = [FornecedorDeBebidas(),
  FornecedorDeBolos(),
  FornecedorDePetiscos(),
  FornecedorDeSaladas(),
  FornecedorDeSanduiches(),
  FornecedorDeUltraCaloricos()];

  // Consumindo produtos fornecidos aleatóriamente com base na necessidade da pessoa
  while(pessoa._caloriasConsumidas < pessoa._calorias) {
    //Escolhe um fornecedor aleatório
    Fornecedor fornecedor = fornecedores[random.nextInt(fornecedores.length)];
    //Fornecedor fornece o produto
    fornecedor.fornecer();
    //Pessoa come o produto
    pessoa.refeicao(fornecedor);
  }

  //Imprime as informações da pessoa
  pessoa.informacoes();
}

//Classe Produto
class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

//Classe abstrata de Fornecedor
abstract class Fornecedor
  {
    final _random = Random();
    final _produtosDisponiveis = <Produto>[];
    Produto fornecer()
      {
        return _produtosDisponiveis[_random.nextInt(_produtosDisponiveis.length)];
      }
  }

//Classe fornecedor de Bebidas, Herda Fornecedor
class FornecedorDeBebidas extends Fornecedor{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

//Classe fornecedor de Sanduiches, Herda Fornecedor
class FornecedorDeSanduiches extends Fornecedor{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Sanduiche Comum', 500),
    Produto('Sanduiche de Frango', 700),
    Produto('Sanduiche de Bacon', 800),
    Produto('Sanduiche Lite', 250),
    Produto('Sanduiche de Picanha', 750),
    Produto('Sanduiche Doce', 1000),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

//Classe fornecedor de Bolos, Herda Fornecedor
class FornecedorDeBolos extends Fornecedor{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Bolo de Chocolate', 1200),
    Produto('Bolo de Coco', 1000),
    Produto('Bolo de Ninho', 1300),
    Produto('Bolo de Chocolate Branco', 1500),
    Produto('Bolo de Milho', 1100),
    Produto('Bolo Lite', 750),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

//Classe fornecedor de Saladas, Herda Fornecedor
class FornecedorDeSaladas extends Fornecedor{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Salada de Vegetais', 300),
    Produto('Salada de Frutas', 350),
    Produto('Salada de Frutas e Vegetais', 325),
    Produto('Salada de Batata', 400),
    Produto('Salada de Batata Com Requeijão', 500),
    Produto('Salada Frutas Vermelhas', 350),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

//Classe fornecedor de Petiscos, Herda Fornecedor
class FornecedorDePetiscos extends Fornecedor{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Batata Frita', 750),
    Produto('Camarão', 800),
    Produto('Frutos do Mar', 850),
    Produto('Anéis de Cebola Frita', 700),
    Produto('Ovo de Codorna', 600),
    Produto('Linguicinha', 1000),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

//Classe fornecedor de Produtos Ultra Calóricos, Herda Fornecedor
class FornecedorDeUltraCaloricos extends Fornecedor{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Salgadinho', 1000),
    Produto('Bolachas', 1200),
    Produto('Achocolatado', 1000),
    Produto('Leite Condensado', 1500),
    Produto('Barra de Chocolate', 700),
    Produto('Brigadeiro', 1700),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class Pessoa {
  //Gera um número aleatório de calorias
  int _calorias = random.nextInt(2501);
  //Acumulador de Refeições
  int _refeicoesRealizadas = 0;
  //Acumulador de calorias
  int _caloriasConsumidas = 0;
  
  //método verificar Status
  Status verificarStatus(_caloriasConsumidas)
    {
      if(_caloriasConsumidas <= 500)
      {
        return Status.DeficitExtremo;
      }
    else if(500 < _caloriasConsumidas && _caloriasConsumidas <= 1800)
      {
        return Status.Deficit;
      }
    else if(1800 < _caloriasConsumidas && _caloriasConsumidas <= 2500)
      {
        return Status.Satisfeita;
      }
    else
      {
        return Status.Excesso;
      }
    }

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    //Verifica como está o consumo de calorias do consumidor
    switch(verificarStatus(_caloriasConsumidas))
      {
        case Status.DeficitExtremo: print("Pessoa está com deficit Extremo de calorias");
          break;
        case Status.Deficit: print("Pessoa está com deficit de calorias");
          break;
        case Status.Satisfeita: print("Pessoa está Satisfeita");
          break;
        case Status.Excesso: print("Pessoa está com Excesso de calorias");
          break;
      }

    //Imprime as refeições realizadas
    print('Refeições realizadas: $_refeicoesRealizadas');
    //Imprime as calorias consumidas
    print('Calorias consumidas: $_caloriasConsumidas');
  }

  /// Consome um produto e aumenta o número de calorias e refeições
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    _refeicoesRealizadas++;
  }
}

//Enum de Status
enum Status 
{
  DeficitExtremo,
  Deficit,
  Satisfeita,
  Excesso
}