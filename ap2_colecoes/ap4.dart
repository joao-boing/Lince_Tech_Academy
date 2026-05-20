void main()
  {
    //Declarando as variáveis
    final listaCidades = 
      {
        'SC': ['Gaspar', 'Blumenau', 'Florianopolis'],
        'PR': ['Curitiba', 'Cascavel', 'Foz do Iguacu'],
        'SP': ['Sao Paulo', 'Guarulhos', 'Campinas'],
        'MG': ['Belo Horizonte', 'Juiz de Fora', 'Berlinda'],
      };

    //Imprimindo a Lista dos Estados
    print('\nEstados: ${listaCidades.keys.join(' ; ')}\n');

    //Criando a lista santaCatarina da lista de SC
    final santaCatarina = listaCidades['SC']!;

    //ordenando alfabeticamente
    santaCatarina.sort();

    //Imprime as cidades de SC
    print('Cidades de SC: ${santaCatarina.join(' ; ')}\n');

    //declarando a lista cidades com sigla (Cidade - estado)
    final cidadesComSigla = [];

    //percorre os estados da listaCidades
    for(var estado in listaCidades.keys)
      { 
        //atribui os estados a uma lista
        final cidadesDoEstado = listaCidades[estado]!;

        //percorrer as cidades dentro da lista de estados
        for(var cidade in cidadesDoEstado)
          {    
              //atribui a lista cidadesComSiglado
              cidadesComSigla.add('$cidade - $estado');
          }
      }
    
    //ordena alfabeticamente
    cidadesComSigla.sort();

    //imprime as cidades ordenadas com sigla dos estados
    print('${cidadesComSigla.join('\n')}');
  }