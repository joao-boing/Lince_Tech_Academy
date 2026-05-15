package AtividadePraticaLogica;

import java.util.Scanner;

//Classe da Atividade 10 de Lógica de Programação
public class atividade10
    {
        //Main

        public static void main(String[] args)
            {
                Scanner leia = new Scanner(System.in);

                //Verifica a quantidade de números a ser inserida
                System.out.println("A quantidade de número a ser inserida :");
                int contagem  = leia.nextInt();
                int[] nums = new int[contagem];

                //Lê os números inseridos
                System.out.println("Digite os números :");
                for(int i = 0; i < contagem; i++)
                {
                    nums[i] = leia.nextInt();
                }

                //Declarando as variáveis
                int maior = nums[0];
                int menor = nums[0];
                int soma = 0;
                int somaPares = 0;
                int somaImpares = 0;
                int media = 0;

                //Percorre os numeros do vetor nums para fazer a comparação
                for(int i = 0; i < nums.length - 1; i++)
                    {
                        //Percorre os numeros do vetor nums para fazer a comparação
                        for(int j = 0; j < nums.length - 1; j++)
                            {
                                //Verifica se o número atual J é menor que o próximo
                                if (nums[j] < nums[j+ 1])
                                    {
                                        //Armazena o número atual dentro de um int temporário
                                        int temporario = nums[j];
                                        //troca os lugares do número atual com o próximo dentro do vetor nums
                                        nums[j] = nums [j + 1];
                                        nums[j + 1] = temporario;
                                    }
                            }
                    }

                //imprime o vetor nums de forma decrescente
                System.out.print("Números em ordem decrescente : ");
                for(int i = 0; i < nums.length; i++)
                    {
                        System.out.print(nums[i] + " ");
                    }
                //quebra de linha
                System.out.println();

                //Percorre os numeros do vetor nums para fazer a comparação
                for(int i = 0; i < nums.length - 1; i++)
                    {
                        //Percorre os numeros do vetor nums para fazer a comparação
                        for(int j = 0; j < nums.length - 1; j++)
                            {
                                //Verifica se o número atual J é maior que o próximo
                                if (nums[j] > nums[j+ 1])
                                    {

                                        //Armazena o número atual dentro de um int temporário
                                        int temporario = nums[j];
                                        //troca os lugares do número atual com o próximo dentro do vetor nums
                                        nums[j] = nums [j + 1];
                                        nums[j + 1] = temporario;
                                    }
                            }
                    }

                //imprime o vetor nums de forma crescente
                System.out.print("Números em ordem crescente : ");
                for(int i = 0; i < nums.length; i++)
                {
                    System.out.print(nums[i] + " ");
                }
                //quebra de linha
                System.out.println();

                //percorre o vetor nums
                for(int i = 0; i < nums.length; i++)
                    {
                        //verifica se o numero atual é maior que a variável maior
                        if(nums[i] > maior)
                            {
                                //A variável maior vira o número atual
                                maior = nums[i];
                            }
                    }

                //imprime o número maior do vetor nums
                System.out.println("Maior Número do Vetor : " + maior);

                for(int i = 0; i < nums.length; i++)
                    {
                        //verifica se o numero atual é menor que a variável menor
                        if(nums[i] < menor)
                            {
                                //A variável menor vira o número atual
                                menor = nums[i];
                            }
                    }

                //imprime o número menor do vetor nums
                System.out.println("Menor Número do Vetor : " + menor);

                for(int i = 0; i < nums.length; i++)
                    {
                        soma = soma + nums[i];
                    }

                //imprime a soma de todos os número do vetor nums
                System.out.println("Soma de todos os números do Vetor : " + soma);

                //Declara a média dos números do vetor nums
                media = soma / nums.length;

                //imprime a media dos número do vetor nums
                System.out.println("Média dos números do Vetor : " + media);

                //Percorre o vetor nums
                for(int i = 0; i < nums.length; i++)
                    {
                        //Verifica se o número é par
                        if(nums[i] % 2 == 0)
                            {
                                //faz a soma dos números pares
                                somaPares = somaPares + nums[i];
                            }
                    }

                //imprime a soma dos números pares do vetor nums
                System.out.println("Soma dos números pares do Vetor : " + somaPares);

                //Percorre o vetor nums
                for(int i = 0; i < nums.length; i++)
                    {
                        //Verifica se o número é ímpar
                        if(nums[i] % 2 != 0)
                            {
                                //faz a soma dos números ímpares
                                somaImpares = somaImpares + nums[i];
                            }
                    }

                //imprime a soma dos números ímpares do vetor nums
                System.out.println("Soma dos números ímpares do Vetor : " + somaImpares);
            }
    }

