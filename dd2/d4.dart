import 'dart:math' as math;

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Todas as formas geometricas herdam FormaGeométrica (Polimorfismo)
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);
  final trianguloEquilatero = TrianguloEquilatero('Triângulo Equilátero', 5);
  final trianguloRetangulo = TrianguloRetangulo('Triângulo Retângulo', 50, 10);
  final pentagonoRegular = PentagonoRegular('Pentagono Regular', 15);
  final hexagonoRegular = HexagonoRegular('Hexagono Regular', 10);

  //Atribuindo os valores às variáveis através do metodo comparador de maior área
  final circuloMaiorArea = comparador.formaDeMaiorArea(circuloA, circuloB);
  final retanguloMaiorArea = comparador.formaDeMaiorArea(retanguloA, retanguloB,);
  final trianguloMaiorArea = comparador.formaDeMaiorArea(trianguloEquilatero, trianguloRetangulo);
  final regularMaiorArea = comparador.formaDeMaiorArea(pentagonoRegular, hexagonoRegular);
  
  //Atribuindo os valores às variáveis através do metodo comparador de maior área
  final FormaGeometrica formaMaiorAreaA = comparador.formaDeMaiorArea(circuloMaiorArea, retanguloMaiorArea);
  final FormaGeometrica formaMaiorAreaB = comparador.formaDeMaiorArea(trianguloMaiorArea, regularMaiorArea);

  //Verifica qual das áreas é a maior e imprime
  if (formaMaiorAreaA.area > formaMaiorAreaB.area) {
    print('A maior area e ${formaMaiorAreaA.area.toStringAsFixed(2)}cm² '
          'e pertence a ${formaMaiorAreaA.nome}',);
  } else{
    print('A maior area e ${formaMaiorAreaB.area.toStringAsFixed(2)}cm² '
          'e pertence a ${formaMaiorAreaB.nome}',);
  }
  
  //Atribuindo os valores às variáveis através do metodo comparador de maior perímetro
  final circuloaiorPerimetro = comparador.formaDeMaiorPerimetro(circuloA, circuloB,);
  final retanguloMaiorPerimetro = comparador.formaDeMaiorPerimetro(retanguloA, retanguloB,);
  final trianguloMaiorPerimetro = comparador.formaDeMaiorPerimetro(trianguloEquilatero, trianguloRetangulo);
  final regularMaiorPerimetro = comparador.formaDeMaiorPerimetro(pentagonoRegular, hexagonoRegular);

  //Atribuindo os valores às variáveis através do metodo comparador de maior perímetro
  final FormaGeometrica formaMaiorPerimetroA = comparador.formaDeMaiorPerimetro(circuloaiorPerimetro, retanguloMaiorPerimetro);
  final FormaGeometrica formaMaiorPerimetroB = comparador.formaDeMaiorPerimetro(trianguloMaiorPerimetro, regularMaiorPerimetro);
  
  //Verifica qual dos perímetros é a maior e imprime
  if (formaMaiorPerimetroA.perimetro > formaMaiorPerimetroB.perimetro) {
    print('O maior perimetro e ${formaMaiorPerimetroA.perimetro.toStringAsFixed(2)}cm '
          'e pertence a ${formaMaiorPerimetroA.nome}',);
  } else{
    print('O maior perimetro e ${formaMaiorPerimetroB.perimetro.toStringAsFixed(2)}cm '
          'e pertence a ${formaMaiorPerimetroB.nome}',);
  }
}

//Utilizar a herança da classe FormaGeometrica para todas as formas 
abstract class FormaGeometrica
  {
    //Nome da forma
    final String nome;

    //Construtor
    FormaGeometrica(this.nome);

    //Métodos get área e get perimetro
    double get area;
    double get perimetro;
  }

/// Representa a forma geometrica "círculo"
class Circulo extends FormaGeometrica {
  /// Construtor padrao, recebe o [raio] do círculo.
  Circulo(String nome, this.raio) : super(nome);

  final double raio;

  /// Retorna a area desse círculo
  double get area => math.pi * math.pow(raio, 2);

  /// Retorna o perímetro desse círculo
  double get perimetro => 2 * math.pi * raio;
}

