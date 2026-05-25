import 'dart:math';
//Instanciando o Random
Random random = new Random();
void main()
  {
    //Declarando as variáveis
    final num = 100 + random.nextInt(901);

    //Imprimindo a soma
    print("A soma dos números pares entre 0 e $num é: ${somaAte(num)}");
  }

//Função para somar todos os números pares até um número fornecido
int somaAte(int max)
  {
    int x = 0;
    int soma = 0;

    //loop enquanto x for menor que o número máximo
    while(x <= max)
      {
        //se for par, soma
        if(x.isEven) soma += x;

        x++;
      }
    //retorna a soma
    return soma;
  }