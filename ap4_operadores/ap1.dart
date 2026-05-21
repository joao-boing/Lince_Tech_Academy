import 'dart:math';
Random random = new Random();

void main()
  {
    //Declarando as variáveis
    var anos = List.generate(10, (_) => 1 + random.nextInt(2027));

    //Percorre a Lista de anos, chama a função isBissexto e imprime se é ou não bissexto
    for(int ano in anos)
      {
        if(isBissexto(ano : ano)) print('O ano ${ano} é Bissexto');
        else print('O ano ${ano} não é Bissexto');
      }
  }

//Função que analisa um ano e diz se é bissexto
bool isBissexto({required int ano})
  {
    if(ano % 4 == 0) return true;
    else return false;
  }