//import de material

import 'package:flutter/material.dart';

//Cor principal de fundo
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
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    //Container que vai conter o layout
    return Container(

      //Margem
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red
              ),

              SizedBox(
                width: 16,
                height: 16,
              ),

              Container(
                width: 50,
                height: 50,
                color: Colors.green
              ),

              SizedBox(
                width: 16,
                height: 16,
              ),

              Container(
                width: 50,
                height: 50,
                color: Colors.blue
              ),
            ],
          ),

          SizedBox(
            height: 8,
            width: 8,
          ),

          Stack(
            children: [
              Container(
                width: 196,
                height: 124,
                color: Colors.yellow
              ),

              Positioned(
                top: 8,
                bottom: 8,
                left: 8,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.purple
                    ),

                     SizedBox(
                      width: 16,
                    ),

                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.cyan
                    ),

                    SizedBox(
                      width: 16
                    ),

                    Positioned(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.purple
                          ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.cyan
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),      
            ]
          ),

          SizedBox(
            width: 8,
            height: 8,
          ),

          Stack(
            children: [
              Container(
                width: 100,
                height: 66,
                color: Colors.grey
              ),

              Positioned(
                top: 8,
                bottom: 8,
                left: 25,
                right: 25,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.black
                )
              )
            ],
          )

        ],
      )
    );
  }
}