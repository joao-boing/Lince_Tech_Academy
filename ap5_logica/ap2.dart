import 'dart:math';
//Instanciando o Random
Random random = new Random();
void main()
  {
    //Declarando as variáveis
    final nums = List.generate(5, (_) => 1 + random.nextInt(26));

    //Percorre a lista nums
    for(int num in nums)
      {
        //imprime o número e a letra equivalente
        print("número $num -> Letra ${letraAlfabeto(num)}");
      }
  }

//Método para relacionar um número com a letra correspondente do alfabeto
String letraAlfabeto(int num)
  {
    //Declarando as variáveis
    final letra;
    final Letras = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",];
    
    //Verifica se o número está dentro do alfabeto
    if(num >= 1 && num <= 26)
      {
        //retorna a letra correspondente
        return letra = Letras[num - 1];
      }
    else 
      {
        //retorna uma string
        return "Número não correspondente à uma letra do alfabeto";
      }
  }