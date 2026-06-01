void main()
  {
    //Lista de inteiros
    final numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];

    //loop da lista de numeros
    for(int num in numeros)
      {
        //transforma os números decimais em binário
        String binario = num.toRadixString(2);
        //transforma os números decimais em octal
        String octal = num.toRadixString(8);
        //transforma os números decimais em hexadecimal
        String hexadecimal = num.toRadixString(16);
        
        //imprime tudo
        print("decimal: $num, binário: $binario, octal: $octal, hexadecimal: $hexadecimal");
      }
  }