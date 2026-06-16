//Import de classes, dart io e yaansi

import 'dart:io';
import 'package:yaansi/yaansi.dart';
import '../lib/models/registroClima.dart';
import '../lib/services/leitor_csv.dart';
import '../lib/services/conversor.dart';
import '../lib/services/exportador.dart';

//Classe main
void main() async {
  //Instanciando o leitor
  final leitor = LeitorCsv();

  //Instanciando o exportador
  final exportador = Exportador();

  //Instanciando o banco de dados de Registros
  List<RegistroClima> bancoDados = [];

  print("Carregando banco de dados climático em 'C:/clima/sensores'...");
  
  try 
    {
      //Chama a função carregarTodosOsDados e atribui ao banco de dados
      bancoDados = await leitor.carregarTodosOsDados();

      //Imprime em verde se todos os dados forem carregados
      print(green("Dados carregados com sucesso! Total de registros: ${bancoDados.length}"));
    } 
  catch (e) 
    {
      //Imprime em vermelho se ouve um erro
      print(red("ERRO CRÍTICO: $e"));
      exit(1);
    }

  //Loop de uso para o menu
  while (true) 
    {
      //Menu
      print("\nOLÁ, LEANDRO. QUE RELATÓRIO VOCÊ PRECISA?");
      print("1 – TEMPERATURA");
      print("2 – UMIDADE");
      print("3 – DIREÇÃO DO VENTO");
      print("4 – SAIR");
      print("DIGITE O NÚMERO DA OPÇÃO DESEJADA: ");

      //Lê a entrada do usuário
      String? opcao = stdin.readLineSync();

      //Se o usuário sair
      if (opcao == '4') 
        {
          print(bold("Encerrando o programa. Até logo!"));
          exit(0);
        }

      //Se o usuário não digitou o número correto
      if (opcao != '1' && opcao != '2' && opcao != '3') 
        {
          //Imprime em vermelho
          print(red("Opção inválida! Escolha um número de 1 a 4."));
          continue;
        }

      //Pergunta se deseja salvar o relatório em um arquivo .txt
      stdout.write("DESEJA SALVAR ESTE RELATÓRIO EM UM ARQUIVO TXT? (S/N): ");
      
      //Lê a resposta em upperCase
      String? respostaSalvar = stdin.readLineSync()?.toUpperCase();

      //Bool para salvar ou não
      bool deveSalvar = (respostaSalvar == 'S' || respostaSalvar == 'SIM');

      //Switch de opcao
      switch (opcao) 
        {
          //Caso 1
          case '1':
            //Await para esperar o programa processar o relatório
            //Função processar Relatório de temperatura
            await processarRelatorioTemperatura(bancoDados, deveSalvar, exportador);
            break;
          case '2':
            //Await para esperar o programa processar o relatório
            //Função processar Relatório de Umidade
            await processarRelatorioUmidade(bancoDados, deveSalvar, exportador);
            break;
          case '3':
            //Await para esperar o programa processar o relatório
            //Função processar Relatório de Vento
            await processarRelatorioVento(bancoDados, deveSalvar, exportador);
            break;
        }
    }
}

//Processamento de Temperatura e exibição

