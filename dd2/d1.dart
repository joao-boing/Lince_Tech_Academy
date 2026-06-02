// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

// -------------------------------------------------------------
// ADICIONAR IMPLEMENTACAO RESTANTE ABAIXO DESSA LINHA
// -------------------------------------------------------------

//Classe que representa um meio de comunicação
class MeioDeComunicacao
  {
    late String num;

    //Método fazer ligação
    void fazerLigacao(num) {}
  }

//Classe que representa um telefone, herda MeioDe comunicação
class Telefone extends MeioDeComunicacao
  {
    //Método fazer ligação
    void fazerLigacao(num)
      {
        print("[TELEFONE] Ligando para $num");
      }
    
  }

//Classe que representa um celular, herda MeioDe comunicação
class Celular extends MeioDeComunicacao
  {
    //Método fazer ligação
    void fazerLigacao(num)
      {
        print("[Celular] Ligando para $num");
      }
  }

//Classe que representa um orelhão, herda MeioDe comunicação
class Orelhao extends MeioDeComunicacao
  {
    //Método fazer ligação
    void fazerLigacao(num)
      {
        print("[Orelhão] Ligando para $num");
      }
  }
