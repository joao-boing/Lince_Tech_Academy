import 'dart:math';

//Interface form com método abstrato
abstract class Forma 
  {
    double calcularArea();
  }

//Classe Retangulo que implementa forma
class Retangulo implements Forma 
  {
    //Declarando as variáveis
    double _base;
    double _altura;

    //Construtor
    Retangulo(this._base, this._altura) 
      {
        //Verifica se a base ou a altura são menor ou igual a zero
        if (_base <= 0 || _altura <= 0) 
          {
            //Lanca Exception
            throw Exception(
              "Dimensões inválidas, informe apenas valores positivos maiores que zero",
            );
          }
      }

    //Define a função calcularArea
    @override
    double calcularArea() 
      {
        return _base * _altura;
      }
  }

void main() 
  {
    //Instanciando o Random
    final random = Random();
    
    //Calcula a área do retângulo usando a classe retângulo
    try 
      {
        //Declarando as variáveis
        double base = random.nextInt(100).toDouble();
        double altura = random.nextInt(100).toDouble();

        //Imprime a base e a altura
        print("Base: $base");
        print("Altura: $altura");

        //Declara a variável Retangulo
        Retangulo retangulo = Retangulo(base, altura);

        //Imprime a área chamando a função
        print(
          "Area do retângulo: ${retangulo.calcularArea().toStringAsFixed(2)}",
        );
      } 
    catch (e) 
      {
        //Lança a Exception
        print(e);
      }
  }