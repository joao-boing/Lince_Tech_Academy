//Classe abstrata que representa Refrigerante
abstract class Refrigerante
  {
    void encherRefrigerante();
  }

//Classe abstrata que representa Água
abstract class Agua
  {
    void encherAgua();
  }

//Classe copo, implementa Água e Refrigerante
class Copo implements Agua, Refrigerante
  { 
    //Método para encher o copo com água
    void encherAgua()
      {
        print("O copo foi preenchido com água");
      }
    
    //Método para encher o copo com refrigerante
    void encherRefrigerante()
      {
        print("O copo foi preenchido com Refrigerante");
      }
  }
void main()
  {
    //Instanciando o objeto copo
    final copo = Copo();

    //Chamando os métodos
    copo.encherAgua();
    copo.encherRefrigerante();
  }