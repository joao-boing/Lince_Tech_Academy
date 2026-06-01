import "dart:math";
void main()
  {
    //Lista de raios
    final raios = {5.0, 8.0, 12.0, 7.3, 18.0, 2.0, 25.0};

    //Percorre raios
    for(double num in raios)
      {
        //Atribui às variaveis chamando as Funções
        double area = calcularArea(num);
        double perimetro = calcularPerimetro(num);
        //Imprime o raio, a área e o perímetro
        print("Raio: $num, área = ${area.toStringAsFixed(2)}, perímetro = ${perimetro.toStringAsFixed(2)}");
      }
  }

//Função calcular Área
double calcularArea(double raio)
  {
    final double area = pi * (raio * raio);
    return area;
  }

//Função calcular Perímetro
double calcularPerimetro(double raio)
  {
    final double perimetro = 2 * pi * raio;
    return perimetro;
  }