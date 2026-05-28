void main()
  {
    //Declarando o objeto Retangulo
    var retangulo = Retangulo(14.52, 21.91);

    //Declarando a área chamando o método calcularArea
    var area = retangulo.calcularArea();

    //Imprimindo a área
    print("Área do Retângulo: $area");
  }

//Classe que representa um retângulo
class Retangulo
  {
    //Declarando os atributos
    final double altura;
    final double largura;

    //Construtor
    Retangulo(this.altura, this.largura);

    //Método para calcular área
    double calcularArea()
      {
        double area = largura * altura;
        return area;
      }
  }