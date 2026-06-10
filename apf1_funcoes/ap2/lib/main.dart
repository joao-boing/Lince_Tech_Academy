//Import de dart math e material
import 'dart:math';
import 'package:flutter/material.dart';

//Iniciando o random
var random = Random();

//Main
void main() 
  {
    //Rodando o app
    runApp(const MyApp());
  }

//Classe do App Stateless
class MyApp extends StatelessWidget 
  {
    //Construtor
    const MyApp({super.key});

    //Build
    @override
    Widget build(BuildContext context) 
      {

        //Página de botões
        const paginaDeBotoes = PaginaDeBotoes();

        //Retorna uma materialApp
        return const MaterialApp(
          //o home é a página de escolha de botões
          home: paginaDeBotoes,
        );
      }
  }

//Pagina de botões StateFul
class PaginaDeBotoes extends StatefulWidget 
  {
    //Construtor
    const PaginaDeBotoes({super.key});

    //State da pagina
    @override
    State<PaginaDeBotoes> createState() => PaginaDeBotoesState();
  }

//classe state
class PaginaDeBotoesState extends State<PaginaDeBotoes> 
  {

    //Contador
    int contador = 0;

    //Número aleatório para os 3 botões
    int aleatorio = 1 + random.nextInt(3);

    //Texto
    String texto = "Você tem duas chances";

    //Ganhou
    bool ganhou = false;

    //Cor do fundo da página
    var corFundo = Colors.black;

    //Método que verifica a escolha do botão
    void _verificarEscolha(int n)
      {
        //Se o jogador ganhou ou o já tentou 2 vezes
        if(ganhou || contador == 2) return;

        //Verifica se o jogador acertou o botão
        else if(aleatorio == n)
          {
            setState(() {
              //Cor do fundo fica verde
              corFundo = Colors.green;
              texto = "Você Ganhou!";
              ganhou = true;
            });
          }
        //Se o jogador errou
        else
          {
            setState(() {
              //Cor do fundo fica vermelho
              corFundo = Colors.red;
              contador++;
              texto = "Você tem mais uma chance";
              if(contador == 2)
                {
                  texto = "Você perdeu!";
                }
            });
          }
      }
    //Método reiniciar o jogo
    void _reiniciar() 
    {
      setState(() 
      {
        contador = 0;
        aleatorio = 1 + random.nextInt(3);
        texto = "Você tem duas chances";
        ganhou = false;
        corFundo = Colors.black;
      });
    }

    //Build
    @override
    Widget build(BuildContext context) 
      {

        //Scaffold, usando center, column e row para alinhar no centro da tela
        return Scaffold
          (
            //Cor do fundo
            backgroundColor: corFundo,
            appBar: AppBar
              (
                title: const Text('Sorteador de Cores', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                backgroundColor: Color.fromARGB(124, 107, 91, 197),
              ),
            body: Center
              (
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,

                    //Coluna com o texto
                    children: 
                      [

                        Text(texto, style: 
                        TextStyle(fontSize: 30, color: Colors.white), 
                        textAlign: TextAlign.center),

                        const SizedBox(height: 50),

                        //Linha com os três botões
                        Row
                          ( 
                            mainAxisAlignment: MainAxisAlignment.center,

                            //Children
                            children: 
                              [
                                //Botão inicia o _verificarEscolha com seu respectivo número
                                ElevatedButton
                                (
                                  onPressed: () => _verificarEscolha(1),
                                  style: ElevatedButton.styleFrom
                                    (
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                  child: const Text
                                  (
                                    'A',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),

                                const SizedBox(width: 50),

                                ElevatedButton
                                (
                                  onPressed: () => _verificarEscolha(2),
                                  style: ElevatedButton.styleFrom
                                    (
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                  child: const Text
                                  (
                                    'B',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),

                                const SizedBox(width: 50),

                                ElevatedButton
                                (
                                  onPressed: () => _verificarEscolha(3),
                                  style: ElevatedButton.styleFrom
                                    (
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                  child: const Text
                                  (
                                    'C',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ]
                          ),

                        //Se o jogador ganhou ou perdeu
                        if (ganhou || contador == 2) ...
                          [
                            //Insere um botão de jogar novamente
                            const SizedBox(height: 40),
                            TextButton.icon
                              (
                                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),

                                //Reinicia o jogo
                                
                                onPressed: _reiniciar,
                                label: const Text('Jogar Novamente', style: TextStyle(color: Colors.white, fontSize: 18)),
                              ),
                          ],

                      ],
                  ),
              ),
          );
      }
  }