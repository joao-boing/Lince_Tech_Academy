Future<void> main() async {
  //Lista de urls
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  //chamando função baixar imagens
  await baixarImagens(urls);
}

//Função baixa imagens
Future<void> baixarImagens(List<String> urls) async
  {
    //Imprime baixando imagens
    print("Baixando imagens...");

    //Percorre a lista urls, e baixa as imagens
    for(int i = 0; i < urls.length; i++)  
      {
        await Future.delayed(Duration(seconds: 2));
        print("Imagem ${urls[i]} baixada com sucesso");
      }

    //Quando acabar informa que as imagens foram baixadas com sucesso
    print("Download concluído!");
  }