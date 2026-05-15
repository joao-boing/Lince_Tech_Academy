package AtividadePraticaLogica;
import java.net.StandardSocketOptions;
import java.util.Scanner;

//Classe da Atividade 1 de Lógica de Programação
public class Atividade1
    {
        //Main
        public static void main(String[] args)
            {
                //instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //Declaração das variáveis
                double num1, num2, resultado = 0.0;

                //Receber os 2 números
                System.out.println("Digite 2 números, o menor será o divisor do maior :");
                num1 = leia.nextDouble();
                num2 = leia.nextDouble();


                //Verifica o número maior e divide o maior pelo menor
                if(num1 > num2)
                    {
                        //Verifica se o Divisor é Zero
                        if(num2 == 0) System.out.println("Erro : Zero não pode ser divisor");
                        else
                            {
                                resultado = num1 / num2;
                                //Imprime o resultado
                                System.out.println(resultado);
                            }
                    }
                else if (num2 > num1)
                    {
                        //Verifica se o Divisor é Zero
                        if(num1 == 0) System.out.println("Zero não pode ser divisor");
                        else
                            {
                                resultado = num2 / num1;
                                //Imprime o resultado
                                System.out.println(resultado);
                            }

                    }
                else if (num1 ==num2)
                    {
                        //Verifica se o Divisor é Zero
                        if(num1 == 0) System.out.println("Zero não pode ser divisor");
                        else
                        {
                            resultado = num1 / num2;
                            //Imprime o resultado
                            System.out.println(resultado);
                        }
                    }
            }
    }
