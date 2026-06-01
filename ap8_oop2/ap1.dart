import 'dart:math';

//Instanciando o random
Random random = new Random();

//Enum de gêneros musicais
enum GenerosMusicais
  {
    samba,
    rock,
    funk,
    hipHop,
    rap,
    trap,
    boombap,
    eletronica,
    jazz,
    pagode,

  }
void main()
  {
    //Variável de opção para escolha aleatória do gênero
    final int opcao = random.nextInt(GenerosMusicais.values.length);

    //Variável do gênero musical escolhido
    final generoMusical = GenerosMusicais.values[opcao];
    
    //Imprime o com base no genêro escolhido
    switch(generoMusical)
      {
        case GenerosMusicais.samba:
          print('Meu gênero musical preferido é o samba');
          break;
        
        case GenerosMusicais.rock:
          print('Meu gênero musical preferido é o rock');
          break;
        
        case GenerosMusicais.funk:
          print('Meu gênero musical preferido é o funk');
          break;
        
        case GenerosMusicais.hipHop:
          print('Meu gênero musical preferido é o hipHop');
          break;
        
        case GenerosMusicais.rap:
          print('Meu gênero musical preferido é o rap');
          break;
        
        case GenerosMusicais.trap:
          print('Meu gênero musical preferido é o trap');
          break;
        
        case GenerosMusicais.boombap:
          print('Meu gênero musical preferido é o boombap');
          break;
        
        case GenerosMusicais.eletronica:
          print('Meu gênero musical preferido é o eletronica');
          break;
        
        case GenerosMusicais.jazz:
          print('Meu gênero musical preferido é o jazz');
          break;
        
        case GenerosMusicais.pagode:
          print('Meu gênero musical preferido é o pagode');
          break;
      }
  }