/// Representa a forma geometrica "retângulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo extends FormaGeometrica{
  /// Construtor padrao, recebe a [altura] e [largura] do retângulo
  Retangulo(String nome, this.altura, this.largura): super(nome);

  final double largura;
  final double altura;

  /// Retorna a area desse retângulo
  double get area => altura * largura;

  /// Retorna o perímetro desse retângulo
  double get perimetro => (altura * 2) + (largura * 2);
}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado extends FormaGeometrica{
  /// Construtor padrao, recebe o [lado] do quadrado
  Quadrado(String nome, this.lado): super(nome);

  final double lado;

  /// Retorna a area desse quadrado
  double get area => lado * lado;

  /// Retorna o perímetro desse quadrado
  double get perimetro => lado * 4;
}

//Classe que representa um triango equilatero (todos os lados iguais)
//Inclua no sistema a definição da forma geométrica Triangulo equilátero
class TrianguloEquilatero extends FormaGeometrica
  {
    /// Construtor padrao, recebe o [lado] do triangulo equilatero
    TrianguloEquilatero(String nome, this.lado) : super(nome);

    final double lado;

    // Retorna a area desse triângulo
    double get area => ((math.pow(lado, 2)) * math.sqrt(3)) / 4;

    //Retorna o perimetro desse triângulo
    double get perimetro => lado * 3;
  }

//Classe que representa um triango Retângulo
//Inclua no sistema a definição da forma geométrica Triangulo retângulo
class TrianguloRetangulo extends FormaGeometrica
  {
    ///Construtor padrao, recebe o [catetoA] e [catetoB] do triângulo Retângulo
    TrianguloRetangulo(String nome, this.catetoA, this.catetoB) : super(nome);

    final double catetoA;
    final double catetoB;
    
    //Retorna a hipotenusa desse triângulo
    double get hipotenusa => math.sqrt(math.pow(catetoA, 2) + math.pow(catetoB, 2));

    //Retorna a área desse triângulo
    double get area => (catetoA * catetoB) / 2;

    //Retorna o perímetro desse triângulo
    double get perimetro => (catetoA + catetoB + hipotenusa);
  }

//Classe que representa um pentágono regular (todos os lados iguais)
//Inclua no sistema a definição da forma geométrica Pentágono regular
class PentagonoRegular extends FormaGeometrica
  {
    ///Construtor padrão, recebe o [lado] do pentágono
    PentagonoRegular(String nome, this.lado) : super(nome);

    final double lado;

    //Retorna a área desse pentágono
    double get area => (math.sqrt(25 + 10 * math.sqrt(5))/ 4) * math.pow(lado, 2);

    //Retorna o perímetro desse pentágono
    double get perimetro => (lado * 5);
  }

//Classe que representa um hexágono regular (todos os lados iguais)
//Inclua no sistema a definição da forma geométrica hexágono regular
class HexagonoRegular extends FormaGeometrica
  {
    ///Construtor padrão, recebe o [lado] do hexágono
    HexagonoRegular(String nome, this.lado) : super(nome);

    final double lado;

    //Retorna a área desse hexágono
    double get area => ((3 * math.sqrt(3)) / 2) *  math.pow(lado, 2);

    //Retorna o perímetro desse hexágono
    double get perimetro => lado * 6;
  }

/// Compara caracteristicas de formas geometricas
/// Alterar a classe ComparadorFormasGeometricas para ter apenas dois métodos, uma para area e um para perímetro
class ComparadorFormasGeometricas {

  FormaGeometrica formaDeMaiorArea(FormaGeometrica formaA, FormaGeometrica formaB)
    {
      if(formaA.area > formaB.area)
        {
          return formaA;
        }
      else if(formaA.area < formaB.area)
        {
          return formaB;
        }
      return formaA;
    }

  FormaGeometrica formaDeMaiorPerimetro(FormaGeometrica formaA, FormaGeometrica formaB)
    {
      if(formaA.perimetro > formaB.perimetro)
        {
          return formaA;
        }
      else if(formaA.perimetro < formaB.perimetro)
        {
          return formaB;
        }
      return formaA;
    }
}