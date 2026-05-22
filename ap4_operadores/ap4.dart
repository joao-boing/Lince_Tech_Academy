void main()
  {
    //declarando as variáveis
    var num1 = 9.54;
    var num2 = 7.50;

    //imprimindo os valores e o desconto chamando a função verificarDesconto
    print("O produto custava $num1 reais, foi vendido a $num2 reais. O desconto foi de ${verificarDesconto(num1, num2)}%");
  }

//função verificarDesconto
int verificarDesconto(double valorOriginal, double valorComDesconto)
  {
    //faz a conta do percentual de desconto
    valorComDesconto *= 100;
    valorComDesconto /= valorOriginal;

    return 100 - valorComDesconto.toInt();
  }