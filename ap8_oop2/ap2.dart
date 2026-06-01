//Classe abstrata representando um animal
abstract class Animal
  {
    //Nome do animal
    final String nome;

    //Construtor
    Animal(this.nome);

    //Método comer
    void comer()
      {
        print("O $Animal $nome está comendo");
      }

    //Método beber
    void beber()
      {
        print("O $Animal $nome está bebendo");
      }
  }

//Classe que representa um canguru, herda a classe animal
class Canguru extends Animal
  {
    //Construtor
    Canguru(String nome) : super(nome);

    //Método pular
    void pular()
      {
        print("O $Canguru $nome está pulando");
      }
  }
void main()
  {
    //Instancia o objeto canguru
    final canguru = Canguru("Jonas");

    //Chama os métodos
    canguru.beber();
    canguru.comer();
    canguru.pular();
  }