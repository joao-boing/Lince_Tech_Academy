import "dart:math";
//Instanciando o Random
Random random = new Random();
void main()
  {
    //Declarando o objeto pessoa
    final pessoa = Pessoa();

    //Declarando os atributos
    pessoa.nome = "João";
    pessoa.altura = 1.0 + (random.nextDouble() * 1.3);
    pessoa.idade = 1 + random.nextInt(99);

    //Imprimindo os atributos
    print("Nome: ${pessoa.nome}");
    print("Idade: ${pessoa.idade}");
    print("Altura: ${pessoa.altura}");
  }

//Classe que representa uma pessoa
class Pessoa
  {
    //Declarando os atributos
    late String _nome;
    late int _idade;
    late double _altura;

    //Setters e getters de idade
    void setIdade(int idade)
      {
        this._idade = idade;
      }

    int get idade => _idade;

    set idade(int idade)
      {
        if(idade >= 0) _idade = idade;
        else print("A idade deve ser um valor maior ou igual a zero.");
      }

    //Setters e getters de nome
    String get nome => _nome;

    set nome(String nome)
      {
        _nome = nome;
      }

    //Setters e getters de altura
    double get altura => _altura;

    set altura(double altura)
      {
        _altura = altura;
      }
  }