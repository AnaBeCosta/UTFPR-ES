package main;

import java.util.Scanner;


public class Exer01 {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        double resultado;
        int a = input.nextInt();
        int b = input.nextInt();
        int c = input.nextInt();
        int d = input.nextInt();
        
        
        resultado = Exer01.maior(a, b, c, d);
 
        System.out.print(resultado);
    }
    
    public static double maior(int a, int b, int c, int d){
        int i;
        double n [] = {a, b, c, d};
        double maior = n[0];

        for(i = 0; i < n.length; i++){
             if ( maior < n[i]){
                maior = n[i];
             }
        }

       return maior;
    }
    
    
    
}
