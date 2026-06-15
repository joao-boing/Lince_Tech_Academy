//Import de material e math
import 'package:flutter/material.dart';
import 'dart:math';

//Instanciando o random
final random = Random();

//Cor principal do Projeto
const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

//Main
void main()
  {
    runApp(MyApp());
  }

//Aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
        theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: MyWidget()
          )
        )
      );
  }
}

//Tela principal
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

//State da tela principal
class _MyWidgetState extends State<MyWidget> {

  //Cor a ser trocada
  Color cor = Color.fromARGB(255, 255, 0, 0);

  //Texto da forma a ser trocada
  String TextoForma = "Círculo";

  //Forma
  Widget forma = Container(width: 50, height: 50, color: Color.fromARGB(255, 255, 0, 0));

  //Verifica se é um quadrado ou não
  bool quadrado = true;

  //Método para mudar o estado da forma
  void mudarEstado()
    {
      if(quadrado)
        {
          //Muda o estado e o texto
          setState(() {
            forma = _buildCirculo(cor: cor);
            TextoForma = "Quadrado";
          });
          quadrado = false;
        }
      else
        {
          //Muda o estado e o texto
          setState(() {
            forma = _buildQuadrado(cor: cor);
            TextoForma = "Círculo";
          });
          quadrado = true;
        }
    }


  //Método para mudar a cor
  void mudarCor()
    {
      //altera a cor com random
      cor = Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256)); 

      if(quadrado)
        {
          //Muda a cor da forma
          setState(() {
            forma = _buildQuadrado(cor: cor);
          });
        }
      else
        {
          //muda a cor da forma
          setState(() {
            forma = _buildCirculo(cor: cor);
          });
        }
    }

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //Botão para mudar o estado, recebe o textoForma
              ElevatedButton(
                //Chama o método mudarEstado
                onPressed: mudarEstado,
                child: Text("Mudar para $TextoForma")
              ),
              
              SizedBox(width: 16),

              //Botão para mudar a cor
              ElevatedButton(
                //Chama o método mudarCor
                onPressed: mudarCor,
                child: const Text("Mudar Cor")
              )
            ],
          ),
          
          SizedBox(height: 16),
          
          forma
        ],
      )
    );
  }

  //Método para construir um quadrado
  Widget _buildQuadrado({required Color cor}) {
    return Container(
        width: 50,
        height: 50,
        color: cor,
      );
  }

  //Método para construir um círculo
  Widget _buildCirculo({required Color cor}) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cor
        ), 
    );
  }
}