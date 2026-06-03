import 'dart:math';
void main()
  {
    //Instanciando a lista de compras
    final listaDeCompras = ListaDeCompras();

    //Adicionando itens à lista
    listaDeCompras.adicionarItem("salgadinho", 1, "comprado");
    listaDeCompras.adicionarItem("leite", 5, "pendente");
    listaDeCompras.adicionarItem("bolacha", 2, "pendente");
    listaDeCompras.adicionarItem("laranja", 5, "pendente");
    listaDeCompras.adicionarItem("margarina", 3, "pendente");
    listaDeCompras.adicionarItem("sal", 7, "pendente");

    //Imprime as informações da lista
    listaDeCompras.mostrarLista();
  }

//Classe que representa um item
class Item
  {
    //Nome, quantidade e status
    String nome;
    int quantidade;
    String status;

    //Construtor
    Item(this.nome, this.quantidade, this.status);
  }

//Classe que representa uma lista de mercado
class ListaDeCompras
  {
    //Instanciando o random
    final random = Random();

    //Lista de itens desejados
    final pendente = <Item> [];

    //Lista de itens comprados
    final comprado =<Item> [];

    //Lista de itens sem estoque
    final semEstoque = <Item> [];

    //Lista completa com todos os itens
    final lista = <Item>  
      [
        Item("Maçã", 2, "Pendente"),
        Item("Arroz", 1, "Comprado"),
        Item("Feijão", 3, "Sem estoque")
      ];

    //Método mostrar lista
    void mostrarLista()
      {
        separarItens(lista);

        print("------------Itens pendentes------------");
        mostrarItens(pendente);
        print("------------Itens Comprados------------");
        mostrarItens(comprado);
        print("------------Itens Sem estoque------------"); 
        mostrarItens(semEstoque);

        print("Progresso: ${comprado.length}/${lista.length}");

        sortearPendente();
      }

    //Método para adicionar itens à lista
    void adicionarItem(String nome, int quantidade, String status)
      {
        Item item = Item(nome, quantidade, status);
        lista.add(item);
      }

    //Método para separar os itens comprados, pendentes e sem estoque
    void separarItens(List<Item> lista)
      {
        pendente.clear();
        comprado.clear();
        semEstoque.clear();
        for(int i = 0; i < lista.length; i++)
          {
            if(lista[i].status.toLowerCase() == "pendente")
              {
                pendente.add(lista[i]);
              }
            else if(lista[i].status.toLowerCase() == "comprado")
              {
                comprado.add(lista[i]);
              }
            else if(lista[i].status.toLowerCase() == "sem estoque")
              {
                semEstoque.add(lista[i]);
              }
          }
      }

    //Método para mostrar itens de uma lista
    void mostrarItens(List<Item> lista)
      {
        for(Item item in lista)
          {
            print("Item: ${item.nome} - ${item.quantidade} - ${item.status}");
          }
        print("\n");
      }

    //Método para sortear um item pendente
    void sortearPendente()
      {
        if(pendente.isEmpty)
          {
            print("Não existe itens pendentes");
            return;
          }
        print("Item pendente sorteado: ${pendente[random.nextInt(pendente.length)].nome}");
      }
  }