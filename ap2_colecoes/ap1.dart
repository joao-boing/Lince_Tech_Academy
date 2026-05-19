import 'dart:math';

void main()
  {
    //Inicializando o random
    Random random = new Random();

    //Declarando as variáveis
    List<int> nums = List.generate(10, (_) => 1 + random.nextInt(101));

    for(int i = 0; i < nums.length; i++)
      {
        print("Posição: $i, Valor: ${nums[i]}");
      }
  }