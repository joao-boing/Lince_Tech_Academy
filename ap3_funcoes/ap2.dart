import 'dart:math';
Random random = new Random();
void main()

  {
    //Instanciando o random

  
    final resultado1 = A(B);
    final resultado2 = A(C);

    print("Função A(B): $resultado1");
    print("Função A(B): $resultado2");
  }

int A(int Function(int) funcaoParametro)
  {
    int resultado = funcaoParametro(random.nextInt(101));
    return resultado;
  }

int B(int num1)
  {
    int resultado = num1 % 2;
    return resultado;
  }

int C(int num1)
  {
    int resultado = (num1 * 2) + 4;
    return resultado;
  }

