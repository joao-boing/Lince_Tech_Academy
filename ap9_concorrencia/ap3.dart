void main() async {
  print('Iniciando lançamento');

  await iniciarContagem(10);

  print('Foguete lançado!');
}

Future<void> iniciarContagem(int cont) async
  {
    while(cont > 0)
      {
        await Future.delayed(Duration(seconds: 1));
        print("$cont...");
        cont--;
      }
  }