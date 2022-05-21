package main;

import java.util.Scanner;


public class Exer02 {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        int resultado;
        int valores[] = new int[4];
        
        for( int i = 0; i < valores.length; i++){
            valores [i] = input.nextInt();
        }
        
        resultado = Exer02.procuraMaiorValor(valores);
 
        System.out.print(resultado);
    }
    
    public static int procuraMaiorValor(int valores[]){
        int i;
        int maior = valores[0];

        for(i = 0; i < valores.length; i++){
             if ( maior < valores[i]){
                maior = valores[i];
             }
        }

       return maior;
    }
    
    
    
}
