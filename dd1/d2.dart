void main()
  {
    //Lista de temperaturas
    final temps = {0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0};

    //Percorre temperaturas
    for(double temp in temps)
      {
        //Chamando as funções
        final double fahrenheit = converterFahrenheit(temp);
        final double Kelvin = converterKelvin(temp);
        //Imprime Celsius, fahrenheit e kelvin
        print("Celsius: $temp, fahrenheit: ${fahrenheit.toStringAsFixed(2)}, kelvin: ${Kelvin.toStringAsFixed(2)}");
      }
  }

//Função para converter celsius em fahrenheit
double converterFahrenheit(double temp)
  {
    final double fahrenheit = (temp * 1.8) + 32;
    return fahrenheit;
  }

//Função para converter celsius em kelvin
double converterKelvin(double temp)
  {
    final double Kelvin = temp + 273.15;
    return Kelvin;
  }