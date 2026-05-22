void main() 
  {
    //Declarando as variáveis
    final pessoas = {
      'Nelson' : '',
      'Jane' : '',
      'Jack' : '16',
      'Rupert' : '37',
      'Andy' : '13',
      'Kim' : '27',
      'Robert' : '31'
    };

    //imprimindo as idades informadas e não informadas
    pessoas.forEach((key, element) {
      var idade = element.isNotEmpty ? element : "Idade não infomada";
      print('$key - $idade');
    });
  }