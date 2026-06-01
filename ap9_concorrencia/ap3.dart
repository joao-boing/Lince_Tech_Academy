void main() async {
  print('Iniciando lançamento');

  //Chama a função iniciar contagem(Só continua quando ela acabar)
  await iniciarContagem(10);

  print('Foguete lançado!');
}

//Função iniciarContagem
Future<void> iniciarContagem(int cont) async
  {
    //Loop para contagem
    while(cont > 0)
      {
        //Espera 1 segundo para imprimir
        await Future.delayed(Duration(seconds: 1));
        print("$cont...");
        cont--;
      }
    //Espera 1 segundo para acabar
    await Future.delayed(Duration(seconds: 1));
  }