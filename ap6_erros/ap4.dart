abstract class Arquivo
  {
    void abrir();
  }

class ArquivoTexto implements Arquivo
  {
    final String _nome;

    ArquivoTexto(this._nome);

    @override
    void abrir()
      {
        try
          {
            throw Exception("Erro ao abrir o arquvio $_nome");
          }
        catch (e)
          {
            print("Relançando a exception");
            rethrow;
          }
      }

  }

void main()
  {
    try
      {
        String nomeArquivo = "Texto.txt";

        ArquivoTexto arquivo = ArquivoTexto(nomeArquivo);

        arquivo.abrir();
      }
    catch (e)
      {
        print(e);
      }
    finally
      {
        print("fim do programa");
      }
  }