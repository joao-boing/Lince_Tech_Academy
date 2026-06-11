import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: 
            MyWidget(),
        ),
      ),
    );
  }
}


//Objetivo: Enum para situacões do jogo
enum situacaoJogo
  {
    ganhou,
    perdeu,
    neutro
  }

//Classe principal (cérebro)
class MyWidget extends StatefulWidget { 
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  var botaoCorreto = 0;
  var clicks = 0;

  //Situacao do jogo
  situacaoJogo situacao = situacaoJogo.neutro;

  //Objetivo: Contagem de vitórias
  var vitorias = 0;

  //Objetivo: Contagem de derrotas
  var derrotas = 0;


  // Esse método e chamado somente uma vez, ao iniciar o state
  @override
  void initState() {
    super.initState();

    // Escolher um número de 0 a 2 para identificar escolher o botão correto
    botaoCorreto = random.nextInt(3);
  }

  // Tratar a tentativa do usuário
  void tentativa(int opcao) {
    setState(() {
      // Verificar se a opção escolhida esta correta
      if (opcao == botaoCorreto) {
        situacao = situacaoJogo.ganhou;
        vitorias++;
      } else {
        // Se estiver errada, incrementa o contador de clicks
        clicks++;
      }

      // Se a quantidade de clicks for maior ou igual a 2, o usuário perdeu
      if (clicks >= 2 && situacao != situacaoJogo.ganhou) {
        situacao = situacaoJogo.perdeu;
        derrotas++;
      }
    });
  }

  //Objetivo: Método para reiniciar o jogo
  void reiniciar()
    {
      setState(() {
        botaoCorreto = random.nextInt(3);
        clicks = 0;
        situacao = situacaoJogo.neutro;
      });
    }

  @override
  Widget build(BuildContext context) {

    //Objetivo: Switch para determinar a situação do jogo
    switch(situacao)
      {
        case situacaoJogo.ganhou: 
          return TelaGanhou(onReiniciar: reiniciar, vitorias: vitorias);
        
        case situacaoJogo.perdeu:
          return TelaPerdeu(onReiniciar: reiniciar, derrotas: derrotas);

        default: 
          return TelaBotoes(onTentativa: tentativa,);
      }
  }
}

//Objetivo: Widgets separados para cada situação
//Wiget de tela de vitória
class TelaGanhou extends StatelessWidget {
  //Recebe o método reiniciar
  final Function() onReiniciar;
  //recebe as vitorias
  final int vitorias;

  const TelaGanhou({super.key, required this.onReiniciar, required this.vitorias});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text('Você ganhou', style: TextStyle(color: Colors.white, fontSize: 24)),
            //Texto que informa as vitórias
            Text('Vitórias: $vitorias', style: TextStyle(color: Colors.white, fontSize: 20)),
            //botão reinicar
            ElevatedButton(
              child: const Text('Jogar novamente'),
              onPressed: () {
                onReiniciar();
              },
            ),
          ]
      ),
    );
  }
}

//Widget da tela de derrtota
class TelaPerdeu extends StatelessWidget {
  //Recebe o método reiniciar
  final Function() onReiniciar;
  //Recebe as derrotas
  final int derrotas;

  const TelaPerdeu({super.key, required this.onReiniciar, required this.derrotas});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text('Você perdeu', style: TextStyle(color: Colors.white, fontSize: 24)),
            //Texto que informa as derrotas
            Text('Derrotas: $derrotas', style: TextStyle(color: Colors.white, fontSize: 20)),
            //botão reiniciar
            ElevatedButton(
              child: const Text('Jogar novamente'),
              onPressed: () {
                onReiniciar();
              },
            ),
          ]
      ),
    );
  }
}

//Widget com a tela dos botões
class TelaBotoes extends StatelessWidget {
  //Recebe o método tentativa
  final Function(int) onTentativa;

  const TelaBotoes({super.key, required this.onTentativa});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text('A'),
          onPressed: () {
            onTentativa(0);
          },
        ),
        ElevatedButton(
          child: const Text('B'),
          onPressed: () {
            onTentativa(1);
          },
        ),
        ElevatedButton(
          child: const Text('C'),
          onPressed: () {
            onTentativa(2);
          },
        ),
      ],
    );
  }
}
