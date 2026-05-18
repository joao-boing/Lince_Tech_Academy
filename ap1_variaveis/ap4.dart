import 'dart:math';
void main()
  {
    //Declarando o random
    Random random = Random();

    //Declarando as variáveis
    final double num1 = 1 + random.nextDouble() * 100;
    final double num2 = 1 + random.nextDouble() * 100;
     print("Número 1: $num1 \nNúmero 2: $num2");

    final resultado = num1 / num2;
     print("resultado: $resultado");

    final resultadoInteiro = resultado.toInt();
     print("resultado parte inteira: $resultadoInteiro");
    
    final resultadoDecimal = resultado - resultadoInteiro;
    print("resultado parte decimal: $resultadoDecimal");
  }