package AtividadePraticaLogica;

import java.util.Scanner;

//Classe da Atividade 9 de Lógica de Programação
public class Atividade9
    {
        //Main
        public static void main(String[] args)
            {
                //Instanciando o Scanner
                Scanner leia = new Scanner(System.in);

                //Declarando as variáveis
                int totalVogais = 0, totalConsoantes = 0, totalLetras = 0, totalPalavras = 0;

                System.out.println("Digite uma Palavra ou Frase :");
                String frase = leia.nextLine();

                //Separando a frase em caracteres únicos e maiúsculos
                char[] caracteres = frase.toUpperCase().toCharArray();

                //Separando a frase em Palavras
                String[] palavras = frase.trim().split(" ");

                //percorre os caracteres unicos, verifica se é uma vogal e adiciona ao total de Vogais, se não, adiciona ao total de Consoantes
                for(int i = 0; i < caracteres.length; i++)
                    {
                        if(caracteres[i] == 'A' || caracteres[i] == 'Á' || caracteres[i] == 'À' || caracteres[i] == 'Ã' || caracteres[i] == 'Â' ||
                                caracteres[i] == 'E' || caracteres[i] == 'É' || caracteres[i] == 'È' || caracteres[i] == 'Ê' ||
                                caracteres[i] == 'I' || caracteres[i] == 'Í' || caracteres[i] == 'Ì' || caracteres[i] == 'Î' ||
                                caracteres[i] == 'O' || caracteres[i] == 'Ó' || caracteres[i] == 'Ò' || caracteres[i] == 'Õ' || caracteres[i] == 'Ô' ||
                                caracteres[i] == 'U' || caracteres[i] == 'Ú' || caracteres[i] == 'Ù' || caracteres[i] == 'Û')
                            {
                                totalVogais++;
                            }
                        else
                            {
                                totalConsoantes++;
                            }
                    }

                //percorre os caracteres unicos, verifica se é uma letra e adiciona ao total de Letras
                for(int i = 0; i < caracteres.length; i++)
                    {
                        if(Character.isLetter(caracteres[i]))
                            {
                                totalLetras++;
                            }
                    }

                //Declara o total de palavras
                totalPalavras = palavras.length;

                //Imprimindo os resultados
                System.out.println("total de Consoantes é " + totalConsoantes);
                System.out.println("total de Vogais é " + totalVogais);
                System.out.println("total de Letras é " + totalLetras);
                System.out.println("total de Palavras é " + totalPalavras);
            }
    }
