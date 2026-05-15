package AtividadePraticaLogica;

import java.util.Scanner;

//Classe da Atividade 5 de Lógica de Programação
public class Atividade5
    {
        //Main
        public static void main(String[] args)
            {
                //instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //Declaração das variáveis
                double a, b, c, formula_positivo, formula_negativo, delta, aproximacao;
                System.out.println("Digite os 3 números de uma equação de segundo grau, sendo respectivamente\n" +
                        "a, b e c :");
                a = leia.nextDouble();
                b = leia.nextDouble();
                c = leia.nextDouble();


                //Verifica se a é diferente de 0
                if(a == 0)
                    {
                        System.out.println("a não pode ser zero em uma equação de segundo grau");
                    }

                //Delta da fórmula de bhaskara
                delta = (b * b) - (4 * (a * c));

                //Verifica se Delta é negativo e, se for negativo, encerra o código
                if(delta < 0)
                    {
                        System.out.println("A fórmula não possui raizes reais!");
                        return;
                    }

                //Calculando a raiz aproximadamente
                aproximacao = delta;
                for(int i = 0; i < 10; i++)
                    {
                        aproximacao = (aproximacao + delta/aproximacao) / 2;
                    }
                delta = aproximacao;

                //fórmula de bhaskara com adição do delta
                formula_positivo = ((-b) + delta) / (2 * a);

                //fórmula de bhaskara com subtração do delta
                formula_negativo = ((-b) - delta) / (2 * a);

                //imprimindo os dois resultados do X
                System.out.printf("X1 = %.2f\nX2 = %.2f" , formula_positivo, formula_negativo);
            }
    }
