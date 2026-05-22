void main()
  {
    //Declarando as variáveis
    final strings = ["10", "2XXL7", "JOJ0", "99", "381", "AD44", "47", "2B", "123", "78"];

    //imprimindo a lista convertida usando a função toNum
    print("Lista convertida: ${toNum(strings).join(", ")}");

  }

//Função para transformar uma lista de strings em int
List toNum(List<String> Lista)
  {
    final nums = <int>[];
    //percorre a lista de strings, se não puder converter, num = 0;
    for(int i = 0; i < Lista.length; i++)
      {
        int? num = int.tryParse(Lista[i]);

        num ??= 0;

        nums.add(num);
      }

      return nums;
  }