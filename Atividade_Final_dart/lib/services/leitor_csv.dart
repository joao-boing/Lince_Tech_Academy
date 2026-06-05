//Imports de dart io e registroClima

import 'dart:io';
import '../models/registroClima.dart';

//Classe para ler os arquivos dentro de C:/clima/sensores
class LeitorCsv 
  {

    //Informando o caminho do diretório
    final String caminhoDiretorio = 'C:/clima/sensores';

    //Método para carregar ler todos os arquivos
    Future<List<RegistroClima>> carregarTodosOsDados() async 
      {

        //Lista de todos os registros
        List<RegistroClima> todosRegistros = [];
        
        //Instanciando o diretório
        final diretorio = Directory(caminhoDiretorio);

        try 
          {
            //Se o diretório não existir, lança exception
            if (!await diretorio.exists()) 
              {
                throw FileSystemException("Falha ao extrair informações, nenhum arquivo encontrado.");
              }

            //Iterável dos arquivos .csv dentro do diretório
            final arquivos = diretorio.listSync().where((item) => item.path.endsWith('.csv'));

            //Se não existir nenhum arquivo .csv, lança exception
            if (arquivos.isEmpty) 
              {
                throw FileSystemException("Falha ao extrair informações, nenhum arquivo encontrado.");
              }

            //Loop para verificar os arquivos
            for (var entidade in arquivos) 
              {

                //Se o arquivo for um arquivo
                if (entidade is File) {

                  //Nome do arquivo
                  final nomeArquivo = entidade.uri.pathSegments.last;

                  //Separa o nome do arquivo em partes. (tira o .csv e divide a cada _)
                  final partes = nomeArquivo.replaceAll('.csv', '').split('_');

                  //Se tiver mais que 3 partes, ignora o arquivo
                  if (partes.length != 3) continue;

                  //Estado
                  String estado = partes[0].toUpperCase();

                  //Ano
                  int ano = int.parse(partes[1]);

                  //Mes
                  int mes = int.parse(partes[2]);

                  //Lê as linhas
                  final linhas = await entidade.readAsLines();

                  // Pula se estiver vazio ou só com cabeçalho
                  if (linhas.length <= 1) continue;

                  // Ignora a linha 0 (cabeçalho)
                  for (int i = 1; i < linhas.length; i++) 
                    {

                      //Se a linha estiver vazia, pula pra próxima
                      if (linhas[i].trim().isEmpty) continue;

                      try 
                        {
                          //Adiciona a linha aos registros
                          todosRegistros.add(RegistroClima.fromCsv(
                            linha: linhas[i],
                            estado: estado,
                            ano: ano,
                            mes: mes,
                          ));
                        } 
                      catch (_) 
                        {
                          //Lança exception
                          throw FileSystemException("Falha na leitura de um arquivo.");
                        }
                    }
                }
              }
          } 
        on FileSystemException 
          {
            rethrow;
          } 
        catch (e) 
          {
            //Lança exception
            throw FileSystemException("Falha inesperada ao extrair informações.");
          }

        //Retorna a lista de registros
        return todosRegistros;
      }
  }