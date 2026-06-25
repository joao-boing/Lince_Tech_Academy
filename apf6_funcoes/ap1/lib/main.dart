//Imports
import 'package:ap1/Telas/telaEditar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/estado_lista_pessoas.dart';
import 'Telas/telaPrincipal.dart';
import 'Telas/telaLista.dart';
import 'Telas/telaAdicionar.dart';

//Cor padrão
const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

//Main
void main() {
  runApp(
    //Provider
    ChangeNotifierProvider(
      create: (context) => EstadoListaDePessoas(),
      child: MyApp(),
    ),
  );
}

//Classe myApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      //Tirando o debug
      debugShowCheckedModeBanner: false,
      //rotas
      initialRoute: '/',
      routes: {
        '/': (context) => TelaPrincipal(),
        TelaLista.routeName: (context) => TelaLista(),
        TelaAdicionar.routeName: (context) => TelaAdicionar(),
        TelaEditar.routeName: (context) => TelaEditar(),
      },
    );
  }
}