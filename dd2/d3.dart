void main() async
  {
    //Iniciar o objeto biblioteca
    final biblioteca = new Biblioteca();

    //Adiciona 3 músicas à biblioteca
    biblioteca.adicionarMusica(nome: "Praga", artista: "Pumapjl", album: "Naturalidade", tempo: 165);
    biblioteca.adicionarMusica(nome: "Runaway", artista: "Kanye West", album: "My Beautiful Dark Twisted Fantasy", tempo: 340);
    biblioteca.adicionarMusica(nome: "Homecomming", artista: "Kanye West", album: "Graduation", tempo: 205);

    //Exibe as informações da biblioteca
    biblioteca.exibirBiblioteca();

    //Faz a procura das músicas
    await biblioteca.procurarMusica("Billie Jean");
    await biblioteca.procurarMusica("PraGa");
    await biblioteca.procurarAlbum("NaturaLidade");
    await biblioteca.procurarArtista("michael jackson");
    await biblioteca.procurarArtista("KanyE WEsT");
  }

//Classe biblioteca
class Biblioteca 
  {
    //Lista de músicas default da biblioteca
    final musicas = <Musica> [
      Musica("Another one bite the dust", "Queen", "The Game", 215),
      Musica("Chicago", "Michael Jackson", "XSCAP", 245),
      Musica("Intro", "Pumapjl", "Naturalidade", 74)
    ];

    //Método exibirBiblioteca imprime as músicas, total de músicas, e o tempo total de músicas
    void exibirBiblioteca()
      {
        int numMusicas = 0;
        int total = 0;

        print("-----------------MÚSICAS DA BIBLIOTECA-----------------\n\n");

        for(Musica musica in musicas)
          {
            Future.delayed(Duration(seconds: 1));
            musica.informacoes();
            total = total + musica.tempo;
            numMusicas++;
          }

        
        final horas = (total / 3600).toInt();
        final minutos = (total / 60).toInt();
        final segundos = (total % 60).toInt();

        print("Total de Músicas cadastradas na biblioteca: $numMusicas músicas");
        print("Tempo de Música da biblioteca: $horas horas, $minutos minutos, $segundos segundos\n");
      }

    //Método para adicionar músicas à biblioteca
    void adicionarMusica
      ({
        required String nome,
        required String artista,
        required String album,
        required int tempo})
      {
        musicas.add(Musica(nome, artista, album, tempo));
      }

    //Método para procurar Músicas pelo nome
    Future<void> procurarMusica(String musica) async
      {
        bool encontrou = false;

        print("------------Buscando música $musica...------------\n");

        await Future.delayed(Duration(seconds: 2));

        //Percorre a lista de músicas e imprime suas informações
        for(int i = 0; i < musicas.length; i++)
          {
            if(musica.toLowerCase() == musicas[i].nome.toLowerCase())
              {
                musicas[i].informacoes();
                encontrou = true;
              }
          }

        //Se não encontrou, retorna que não encontrou
        encontrou ? null : print("Musica não encontrada!\n");
      }

    //Método para procurar Albuns pelo nome
    Future<void> procurarAlbum(String album) async
      {
        bool encontrou = false;

        print("------------Buscando album $album...------------\n");

        await Future.delayed(Duration(seconds: 2));

        //Percorre a lista de músicas e imprime suas informações
        for(int i = 0; i < musicas.length; i++)
          {
            if(album.toLowerCase() == musicas[i].album.toLowerCase())
              {
                musicas[i].informacoes();
                encontrou = true;
              }
          }

        //Se não encontrou, retorna que não encontrou
        encontrou ? null : print("Album não encontrado!\n");
      }

    //Método para procurar Albuns pelo nome
    Future<void> procurarArtista(String artista) async
      {
        bool encontrou = false;

        print("------------Buscando artista $artista...------------\n\n");

        await Future.delayed(Duration(seconds: 2));

        //Percorre a lista de músicas e imprime suas informações
        for(int i = 0; i < musicas.length; i++)
          {
            if(artista.toLowerCase() == musicas[i].artista.toLowerCase())
              {
                musicas[i].informacoes();
                encontrou = true;
              }
          }
          
        //Se não encontrou, retorna que não encontrou
        encontrou ? null : print("Artista não encontrado!\n");
      }
  }

//Classe Musica
class Musica
  {
    //Atributos
    final String nome;
    final String artista;
    final String album;
    final int tempo;

    //Construtor
    Musica(this.nome, this.artista, this.album, this.tempo);

    //Método converter para minuto
    String converterMinuto(int tempo)
      {
        final int minuto = (tempo / 60).toInt();
        final int segundo = (tempo % 60).toInt();
        return "$minuto minutos e ${segundo} segundos";
      }

    //Método que imprime as informações da música
    void informacoes()
      {
        String tempoConvertido = converterMinuto(tempo);
        print("Música: $nome\nArtista: $artista\nAlbum: $album\nDuração: $tempoConvertido\n");
      }
  } 