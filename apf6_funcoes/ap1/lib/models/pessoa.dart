
//Enum de tipoSanguineo
enum TipoSanguineo {
  aPositivo('A+'),
  aNegativo('A-'),
  bPositivo('B+'),
  bNegativo('B-'),
  oPositivo('O+'),
  oNegativo('O-'),
  abPositivo('AB+'),
  abNegativo('AB-');

  //sigla de cada tipo
  final String sigla;

  //Construtor com a sigla
  const TipoSanguineo(this.sigla);
}

//Pessoa
class Pessoa {

  //Construtor
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  @override
  //Override do equal
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pessoa &&
        nome == other.nome &&
        email == other.email &&
        telefone == other.telefone &&
        github == other.github &&
        tipoSanguineo == other.tipoSanguineo;
  }

  @override
  //Override de HashCode
  int get hashCode {
    return nome.hashCode ^
        email.hashCode ^
        telefone.hashCode ^
        github.hashCode ^
        tipoSanguineo.hashCode;
  }
}