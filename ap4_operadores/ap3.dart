void main()
  {
    //Declarando  as variáveis
    final lista = ["Cachorro", "2", "gato"];

    //chamando a função removeFromList()
    removeFromList(lista, "2");

    //imprimindo cada elemento da lista
    for(var element in lista)
      {
        print("Item: $element");
      }
  }

//lista para remover elemento de uma lista
List removeFromList (List<String>? Lista, String? element)
  {
    Lista?.remove(element);

    return Lista ?? [];
  }