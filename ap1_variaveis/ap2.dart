void main()
  {
    //Declarando as variáveis
    const int totalNumeros = 4;
    const double num1 = 2.5, 
    num2 = 5.7,
    num3 = 9.5,
    num4 = 6.3;
    
    //Declarando a média
    final double media = (num1 + num2 + num3 + num4) / totalNumeros;

    //imprimindo a média
    print("A média entre [$num1, $num2, $num3, $num4] = $media");
  }