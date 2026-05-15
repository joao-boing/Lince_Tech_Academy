package AtividadePraticaLogica;
import java.util.Scanner;

//Classe da Atividade 2 de Lógica de Programação
public class Atividade2
    {
        //Main
        public static void main(String[] args)
            {
                //instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //Declaração das variáveis
                boolean impar = false;
                int[] numeros = new int[5];

                //Lendo os 5 números
                System.out.println("Digite números inteiros :");
                for(int i = 0; i < numeros.length; i++)
                    {
                        numeros[i] = leia.nextInt();
                    }

                //Percorre o vetor numeros, verifica e imprime os números ímpares
                for(int i = 0; i < 5; i++)
                    {
                        if(numeros[i] % 2 != 0)
                            {
                                System.out.print(numeros[i] + " ");
                                impar = true;
                            }
                    }

                if(impar == false)
                    {
                        System.out.println("Não foram encontrados números ímpares");
                    }
            }
    }
