import 'dart:math';

//Classe para converter os valores
class Conversor 
  {
    //Temperatura
    static double cParaF(double c) => (c * 9 / 5) + 32;
    static double cParaK(double c) => c + 273.15;

    //Velocidade do Vento
    static double msParaKmh(double ms) => ms * 3.6;
    static double msParaMph(double ms) => ms * 2.23694;

    //Direção do Vento
    static double grausParaRad(double graus) => graus * (pi / 180);

    //Umidade
    static double kgParaGramas(double umidade) => umidade * 1000;
  }