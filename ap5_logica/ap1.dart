void main()
  {
    //Declarando as variáveis
    var impares = oddNumbers(100);

    //Iterando a lista impares para imprimir
    for(int i = 0; i < impares.length; i++)
      {
        print("Impar: ${impares[i]}");
      }
  }

//função para listar os números impares de uma sequência de 0 até um número máximo
List oddNumbers(int max)
  {
    var impares = [];
    var x = 0;
    //Loop que verifica se é impar
    while(x <= max)
      {
        //adiciona o número à lista impares
        if(x.isOdd) impares.add(x);
        x++;
      }
    //retorna a lista
    return impares;
  }