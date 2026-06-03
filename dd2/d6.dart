import 'dart:collection';

void main() 
  {
    //Instanciando o baralho
    final baralho = Baralho();

    //Empilhando as cartas usando o método empilhar
    baralho.empilhar(Carta('A', '\u2663'));
    baralho.empilhar(Carta('A', '\u2665'));
    baralho.empilhar(Carta('A', '\u2660'));
    baralho.empilhar(Carta('A', '\u2666'));

    //Imprimindo as cartas removidas
    print('Cartas removidas do topo:');

    //Loop parar remover as cartas enquanto o baralho estiver cheio
    while (baralho.naoEstaVazio) 
      {
        final carta = baralho.desempilhar();
        print(carta);
      }
  }

//Classe que representa uma carta de baralho
class Carta 
  {
    //Atributos valor e naipe
    final String valor;
    final String naipe;

    //Set de naipes válidos
    static const Set<String> naipesValidos = 
      {
        '\u2663',
        '\u2665',
        '\u2660',
        '\u2666',
      };

    //Construtor
    Carta(this.valor, this.naipe) 
      {
        //Se o naipe for inválido, lança exception
        if (!naipesValidos.contains(naipe)) 
          {
            throw Exception('Naipe inválido');
          }
      }

    //Subscreve o toString
    @override
    String toString() 
      {
        return '$valor $naipe';
      }
  }

//Classe que representa um baralho
class Baralho 
  {
    //Queue de cartas
    final Queue<Carta> _cartas = Queue<Carta>();

    //Método para empilhar a carta no topo do baralho
    void empilhar(Carta carta) 
      {
        _cartas.addLast(carta);
      }

    //Método para desempilhar a última carta do baralho
    Carta desempilhar() 
      {
        if (_cartas.isEmpty) 
          {
            throw Exception('Baralho vazio');
          }
        return _cartas.removeLast();
      }

    //Atributo naoEstaVazio é true enquanto a queue de cartas não for vazia
    bool get naoEstaVazio => _cartas.isNotEmpty;
  }