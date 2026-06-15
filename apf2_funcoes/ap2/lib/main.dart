import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main()
  {
    runApp(MyApp());
  }

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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.grey
              ),

              _buildQuadrado(top: 10, left: 10, cor: Colors.red),

              _buildQuadrado(top: 17.5, left: 17.5, cor: Colors.green),

              _buildQuadrado(top: 25, left: 25, cor: Colors.blue),
            ],
          ),

          SizedBox(
            width: 16,
          ),

          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.black
              ),

              _buildQuadrado(top: 10, left: 10, cor: Colors.cyan),

              _buildQuadrado(top: 17.5, left: 17.5, cor: Colors.purple),

              _buildQuadrado(top: 25, left: 25, cor: Colors.yellow),
            ],
          ),

          SizedBox(
            width: 16,
          ),

          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
              ),

              _buildQuadrado(top: 10, left: 10, cor: Colors.red),

              _buildQuadrado(top: 17.5, left: 17.5, cor: Colors.blue),

              _buildQuadrado(top: 25, left: 25, cor: Colors.yellow),
            ],
          ),

          SizedBox(
            width: 16,
          ),

          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.white
              ),

              _buildQuadrado(top: 10, left: 10, cor: Colors.deepPurple),

              _buildQuadrado(top: 17.5, left: 17.5, cor: Colors.deepOrange),

              _buildQuadrado(top: 25, left: 25, cor: Colors.yellow),

              _buildQuadrado(top: 32.5, left: 32.5, cor: Colors.lightGreen),
            ],
          )
        ],
      ),
    );
  }
  
  Widget _buildQuadrado({required double top, required double left, required Color cor}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 50,
        height: 50,
        color: cor,
      ),
    );
  }
}