import 'package:flutter/material.dart';
import 'package:ap1/Telas/telaLista.dart';
import 'package:ap1/Telas/telaAdicionar.dart';

//Tela principal
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  //Route Name
  static const routeName = "/";


  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Principal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Botões
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(TelaLista.routeName);
              },
              child: const Text("Ver lista de pessoas",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(TelaAdicionar.routeName);
              },
              child: const Text("Adicionar uma pessoa",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}