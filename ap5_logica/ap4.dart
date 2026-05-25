void main() {
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  final nome = 'Ana';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

//Função que soma a quantidade de vezes que um nome aparece em uma lista
int contarNome(List lista, String nome)
  {
    int quantidade = 0;
    //Percorre a lista
    for(String element in lista)
      {
        //Se o nome existir na lista, adiciona à quantidade
        if(element == nome) quantidade++;
      }
    //retorna a quantidade
    return quantidade;
  }
