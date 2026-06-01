void main()
  {
    //Declarando as variáveis
    String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";
    
    //Imprimindo chamando as funções
    print(paragrafo);
    print("tamanho = ${calcularTamanho(paragrafo)}");
    print("Número de frases: ${calcularFrases(paragrafo)}");
    print("Número de palavras: ${calcularPalavras(paragrafo)}");
    print("Total de vogais: ${calcularVogais(paragrafo)}");
    print("Total de consoantes: ${calcularConsoantes(paragrafo)}");

  }

//Função calcular palavras
int calcularPalavras(String paragrafo)
  {
    String paragrafoFormatado = paragrafo.replaceAll(',', '');
    paragrafoFormatado = paragrafoFormatado.replaceAll('.', '');

    List<String> palavras = paragrafoFormatado.split(" ");

    return palavras.length;
  }

//Função calcular tamanho
int calcularTamanho(String paragrafo)
  {
    var tamanho = paragrafo.split('');
    return tamanho.length;
  }

//Função calcular Frases
int calcularFrases(String paragrafo)
  {
    List<String> frases = paragrafo.split(".");
    for(int i = 0; i < frases.length; i++)
      {
        if(frases[i].isEmpty) frases.remove(frases[i]);
      }
    return frases.length;
  }

//Função calcular vogais
int calcularVogais(String paragrafo)
{
  String paragrafoFormatado = paragrafo.replaceAll(',', '');
  paragrafoFormatado = paragrafoFormatado.replaceAll('.', '');
  paragrafoFormatado = paragrafoFormatado.replaceAll(' ', '');

  List<String> letras = paragrafoFormatado.split("");

  int vogais = 0;

    for(int i = 0; i < letras.length; i++)
      {
        switch(letras[i])
          {
            case 'A' || 'a': vogais++;
              break;
            
            case 'E' || 'e': vogais++;
              break;
            
            case 'I' || 'i': vogais++;
              break;

            case 'O' || 'o': vogais++;
              break;

            case 'U' || 'u': vogais++;
              break;

            default:
              break;
          }
      }
    return vogais;
}

//Função calcular consoantes
int calcularConsoantes(String paragrafo)
{
  String paragrafoFormatado = paragrafo.replaceAll(',', '');
  paragrafoFormatado = paragrafoFormatado.replaceAll('.', '');
  paragrafoFormatado = paragrafoFormatado.replaceAll(' ', '');

  List<String> letras = paragrafoFormatado.split("");

  int consoantes = 0;

    for(int i = 0; i < letras.length; i++)
      {
        switch(letras[i])
          {
            case 'A' || 'a':
              break;
            
            case 'E' || 'e':
              break;
            
            case 'I' || 'i':
              break;

            case 'O' || 'o':
              break;

            case 'U' || 'u':
              break;

            default: consoantes++;
              break;
          }
      }
    return consoantes;
}