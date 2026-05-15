package AtividadePraticaLogica;
import java.util.Scanner;

//Classe da Atividade 6 de Lógica de Programação
public class Atividade6
    {
        //Main
        public static void main(String [] args)
            {
                //instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //Declarando as variáveis
                double cateto1, cateto2, hipotenusa, aproximacao;

                System.out.println("Digite o cateto1 e o cateto2 respectivamente :");
                cateto1 = leia.nextDouble();
                cateto2 = leia.nextDouble();

                //Se um dos catetos for 0
                if(cateto1 == 0 && cateto2 > 0)
                    {
                        System.out.println("Um dos catetos não pode ser 0!");
                        return;
                    }
                else if(cateto1 > 0 && cateto2 == 0)
                    {
                        System.out.println("Um dos catetos não pode ser 0!");
                        return;
                    }
                else if(cateto1 == 0 && cateto2 == 0)
                    {
                        hipotenusa = 0;
                        System.out.printf("Hipotenusa : %.2f", hipotenusa);
                        return;
                    }

                //Declarando a hipotenusa
                hipotenusa = ((cateto1 * cateto1) + (cateto2 * cateto2));

                //Calculando a raiz da hipotenusa por aproximação
                aproximacao = hipotenusa;
                for(int i = 0; i < 10; i++)
                {
                    aproximacao = (aproximacao + hipotenusa/aproximacao) / 2;
                }
                hipotenusa = aproximacao;

                //Imprimindo a hipotenusa
                System.out.printf("Hipotenusa : %.2f", hipotenusa);
            }
    }
