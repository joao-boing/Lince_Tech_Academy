void main()
  {
    converterParaInteiro("5");

    converterParaInteiro("abf");
  }

void converterParaInteiro(String valor)
  {
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