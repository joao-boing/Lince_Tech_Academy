import 'dart:math';
//Instanciando o random
var random = Random();
void main()
  {
    //Lista de nomes
    var nomes = ["Ana", "Francisco", "Joao", "Pedro", "Gabriel", "Rafaela", "Marcio", "Jose", 'Carlos', 'Patricia', 'Helena', 'Camila', 'Mateus', 'Gabriel', 'Maria', 'Samuel', 'Karina', 'Antonio', 'Daniel', 'Joel', 'Cristiana', 'Sebastião', 'Paula'];
    //lista de sobrenomes
    var sobrenomes = ['Silva', 'Ferreira', 'Almeida', 'Azevedo', 'Braga', 'Barros', 'Campos', 'Cardoso', 'Teixeira', 'Costa', 'Santos', 'Rodrigues', 'Souza', 'Alves', 'Pereira', 'Lima', 'Gomes', 'Ribeiro', 'Carvalho', 'Lopes', 'Barbosa'];

    //Declarando nome completo usando o random
    var nomecompleto = "nome: ${nomes[random.nextInt(nomes.length)]} ${sobrenomes[random.nextInt(sobrenomes.length)]}";

    //imprimindo nome completo
    print(nomecompleto);
  }