//Função ProcessarRelatórioTemperatura
Future<void> processarRelatorioTemperatura(List<RegistroClima> dados, bool deveSalvar, Exportador exportador) async 
  {
    //Buffer para imprimir e evitar uso de memória do computador
    final buffer = StringBuffer();
    buffer.writeln('=== RELATÓRIO DE TEMPERATURA ===');

    //Lista de estados retiradors de registro, tira os estados repetidos, transforma em lista
    //E organiza em ordem alfabética
    final estados = dados.map((e) => e.estado).toSet().toList()..sort();

    //Percorre os estados
    for (var est in estados) 
      {
        //Pega os registros do estado especifico
        final dadosEstado = dados.where((e) => e.estado == est).toList();

        //Pega os anos do estado especifico, tirando os repetidos, transformando em lista
        //E ordenando
        final anos = dadosEstado.map((e) => e.ano).toSet().toList()..sort();

        buffer.writeln('\n ESTADO: $est');

        //Percorre cada ano em anos
        for (var ano in anos) 
          {

            //Pega os dados do ano daquele estado
            final dadosAno = dadosEstado.where((e) => e.ano == ano).toList();
            
            //Atribui a temperatura média do ano
            double mediaAno = dadosAno.map((e) => e.temperatura).reduce((a, b) => a + b) / dadosAno.length;

            //Atribui a temperatura máxima do ano
            double maxAno = dadosAno.map((e) => e.temperatura).reduce((a, b) => a > b ? a : b);
            
            //Atribui a temperatura mínima do ano
            double minAno = dadosAno.map((e) => e.temperatura).reduce((a, b) => a < b ? a : b);

            buffer.writeln('   Ano: $ano');
            buffer.writeln('    Média Anual:  ${mediaAno.toStringAsFixed(1)}°C | ${Conversor.cParaF(mediaAno).toStringAsFixed(1)}°F | ${Conversor.cParaK(mediaAno).toStringAsFixed(1)}K');
            buffer.writeln('    Máxima Anual: ${maxAno.toStringAsFixed(1)}°C | ${Conversor.cParaF(maxAno).toStringAsFixed(1)}°F | ${Conversor.cParaK(maxAno).toStringAsFixed(1)}K');
            buffer.writeln('    Mínima Anual: ${minAno.toStringAsFixed(1)}°C | ${Conversor.cParaF(minAno).toStringAsFixed(1)}°F | ${Conversor.cParaK(minAno).toStringAsFixed(1)}K');

            //Pega os meses daquele ano
            final meses = dadosAno.map((e) => e.mes).toSet().toList()..sort();

            //Percorre todos os meses
            for (var mes in meses) 
              {

                //Atribui os dados do mes especifico
                final dadosMes = dadosAno.where((e) => e.mes == mes).toList();
                
                //Atribui a temperatura média do mês
                double mediaMes = dadosMes.map((e) => e.temperatura).reduce((a, b) => a + b) / dadosMes.length;

                //Atribui a temperatura máxima do mês
                double maxMes = dadosMes.map((e) => e.temperatura).reduce((a, b) => a > b ? a : b);

                //Atribui a temperatura mínima do mês
                double minMes = dadosMes.map((e) => e.temperatura).reduce((a, b) => a < b ? a : b);

                buffer.writeln('     Mês: ${dadosMes.first.nomeMes}');
                buffer.writeln('      Média Mensal:  ${mediaMes.toStringAsFixed(1)}°C | ${Conversor.cParaF(mediaMes).toStringAsFixed(1)}°F | ${Conversor.cParaK(mediaMes).toStringAsFixed(1)}K');
                buffer.writeln('      Máxima Mensal: ${maxMes.toStringAsFixed(1)}°C | ${Conversor.cParaF(maxMes).toStringAsFixed(1)}°F | ${Conversor.cParaK(maxMes).toStringAsFixed(1)}K');
                buffer.writeln('      Mínima Mensal: ${minMes.toStringAsFixed(1)}°C | ${Conversor.cParaF(minMes).toStringAsFixed(1)}°F | ${Conversor.cParaK(minMes).toStringAsFixed(1)}K');
              }

            buffer.writeln('     Média por Horário (Estado/Ano):');

            //Pega os dados de cada hora do ano
            final horas = dadosAno.map((e) => e.hora).toSet().toList()..sort();
            for (var hora in horas) 
              {
                //Junta todos os dados daquela hora especifica no ano todo
                final dadosHora = dadosAno.where((e) => e.hora == hora).toList();

                //Faz a média desse horário
                double mediaHora = dadosHora.map((e) => e.temperatura).reduce((a, b) => a + b) / dadosHora.length;

                //Imprime formatado usando o conversor
                buffer.writeln('      ${hora.toString().padLeft(2, '0')}h -> ${mediaHora.toStringAsFixed(1)}°C | ' +
                //Conversor para fahrenheit
                '${Conversor.cParaF(mediaHora).toStringAsFixed(1)}°F | ' +
                //Conversor para kelvin
                '${Conversor.cParaK(mediaHora).toStringAsFixed(1)}K');
              }
          }
      }

    //Imprime no terminal aplicando a estilização de cores exigida pelo Usuário
    String relatorioFormatado = buffer.toString();
    
    //Chamando a função imprimir temperatura com cores
    imprimirTemperaturaComCores(relatorioFormatado);
    
    //Se deve salvar
    if (deveSalvar) 
    {
      //Await para esperar o termino do processor
      //Chama a função salvarRelatorio, informa o tipo e o conteúdo
      await exportador.salvarRelatorio(tipo: 'CLIMA', conteudoLimpo: relatorioFormatado);
    }
  }

