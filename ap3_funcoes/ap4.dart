import 'dart:math';
//Instanciando o random
Random random = new Random();

void main() 
  {
    //Declarando as variáveis
    var temp = List.generate(15, (_) => 1 + random.nextInt(5001));

    //Percorre os valores de temp para imprimilos
    for(int num in temp)
      {
        //imprime os valores de temp chamando as funções de conversão
        print('Decimal: ${transformDecimal(num)}, Binário: ${transformBinario(num)}, Octal: ${transformOctal(num)}, Hexadecimal: ${transformHexadecimal(num)}');
      }
  }

//Função parar transformar em decimal
String transformDecimal(numero)
  {
    return numero.toString();
  }

//função para transformar em binário
String transformBinario(int numero)
  {
    //Lista para guardar os restos das divisões
    var resto = [];
    //variavel temporaria
    int temp;
    //resultado guarda os elementos de 'resto' ao contrário
    String resultado = '';

    //loop para converter em binário
    do{
        temp = numero % 2; 
        numero = (numero / 2).toInt();
        resto.add(temp);
      } while(numero >= 1);
    
    //loop para atribuir a lista resto em resultado(invertido)
    for(int i = resto.length - 1; i >= 0; i--)
      {
        resultado += (resto[i]).toString();
      }
    return resultado;
  }

//Função para converter em octal
String transformOctal(int numero)
  {
    //Lista para guardar os restos das divisões
    var resto = [];
    //variavel temporaria
    int temp;
    //resultado guarda os elementos de 'resto' ao contrário
    String resultado = '';

    //loop para converter em octal
    do{
        temp = numero % 8; 
        numero = (numero / 8).toInt();
        resto.add(temp);
      } while(numero >= 1);
    
    //loop para atribuir a lista resto em resultado(invertido)
    for(int i = resto.length - 1; i >= 0; i--)
      {
        resultado += (resto[i]).toString();
      }
    return resultado;
  }

String transformHexadecimal(int numero)
  {
    //Lista para guardar os restos das divisões
    var resto = [];
    //variavel temporaria
    int temp;
    //resultado guarda os elementos de 'resto' ao contrário
    String resultado = '';

    //loop para converter em hexaDecimal
    do{
        temp = numero % 16;
        switch(temp)
          {
            case(10) : resto.add('A'); 
            break;
            case(11) : resto.add('B'); 
            break;
            case(12) : resto.add('C'); 
            break;
            case(13) : resto.add('D'); 
            break;
            case(14) : resto.add('E'); 
            break;
            case(15) : resto.add('F'); 
            break;
            default: resto.add(temp);
          }
        numero = (numero / 16).toInt();
      } while(numero >= 1);
    
    //resultado guarda os elementos de 'resto' ao contrário
    for(int i = resto.length - 1; i >= 0; i--)
      {
        resultado += (resto[i]).toString();
      }
    return resultado;
  }