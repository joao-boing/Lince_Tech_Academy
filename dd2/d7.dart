import 'dart:collection';
import 'dart:math';


void main()
  { 
    //Instanciando a fila
    final fila = Fila();

    print("\n-----------Adicionando pessoas na fila-----------");

    //Adicionando 10 pessoas com nomes aleatórios
    for(int i = 0; i < 10; i++)
      {
        final pessoa = Pessoa(GeradorNome().gerarNomeAleatorio());
        //Chamando o método entrar na fila
        fila.entrarNaFila(pessoa);
      }

    print("\n-----------Atendendo pessoas na fila-----------\n");

    //Atendendo as pessoas chamando o método
    while(fila.fila.isNotEmpty)
      {
        fila.atenderPessoa();
      }


  }

//Enum com nomes
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

//Enum com sobrenomes
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

//Classe que representa uma pessoa
class Pessoa
  {
    String nome;

    Pessoa(this.nome);
  }

//Classe que gera nomes aleatórios com base nos enums
class GeradorNome
  {
    //Instanciando o random
    final random = Random();

    //Método que gera nomes aleatóriamente
    String gerarNomeAleatorio()
      {
        //Gera um nome aleatório de nomes
        String nome = (nomes.values[random.nextInt(nomes.values.length)].name.toString());

        //Gera um sobrenome aleatório de sobrenomes
        String sobrenome = (sobreNomes.values[random.nextInt(sobreNomes.values.length)].name.toString());
        
        //Retorna o nome completo
        String nomeCompleto = '$nome $sobrenome';
        return nomeCompleto;
      }
  }

//Classe que representa uma fila
class Fila 
  {
    //Instancia uma Queue
    final fila = Queue<Pessoa>();

    //Método para entrar na fila
    void entrarNaFila(Pessoa pessoa)
      {
        //adiciona a pessoa como primeiro da fila
        fila.addFirst(pessoa);
        print("*${pessoa.nome} entrou na fila");
      }

    //Método para atender pessoa da fila
    void atenderPessoa()
      {
        print("*${fila.last.nome} foi atendido(a)");

        //Remove a primeira pessoa da fila (ordem de chegada)
        fila.removeLast();
      }
  }