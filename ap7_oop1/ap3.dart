void main()
  {
    //Declarando a lista de Produtos
    final produtos = <Produto>[];

    //Declarando as listas de nomes e preços
    final nomes = ["Bola", "Televisão", "Mouse", "Monitor", "VideoGame"];
    final precos = [10.0, 2000.0, 120.49, 550.99, 3500.0];

    //Loop para instanciar a lista de produtos
    for(int i = 0; i < nomes.length; i++)
      {
        final produto = Produto();
        produto.nome = nomes[i];
        produto.preco = precos[i];

        produtos.add(produto);

        //Declara o precoFinal chamando o método desconto
        final precoFinal = produtos[i].desconto(10);

        //Imprime o produto com o desconto
        print("Novo preço do produto ${produtos[i].nome} (com desconto) ${precoFinal}");
      }
  }

//Classe que representa um produto
class Produto
  {
    //Declarando as variáveis
    late String nome;
    late double preco;

    //Método Desconto
    double desconto(int desconto)
      {
        return preco -= (preco * desconto) / 100;
      }
  }