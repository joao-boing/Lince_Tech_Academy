import 'dart:math';

void main()
  {
    //Instanciando o random
    Random random = new Random();

    //Declarando as variáveis
    var nums1 = List.generate(5, (_) => random.nextInt(101));
    var nums2 = List.generate(5, (_) => random.nextInt(101));

    //Instanciando o método imprimir Lista
    imprimirLista(nums1);
    imprimirLista(nums2);

    //Atribuindo à Lista nums3 o método somarListas
    var nums3 = somarListas(nums1, nums2);
    ////Instanciando o método imprimir Lista
    imprimirLista(nums3);
  }

//Método para imprimir lista
void imprimirLista(List Lista)
  {
    //Se a lista for vazia, returna "Lista Vazia"
    if(Lista.length == 0) print("Lista Vazia");
    //imprime a lista
    else print("Lista: ${Lista.join(", ")}");
  }

//Método para somar as listas e retornar uma lista com as somas
List somarListas(List? Lista1, List? Lista2)
  {
    //declarando a Lista3 a ser retornada
    var Lista3 = [];

    //Verifica se uma das Listas é vazia, retorrna a Lista3 vazia
    if(Lista1 == null || Lista2 == null) return Lista3;
    //Verifica se a lenght das listas são diferentes, retorrna a Lista3 vazia
    if(Lista1.length != Lista2.length) return Lista3;

    //percorre às Listas para soma-lás e imprime as equações
    for(int i = 0; i < Lista1.length; i++)
      {
        //atribui o valor à lista3
        Lista3.add(Lista1[i] + Lista2[i]);
        final listaValor1 = Lista1[i];
        final listaValor2 = Lista2[i];
        //imprime as equações
        print("${listaValor1}+${listaValor2}");
      }

    //retorna a lista3
    return Lista3;
  }