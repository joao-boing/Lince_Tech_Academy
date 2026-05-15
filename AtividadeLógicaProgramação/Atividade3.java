package AtividadePraticaLogica;

//Classe da Atividade 3 de Lógica de Programação
public class Atividade3
{

    //Metodo para calcular a subtração e transformar o número em número absoluto
    public static int Subtracao(int num1, int num2)
        {
            //declaração da variável resultado;
            int resultado = num1 - num2;

            //Transforma o número negativo em número absoluto
            if(resultado < 0)
                {
                    resultado = resultado * -1;

                }
            //retorna o resultado
            return resultado;
        }

    //Main
    public static void main(String[] args)
        {
            //declaração da variável utilizando o metodo Subtração
            int resultado = Subtracao(125, 465);

            //Imprime o resultado
            System.out.println(resultado);
        }
}
