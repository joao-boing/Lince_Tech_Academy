import 'dart:math';

void main()
  {
    //Inicializando o random
    Random random = new Random();

    //Declarando as variáveis
    final List<int> nums = List.generate(50, (_) => random.nextInt(16));

    //Imprime a lista
    print("Lista Original: ${nums.join(" ; ")}");

    //Remove os números não-ímpares (pares)
    nums.removeWhere((item) => !item.isOdd);

    //Imprime a lista sem os não-ímpares
    print("Lista atualizada: ${nums.join(" ; ")}");
  }