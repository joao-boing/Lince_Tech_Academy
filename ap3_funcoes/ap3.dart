import 'dart:math';
//Instancinado o random
Random random = new Random();
void main() 
  {
    //Declarando as variáveis
    final raios = List.generate(5, (_) => 1 + random.nextDouble() * 100);

    //Loop para imprimir cada elemento de raios, com o Raio, Área e Perímetro
    for(double numero in raios)
      {
        print("""
            Raio: ${numero.toStringAsFixed(2)}, Área: ${calcArea(numero).toStringAsFixed(2)}, Perímetro: ${calcPerimetro(numero).toStringAsFixed(2)}
              """);      
      }
  }

//Função Calcular Área
double calcArea(double numero)
  {
    //Equação de Cálculo de Área de Círculos
    double resultado = pi * pow(numero, 2);
    return resultado;
  }

//Função Calcular Perímetro
double calcPerimetro(double numero)
  {
    //Equação de Cálculo de Perímetro de Círculos
    double resultado = 2 * pi * numero;
    return resultado;
  }