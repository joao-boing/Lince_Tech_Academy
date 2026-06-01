void main()
  {
    //Declarando a lista de números
    final lista = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];
    
    //Declarando as variáveis com as funções
    int somafor = somarFor(lista);
    int somawhile = somarWhile(lista);
    int somarecursiva = somaRecursiva(lista);
    int somacolecao = somaColecao(lista);

    //imprime as variáveis
    print("for: $somafor");
    print("while: $somawhile");
    print("recursão: $somarecursiva");
    print("lista: $somacolecao");
  }

//Somatória com for
int somarFor(List<int> nums)
  {
    int soma = 0;
    for(int i = 0; i < nums.length; i++)
      {
        soma = soma + nums[i];
      }
    return soma;
  }

//Somatória com while
int somarWhile(List<int> nums)
  {
    int soma = 0;
    int indice = 0;
    while(indice != nums.length)
      {
        soma = soma + nums[indice];
        indice++;
      }
    return soma;
  }

//Somatória com recursão
int somaRecursiva(List<int> nums, [int indice = 0]) {

  if (indice == nums.length) {
    return 0;
  }
  return nums[indice] + somaRecursiva(nums, indice + 1);
}

//Somatória com coleção
int somaColecao(List<int> nums)
  {
    int soma = nums.reduce((value, element) => value + element);
    return soma;
  }