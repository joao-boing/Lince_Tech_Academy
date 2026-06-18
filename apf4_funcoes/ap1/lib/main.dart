//import de material
import 'package:flutter/material.dart';

//cor padrão do fundo
Color corFundo = Color.fromARGB(255, 23, 1, 32);

//main
void main()
  {
    runApp(MyApp());
  }

//Classe de argumento das cores
class Argumentos
  {
    final String corSelecionada;
    final Color cor;

    Argumentos(this.corSelecionada,this.cor);
  }

//App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: corFundo,
      ),
      //Rotas
      initialRoute: '/',
      routes: {
        '/':(context) => TelaPadrao(),
        TelaCor.routeName: (context) => TelaCor()
      }
    );
  }
}

//Tela padrão
class TelaPadrao extends StatelessWidget {
  //construtor
  const TelaPadrao({super.key});

  //lista de cores
  static final List<Argumentos> lista = [
    Argumentos("Vermelho", Colors.red),
    Argumentos("Azul", Colors.blue),
    Argumentos("Amarelo", Color.fromARGB(255, 219, 197, 0)),
    Argumentos("Verde", Colors.green),
    Argumentos("Preto", Colors.black),
  ];

  //Build
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione uma cor"),
        backgroundColor: Color.fromARGB(255, 10, 0, 22),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int indice) {
            final cor = lista[indice];

            return Container(
              margin: EdgeInsets.all(8),
              child: ListTile(
                tileColor: cor.cor,
                title: 
                  Text("${cor.corSelecionada}", 
                  textAlign: TextAlign.center, 
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                onTap: () {
                  Navigator.of(context).pushNamed(TelaCor.routeName, arguments: cor);
                }
              )
            );
          },
        ),
      )
    );
  }
}

//Tela das cores
class TelaCor extends StatelessWidget {
  //RouteName
  static const routeName = "/CorSelecionada";

  //Construtor
  const TelaCor({super.key});

  @override
  Widget build(BuildContext context) {
    //Argumentos
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;


    return Scaffold(
      backgroundColor: argumentos.cor,
      appBar: AppBar(
      title: Text(argumentos.corSelecionada),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
         Navigator.of(context).pop(); 
          },
        ),
      )
    );
  }
}