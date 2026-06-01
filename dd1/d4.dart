void main()
  {
    //Declarando a data
    int dia, mes, ano;
    dia = 5;
    mes = 9;
    ano = 2022;

    //Imprime data atual
    print("Data atual: $dia/$mes/$ano");

    //Calcula os finais de semana
    int final_de_semana = 18 ~/ 5;

    //Adiciona ao dia pulando os finais de semana
    dia = dia + 18 + (final_de_semana * 2);

    //Calculadora de mes
    if(dia > 30) 
      {
        mes = mes + (dia ~/ 30).toInt();
        dia = dia % 30;
        if(dia == 0) dia = 1;
      }
    
    //Calculadora de ano
    if(mes > 12)
      {
        ano = ano + (mes ~/ 12).toInt();
        mes = mes % 12;
        if(mes == 0) mes == 1;
      }

    //Imprime a data atual
    print("Data calculada: $dia/$mes/$ano");
  }