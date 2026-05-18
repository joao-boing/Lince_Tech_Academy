class Pessoa
  {

    const Pessoa(this.nome, this.sobrenome, this. idade, this.ativo, this.peso, this.nacionalidade);

    final String nome;
    final String sobrenome;
    final int idade;
    final bool ativo;
    final double peso;
    final String nacionalidade;

    String verificaIdade()
      {
        if(idade < 18) return "(menor de idade)";
        else return "(maior de idade)";
      }
    
    String verificaAtivo()
      {
        if(ativo) return "Situação: Ativo";
        else return "Situação: Inativo";
      }
    
    String verificaNacionalidade()
      {
        if(nacionalidade.isEmpty) return "Nacionalidade: Não Informada";
        else return "Nacionalidade: $nacionalidade";
      }

    @override
    String toString()
      {
        return 
        "Nome: $nome $sobrenome\n"
        "Idade: $idade ${verificaIdade()}\n"
        "Peso: $peso\n"
        "${verificaAtivo()}\n"
        "${verificaNacionalidade()}\n";
      }
  }

  void main()
    {
      const pessoa = Pessoa("João", "Boing", 17, true, 78.5, "Brasileiro");

      print(pessoa);
    }