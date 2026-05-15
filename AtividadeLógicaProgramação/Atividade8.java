package AtividadePraticaLogica;

import java.util.Scanner;

//Classe da Atividade 8 de Lógica de Programação
public class Atividade8
    {
        //Main
        public static void main(String[] args)
            {
                //instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //Declarando as variáveis
                int X;

                System.out.println("Digite um número para imprimir sua tabuada do 1 ao 9 :");
                X = leia.nextInt();

                //Fórmula da tabuada
                for(int i = 1; i <= 9; i++)
                    {
                        //Imprimindo tabuada do 1 ao 9
                        System.out.println(i + " X " + X + " = " + X * i);
                    }
            }
    }
