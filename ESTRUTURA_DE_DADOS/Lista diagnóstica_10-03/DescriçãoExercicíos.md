## Atividade - 02/03

##### 1. [Ponteiros] Um ponteiro pode ser usado para dizer a uma função onde ela deve depositar o resultado de seus cálculos. Escreva uma função que converta uma quantidade de minutos na notação horas/minutos. A função recebe como parâmetro:
- Um número inteiro (totalMinutos); e
- Os endereços de duas variáveis inteiras, horas e minutos.
##### A função deve então atribuir valores às variáveis passadas por referência, de modo que os valores atribuídos respeitem as seguintes condições:
- minutos < 60
- 60 ∗ horas + minutos = totalMinutos
##### Escreva também a função principal (main) que use a função desenvolvida.
.

##### 2. [Arquivos] Faça um programa que receba do usuário um arquivo texto. Crie outro arquivo texto de saída contendo o texto do arquivo de entrada original, porém substituindo todas as vogais pelo caractere ‘*’. Além disso, mostre na tela quantas linhas esse arquivo possui. Dentro do programa faça o controle de erros, isto é, insira comandos que mostre se os arquivos foram abertos com sucesso, e caso contrário, imprima uma mensagem de erro encerrando o programa.
.

##### 3. [Recursão] Escreva uma função recursiva para calcular o valor de um número inteiro de base x elevada a um expoente inteiro y.
.

##### 4. [Alocação Dinâmica] Faça um programa que leia um valor N e crie dinamicamente um vetor com essa quantidade de elementos. Em seguida, passe esse vetor para uma função que vai ler os elementos desse vetor. Depois, no programa principal, imprima os valores do vetor preenchido. Além disso, antes de finalizar o programa, lembre-se de liberar a área de memória alocada para armazenar os valores do vetor.
.

##### 5. [Structs, Ponteiros] Defina um tipo abstrato de dados que irá representar bandas de música. Essa estrutura deve ter o nome da banda, que tipo de música ela toca, o número de integrantes, e em que posição do ranking essa banda está dentre as suas 5 bandas favoritas.
- a) Crie uma função para preencher as 5 estruturas de bandas criadas no exemplo passado;
- b) Após criar e preencher, exiba todas as informações das bandas/estruturas;
- c) Crie uma função que peça ao usuário um número de 1 até 5. Em seguida, seu programa deve exibir informações da banda cuja posição no seu ranking é a que foi solicitada pelo usuário.