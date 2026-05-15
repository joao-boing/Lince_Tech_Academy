package AtividadePraticaLogica;
import java.util.Scanner;

//Classe da Atividade 4 de Lógica de Programação
public class Atividade4
{
    //Main
    public static void main(String[] args)
        {
            //instanciando o Scanner
            Scanner leia = new Scanner(System.in);

            //Declaração das variáveis
            double num1, num2, mmc = 0;

            System.out.println("Digite dois números para descobrir seu MMC :");
            num1 = leia.nextDouble();
            num2 = leia.nextDouble();

            if(num1 == 0 || num2 == 0)
                {
                    System.out.println(mmc);
                    return;
                }

            //Multiplica os números por 1000 para transforma-los em inteiros sem perder o decimal
            num1 = num1 * 1000;
            num2 = num2 * 1000;

            //Transforma os números em inteiros para evitar possiveis erros com decimais
            int num1i = (int) num1;
            int num2i = (int) num2;


            //Divide os números pelo mmc e adiciona 1 a ele mesmo até o restante dos dois números serem equivalentes a 0
            do
                {
                    mmc += 1;
                }while((mmc % num1i != 0) || (mmc % num2i != 0));

            //Imprime os números dividindo-os por 1000
            System.out.println(mmc / 1000);
        }
}
