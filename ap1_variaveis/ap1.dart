void main() 
  {
      //Declaração das variáveis
      String nome = 'João';
      String sobrenome = 'Boing';
      int idade = 18;
      bool ativo = true;
      double peso = 78.5;
      String nacionalidade = 'Brasileiro';

      //Imprime o Nome Completo
      print("Nome completo: $nome $sobrenome");

      //Verifica se a pessoa é maior/menor de idade e imprime
      if(idade < 18) 
        {
            print("Idade: $idade (menor de idade)");
        }
      else if (idade >= 18) 
        {
            print("Idade : $idade (maior de idade)");
        }
      
      //Verifica se está ativo/inativo e imprime
      if(ativo)
        {
          print("Situação: Ativo");
        } 
      else 
        {
          print("Situação: Inativo");
        }
      
      //Imprime o peso
      print("Peso: $peso");

      //Verifica se nacionalidade está informada ou vazia e imprime
      if(nacionalidade.isEmpty)
        {
          print("Nacionalidade: Não informada");
        }
      else
        {
          print("Nacionaliade: $nacionalidade");
        }
  }