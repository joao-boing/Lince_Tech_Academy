package AtividadePraticaLogica;

import java.util.Scanner;

//Classe da Atividade 7 de Lógica de Programação
public class Atividade7
    {
        //Main
        public static void main(String[] args)
            {
                //instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //declarando as variáveis
                double num, fatorial = 1;

                System.out.println("Digite um número para calcular seu fatorial :");
                num = leia.nextDouble();

                //Verificar se é negativo
                if(num < 0)
                    {
                        System.out.println("Número fatorial não pode ser de número negativo");
                        return;
                    }

                //Fórmula fatorial
                for(int i = 1; i <= num; i++)
                    {
                        fatorial *= i;
                    }

                //Imprimindo valor fatorial
                System.out.println("O fatorial de " + num + " é " + fatorial);
            }
    }
