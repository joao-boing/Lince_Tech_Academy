import 'dart:math';
void main()
  {
    //Declarando o random
    Random random = Random();

    //Declarando as variáveis (obs : não podem ser final nem const pois seus valores serão invertidos)
    int num1 = 1 + random.nextInt(101);
    int num2 = 1 + random.nextInt(101);

    //Imprime num1 e num2 antes da troca
    print("Número 1 = $num1 \n" + 
    "Número 2 = $num2\n");

    //Variavel final Temp para inverter as variaveis sem perder seu valor
    final int temp;

    //Realizando as trocas
    temp = num1;
    num1 = num2;
    num2 = temp;

    //Imprimindo num1 e num2 trocados
    print("Número 1 = $num1 \n" + 
    "Número 2 = $num2\n");
  }