//Função para imprimir as temperaturas com cores
void imprimirTemperaturaComCores(String textoLinguagem) 
  {
    //Varre as linhas do texto e colore os blocos numéricos de acordo com a unidade
    final linhas = textoLinguagem.split('\n');

    //Percorre as linhas
    for (var linha in linhas) 
      {

        //Separa as linhas
        if (linha.contains('°C') || linha.contains('°F') || linha.contains('K')) 
          {
            //Divide a linha nos separadores '|' para colorir cada unidade individualmente
            final partes = linha.split('|');

            //Se tem 3 partes
            if (partes.length == 3) 
              {
                //Celsius em vermelho
                final cel = red(partes[0]);
                //Fahrenheit em amarelo
                final fah = yellow(partes[1]);
                //Kelvin em azul
                final kel = blue(partes[2]);
                //Imprime
                print('$cel| $fah| $kel');
              } 
            //Se não
            else 
              {
                //Só imprime a linha
                print(linha);
              }
          } 
        else if (linha.contains('===')) 
          {
            //Imprime em negrito
            print(bold(linha));
          } 
        else 
        {
          //Se não, só imprime
          print(linha);
        }
      }
  }


//Processamento de Umidade e exibição

//Função processarRelatorioUmidade
Future<void> processarRelatorioUmidade(List<RegistroClima> dados, bool deveSalvar, Exportador exportador) async 
  {

    //Buffer
    final buffer = StringBuffer();
    buffer.writeln('=== RELATÓRIO DE UMIDADE DO AR ===');

    //Lista de estados retiradors de registro, tira os estados repetidos, transforma em lista
    //E organiza em ordem alfabética
    final estados = dados.map((e) => e.estado).toSet().toList()..sort();

    //Percorre estados
    for (var est in estados) 
      {

        //Pega os dados do estado
        final dadosEstado = dados.where((e) => e.estado == est).toList();

        //Pega os anos do estado evitando repetição e ordenando
        final anos = dadosEstado.map((e) => e.ano).toSet().toList()..sort();

        buffer.writeln('\n ESTADO: $est');

        //Percorre os anos
        for (var ano in anos) 
          {

            //Pega os dados do ano
            final dadosAno = dadosEstado.where((e) => e.ano == ano).toList();
            
            //Atribui a Umidade média do ano
            double mediaAno = dadosAno.map((e) => e.umidade).reduce((a, b) => a + b) / dadosAno.length;


            //Atribui a Umidade máxima do ano
            double maxAno = dadosAno.map((e) => e.umidade).reduce((a, b) => a > b ? a : b);

            //Atribui a Umidade mínima do ano
            double minAno = dadosAno.map((e) => e.umidade).reduce((a, b) => a < b ? a : b);

            

            buffer.writeln('   Ano: $ano');
            buffer.writeln('    Média Anual:  ${Conversor.kgParaGramas(mediaAno).toStringAsFixed(2)} g/m³');
            buffer.writeln('    Máxima Anual: ${Conversor.kgParaGramas(maxAno).toStringAsFixed(2)} g/m³');
            buffer.writeln('    Mínima Anual: ${Conversor.kgParaGramas(minAno).toStringAsFixed(2)} g/m³');

            //Atribui os meses do ano
            final meses = dadosAno.map((e) => e.mes).toSet().toList()..sort();

            //Percorre os meses
            for (var mes in meses) 
              {

                //Pega os dados do mês
                final dadosMes = dadosAno.where((e) => e.mes == mes).toList();
                
                //Atribui a Umidade média do mês
                double mediaMes = dadosMes.map((e) => e.umidade).reduce((a, b) => a + b) / dadosMes.length;

                //Atribui a Umidade máxima do mês
                double maxMes = dadosMes.map((e) => e.umidade).reduce((a, b) => a > b ? a : b);

                //Atribui a Umidade mínima do mês
                double minMes = dadosMes.map((e) => e.umidade).reduce((a, b) => a < b ? a : b);

                buffer.writeln('     Mês: ${dadosMes.first.nomeMes}');
                buffer.writeln('      Média Mensal:  ${Conversor.kgParaGramas(mediaMes).toStringAsFixed(2)} g/m³');
                buffer.writeln('      Máxima Mensal: ${Conversor.kgParaGramas(maxMes).toStringAsFixed(2)} g/m³');
                buffer.writeln('      Mínima Mensal: ${Conversor.kgParaGramas(minMes).toStringAsFixed(2)} g/m³');
              }
          }
      }

    //Atribui o relatorio formatado em String
    String relatorioFormatado = buffer.toString();
    
    //Separa as linhas do relatorio formatado
    final linhas = relatorioFormatado.split('\n');

    //Percorre as linhas e imprime com suas cores
    for (var linha in linhas) 
      {
        if (linha.contains('Média')) 
          {
            print(green(linha));
          } 
        else if (linha.contains('Máxima')) 
          {
            print(red(linha));
          } 
        else if (linha.contains('Mínima')) 
          {
            print(blue(linha));
          } 
        else if (linha.contains('===')) 
          {
            print(bold(linha));
          } 
        else 
          {
            print(linha);
          }
      }
    
    //Salvar em txt se o usuário quiser
    if (deveSalvar) 
      {
        await exportador.salvarRelatorio(tipo: 'UMIDADE', conteudoLimpo: relatorioFormatado);
      }
  }

