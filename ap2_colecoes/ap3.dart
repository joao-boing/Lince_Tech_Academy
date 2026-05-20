import 'dart:math';

void main()
  {
    //Inicializando o random
    Random random = new Random();

    //Declarando as variáveis
    final List<int> nums = List.generate(50, (_) => random.nextInt(16));

    //imprimindo a lista original
    print("Lista Original: ${nums.join(" ; ")}");


    //transformando a lista em set para retirar valores repetidos
    final unicos = nums.toSet();

    //imprimindo a lista atualizada
    print("Lista Atualizada: ${unicos.join(" ; ")}");
  }