void main()
  {
    try
      {
        //Declarando o objeto
        final conta = ContaBancaria("João", 1500);

        //chamando as funções
        conta.depositar(1000);
        conta.sacar(2000);

        //imprimindo o saldo atual
        print("Saldo atual: ${conta.saldo}");
      }
    catch (e)
      {
        //lançando a exception
        print(e);
      }
    finally
      {
        //finalizando
        print("Programa finalizado");
      }
  }

//classe de uma conta bancária
class ContaBancaria
  {
    //declarando as variáveis
    final String titular;
    double saldo;

    //construtor
    ContaBancaria(this.titular, this.saldo);

    //Função depositar
    void depositar(valor)
      {
        //verificar se o valor depositado é menor que 1 centavo, lança uma exception
        if(valor < 0.01) throw ValorInsuficienteDeposito(valor);
        saldo += valor;
        print("Seu depósito foi concluído. Saldo: $saldo reais");
      }

    //função sacar
    void sacar(valor)
      {
        //verificar se o valor de saque é menor que o saldo atual, lança uma exception
        if(valor > saldo) throw ValorInsuficienteSaque(valor);
        saldo -= valor;
        print("Seu saque foi concluído. Saldo: $saldo reais");
      }
  }

//Exception personalizada ValorInsuficienteDeposito para caso o valor de depósito seja menor que 1 centavo
class ValorInsuficienteDeposito implements Exception 
  {
    final valor;
    String mensagem = "Saldo insuficiente para depositar";
    ValorInsuficienteDeposito(this.valor);

    @override
    String toString()
      {
        return "Erro: $mensagem: $valor";
      }
  }

//Exception personalizada ValorInsuficienteSaque para caso o valor de saque seja maior que o saldo atual
class ValorInsuficienteSaque implements Exception 
  {
    final valor;
    String mensagem = "Saldo insuficiente para sacar";
    ValorInsuficienteSaque(this.valor);

    @override
    String toString()
      {
        return "Erro: $mensagem: $valor";
      }
  }