//Processamento de Vento e exibição

//Função processarRelatorioVento
Future<void> processarRelatorioVento(List<RegistroClima> dados, bool deveSalvar, Exportador exportador) async 
  {
    //Buffer
    final buffer = StringBuffer();
    buffer.writeln('=== RELATÓRIO DE DIREÇÃO DO VENTO ===');

    //Lista de estados retiradors de registro, tira os estados repetidos, transforma em lista
    //E organiza em ordem alfabética
    final estados = dados.map((e) => e.estado).toSet().toList()..sort();

    //Percorre os estados
    for (var est in estados) 
      {

        //Pega os dados do estado
        final dadosEstado = dados.where((e) => e.estado == est).toList();

        //Pega os anos do estado evitando repetição e ordenando
        final anos = dadosEstado.map((e) => e.ano).toSet().toList()..sort();

        buffer.writeln('\n ESTADO: $est');

        //Percorre os anos
        for (var ano in anos) 
          {

            //Pega os dados do ano específico
            final dadosAno = dadosEstado.where((e) => e.ano == ano).toList();

            //Calcula a moda daquele ano
            double modaAno = calcularModaVento(dadosAno);

            buffer.writeln('   Ano: $ano');
            buffer.writeln('    Direção mais frequente: ${modaAno.toStringAsFixed(0)}° e ${Conversor.grausParaRad(modaAno).toStringAsFixed(2)} rad');

            //Pega os meses daquele ano
            final meses = dadosAno.map((e) => e.mes).toSet().toList()..sort();

            //Percorre os meses
            for (var mes in meses) 
              {

                //Pega os dados do mes
                final dadosMes = dadosAno.where((e) => e.mes == mes).toList();

                //Calcula a moda do mes
                double modaMes = calcularModaVento(dadosMes);

                buffer.writeln('    Mês: ${dadosMes.first.nomeMes} -> Direção mais frequente: ${modaMes.toStringAsFixed(0)}° e ${Conversor.grausParaRad(modaMes).toStringAsFixed(2)} rad');
              }
          }
      }

    //Atribui o relatorio formatado em String
    String relatorioFormatado = buffer.toString();
    
    //Imprime aplicando amarelo para todas as informações de direção de vento
    final linhas = relatorioFormatado.split('\n');
    for (var linha in linhas) 
      {
        if (linha.contains('Direção mais frequente')) 
          {
            print(yellow(linha));
          } 
        else if (linha.contains('===')) 
          {
            print(bold(linha));
          } 
        else 
          {
            print(linha);
          }
      }

    //Salvar em txt se o usuário quiser
    if (deveSalvar) 
      {
        await exportador.salvarRelatorio(tipo: 'VENTO', conteudoLimpo: relatorioFormatado);
      }
  }

//Função para calcular a moda do vento
double calcularModaVento(List<RegistroClima> lista)
 {
  //Se a lista estivar vazia, retorna zero
  if (lista.isEmpty) return 0.0;

  //Map da contagem, recebendo a direção e sua contagem de vezes que ela foi registrada
  Map<double, int> contagem = {};

  //Percorre todas as direções
  for (var registro in lista) 
    {
      //Verifica se aquela direção já apareceu, se sim, adiciona 1 à contagem
      contagem[registro.direcaoVento] = (contagem[registro.direcaoVento] ?? 0) + 1;
    }

  //Retorna a direção com mais contagens
  return contagem.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }