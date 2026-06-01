void main()
  {
    //Chamando função buscar dados
    buscarDados();
  }

//Função buscar dados
Future<void> buscarDados() async
  {
    //Imprime iniciando busca
    print("Iniciando Busca");

    //Aguarda 4 segundos para concluir a busca
    print("Buscando...");
    await Future.delayed(Duration(seconds: 4));

    //imprime Busca concluída
    print("Busca concluída!");
  }