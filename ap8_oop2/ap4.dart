import 'dart:math';
//Instanciando o random
final Random random = new Random();

//Classe abstrata que representa uma calculadora
abstract class calculadora
  {
    //Método dobro
    static int dobro(int num)
      {
        return num * 2;
      }
  }

void main()
  {
    //Instancia o objeto num
    final int num = random.nextInt(2000);

    //imprime o número e o seu dobro chamando o método
    print("O dobro do número $num é: ${calculadora.dobro(num)}");
  }