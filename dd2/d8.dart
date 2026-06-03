import 'dart:math';

//Instanciando o random
final random = Random();
void main()
  {
    //Objetivo: Lista de figurinhas que completam o album
    final List<Figurinha> figurinhas = [];

    //Objetivo: pacote de figurinhas inicializado com 4 figurinhas aleatórias
    PacoteDeFiguras pacote = gerarNovasFigurinhas(figurinhas);

    //Album de figurinhas
    final album = Album();

    //Loop para preencher a lista de figuinhas
    for(int i = 0; i < 20; i++)
      {
        Figurinha figurinha = Figurinha();
        figurinhas.add(figurinha);
      }

    //Objetivo: Criar um loop para gerar pacotes novos até completar o album
    while(album.completo == false)
      {
        //Gera um pacote com novas figurinhas aleatórias da lista de figurinhas
        pacote = gerarNovasFigurinhas(figurinhas);
        //Chama o método abrir pacote, que ja cola as figurinhas não-repetidas
        album.abrirPacote(pacote);
      }

    //Objetivo: Imprime as figurinhas repetidas no main
    print("\nFigurinhas repetidas: ${album.figurinhasRepetidas.length}\n");

    //Objetivo: Chamar o método de impressão do album
    album.exibirAlbum();
  }

//Função que retorna um pacote de figurinhas
PacoteDeFiguras gerarNovasFigurinhas(List<Figurinha> lista)
  {
    //Retorna um pacote com 4 figurinhas aleatória
    return PacoteDeFiguras
      (
        (lista[random.nextInt(lista.length)]),
        (lista[random.nextInt(lista.length)]),
        (lista[random.nextInt(lista.length)]),
        (lista[random.nextInt(lista.length)])
      );
  }

//Enum com 10 nomes
enum nomes
  {
    Carlos, 
    Roberto,
    Samara,
    Emily,
    Henrique,
    Neusa,
    Paula,
    Paulo,
    Cesar,
    Paola
  }

//Enum com 10 sobrenomes
enum sobreNomes
  {
    Boing,
    Silva,
    Souza,
    Pereira,
    Batista,
    Knebel,
    Fonseca,
    Matos,
    Benvenuti,
    Correa
  }

//Classe que representa uma figurinha
class Figurinha
  {
    //Lista de nomes usados para verificar se o nome já foi usado em outra figurinha
    static final Set<String> nomesUsados = {};

    //Total de figurinhas para implementar no código da figurinha
    static int totalFigurinhas = 0;

    //Nome da figurinha
    final String nome;

    //Código da figurinha
    final int codigo;

    //Construtor
    Figurinha() 
    //Objetivo: Código único, gerado através do total de figurinhas existentes
    : codigo = ++totalFigurinhas,
    //nome chamando a função gerarNome
    nome = gerarNome();

    //Objetivo: Gerar nomes únicos
    static String gerarNome()
      {
        String nome;

        //Gera um nome enquanto o nome não existir na lista de nomes usados
        do 
          {
            nome = ('${nomes.values[random.nextInt(nomes.values.length)].name}' +
             ' ${sobreNomes.values[random.nextInt(sobreNomes.values.length)].name}');

          } while (nomesUsados.contains(nome));
        
        nomesUsados.add(nome);

        return nome;
      }

    //Subscreve o método toString para saída formatada
    @override
    String toString()
      {
        return "Nome: $nome - Código: $codigo";
      }
  }

//Objetivo: Classe que representa uma pacote que contém 4 figurinhas
class PacoteDeFiguras
  {
    Figurinha figurinha1;
    Figurinha figurinha2;
    Figurinha figurinha3;
    Figurinha figurinha4;

    PacoteDeFiguras
      (
        this.figurinha1,
        this.figurinha2,
        this.figurinha3,
        this.figurinha4,
      );
  }

//Classe que representa um album de figurinhas
class Album
  {
    //Set de figurinhas coladas para não permitir repetição
    Set<Figurinha> figurinhasColadas = {};
    //Objetivo: Lista de figurinhas repetidas
    List<Figurinha> figurinhasRepetidas = [];

    //Objetivo: o album é considerado completo se ele tem todas as figurinhas existentes coladas
    bool completo = false;

    //Método para abrir pacote, já cola as figurinhas
    void abrirPacote(PacoteDeFiguras pacote)
      {
        colarFigurinha(pacote.figurinha1);
        colarFigurinha(pacote.figurinha2);
        colarFigurinha(pacote.figurinha3);
        colarFigurinha(pacote.figurinha4);
      }

    //Método colar figurinhas
    void colarFigurinha(Figurinha figurinha)
      {
        //Objetivo: O album não pode ter figurinhas repetidas
        //Verifica se a figurinha foi colada no album e cola, ou adiciona às figurinhas repetidas
        if(figurinhasColadas.contains(figurinha)) figurinhasRepetidas.add(figurinha);
        else figurinhasColadas.add(figurinha);

        //Se as figurinhas coladas forém iguais a 20(total do album) ele é completo
        if(figurinhasColadas.length == 20) completo = true;
      }
    
    //Objetivo: Imprimir as figurinhas coladas
    void exibirAlbum()
      {
        String status = completo ? "Completo" : "Incompleto";

        print("--------------Figurinhas coladas--------------\n");

        for (int codigo = 1; codigo <= 20; codigo++)
          {
            for (Figurinha figurinha in figurinhasColadas)
              {
                if (figurinha.codigo == codigo)
                {
                  print(figurinha);
                }
              }
          }

        print("\nO album está $status\n");
      }

  }