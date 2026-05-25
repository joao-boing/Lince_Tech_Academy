void main()
  {
    //Lança uma exceção se o número for Ímpar
    try
      {
        isInteiro(7);
        print("Entrada correta, você inseriu um número par.");
      }
    on Exception catch (e)
      {
        print(e);
      }
  }

//Função para verificar se o número é inteiro
void isInteiro(int num)
  {
        if(num.isOdd) throw Exception("Entrada inválida. Insira apenas números pares.");
  }