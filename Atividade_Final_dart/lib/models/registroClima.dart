class RegistroClima 
  {
    //Atributos dos registros
    final String estado;
    final int ano;
    final int mes;
    final int hora;
    final double temperatura;
    final double umidade;
    final double velocidadeVento;
    final double direcaoVento;

    //Construtor padrão
    RegistroClima
    ({
      required this.estado,
      required this.ano,
      required this.mes,
      required this.hora,
      required this.temperatura,
      required this.umidade,
      required this.velocidadeVento,
      required this.direcaoVento,
    });

    //Construtor factory, converte a linha em colunas e depois chama o construtor padrão
    factory RegistroClima.fromCsv
    ({
      required String linha,
      required String estado,
      required int ano,
      required int mes,
    }) 
      {
        final colunas = linha.split(',');
        return RegistroClima
        (
          estado: estado,
          ano: ano,
          mes: mes,
          hora: int.parse(colunas[0]),
          temperatura: double.parse(colunas[1]),
          umidade: double.parse(colunas[2]),
          velocidadeVento: double.parse(colunas[3]),
          direcaoVento: double.parse(colunas[4]),
        );
      }

    //Getter de nomeMes
    String get nomeMes 
      {

        //Constante de meses
        const meses = 
        [
          'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
          'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
        ];

        //Retorna o mês informado
        return meses[mes - 1];
      }
  }