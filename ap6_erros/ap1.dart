void main()
  {
    //Instanciando a função
    converterParaInteiro("5");

    converterParaInteiro("abf");
  }

//Função para converter String em Inteiro
void converterParaInteiro(String valor)
  {
    //Lança uma exceção se o numero digitado não for inteiro
    try
      {
        int num = int.parse(valor);
        print("Número digitado: $num");
      }
    catch (e) 
      {
        print('Entrada invalida. Digite apenas números inteiros.');
      }
  }