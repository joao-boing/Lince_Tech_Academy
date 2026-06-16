//Import dart io

import 'dart:io';

//Classe para exportar os arquivos em .txt
class Exportador 
  {

    //informa a pasta de sensores
    final String pastaSensores = 'C:/clima/relatórios';
    final pasta = Directory('C:/clima/relatórios');
    
    //Método para salvar o Relatório
    Future<void> salvarRelatorio
      ({
        required String tipo,
        required String conteudoLimpo,
      }) 
      async 
      {
        try 
          {
            try
              {
                if(!await pasta.exists())
                {
                  await pasta.create(recursive: true);
                }
              }
            catch (e)
              {
                print("Erro ao criar pasta: $e");
              }

            // Cria a data e hora no formato: YYYY-MM-DD_HH-mm
            final agora = DateTime.now();
            final dataStr = '${agora.year}-${agora.month.toString().padLeft(2, '0')}-${agora.day.toString().padLeft(2, '0')}';
            final horaStr = '${agora.hour.toString().padLeft(2, '0')}-${agora.minute.toString().padLeft(2, '0')}';
            
            // Define o nome do arquivo com base no tipo (CLIMA, UMIDADE ou VENTO)
            final nomeArquivo = '${tipo}_${dataStr}_$horaStr.txt';
            final caminhoCompleto = '$pastaSensores/$nomeArquivo';

            //Caminho do arquivo a ser gerado
            final arquivo = File(caminhoCompleto);
            
            // Grava o conteúdo de forma assíncrona
            await arquivo.writeAsString(conteudoLimpo);
            
            //Imprime que o relatório foi salvo
            print('\nRelatório salvo com sucesso em: $caminhoCompleto');
          } 
        catch (e) 
          {
            //Imprime a falha
            print('\nFalha ao salvar o arquivo de relatório: $e');
          }
      }
  }