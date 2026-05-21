import 'dart:math';
Random random = new Random();
void main() 
  {
    //Declarando as variáveis
    final raios = List.generate(5, (_) => 1 + random.nextDouble() * 100);

    for(double numero in raios)
      {
        print("""
            Raio: ${numero.toStringAsFixed(2)}, Área: ${calcArea(numero).toStringAsFixed(2)}, Perímetro: ${calcPerimetro(numero).toStringAsFixed(2)}
              """);      
      }
  }

double calcArea(double numero)
  {
    double resultado = pi * pow(numero, 2);
    return resultado;
  }

double calcPerimetro(double numero)
  {
    double resultado = 2 * pi * numero;
    return resultado;
  }