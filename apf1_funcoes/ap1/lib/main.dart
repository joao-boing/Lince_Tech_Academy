//Import de dart math e material
import 'dart:math';
import 'package:flutter/material.dart';

//Main
void main() {
  //Rodando o app
  runApp(const MyApp());
}

//Classe do App Stateless
class MyApp extends StatelessWidget {
  //Construtor
  const MyApp({super.key});

  //Build
  @override
  Widget build(BuildContext context) {

    //Página de Cores
    const paginaDeCores = PaginaDeCores();

    //Retorna uma materialApp
    return const MaterialApp(
      //o home é a página de mudança de cores
      home: paginaDeCores,
    );
  }
}

//Pagina de cores StateFul
class PaginaDeCores extends StatefulWidget {
  //Construtor
  const PaginaDeCores({super.key});

  //State da pagina
  @override
  State<PaginaDeCores> createState() => PaginaDeCoresState();
}

//classe state
class PaginaDeCoresState extends State<PaginaDeCores> {
  //Cor padrão
  Color _corDoTexto = Colors.black;

  //Método sortear cor
  void _sortearCor() {
    final random = Random();
    
    setState(() {
      _corDoTexto = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  //Build
  @override
  Widget build(BuildContext context) {

    //Scaffold, usando center e column para alinhar no centro da tela
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteador de Cores'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //Children com texto e botão
          children: [
            //Botão recebe _corDoTexto
            Text(
              'Mude a minha cor!',
              style: TextStyle(
                fontSize: 35,
                color: _corDoTexto,
              ),
            ),

            //Botão
            FloatingActionButton
            (
              onPressed: _sortearCor,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}