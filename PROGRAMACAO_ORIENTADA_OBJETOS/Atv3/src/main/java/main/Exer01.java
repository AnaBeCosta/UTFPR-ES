package main;

import java.util.Scanner;

public class Exer01 {
    public static void main(String args[]){
        
        Scanner input = new Scanner( System.in);
        
        int n = input.nextInt();
        int soma = 0;
        int Vetor[] = new int[n];
        
        if(n > 1){
            for(int i = 0; i < n; i++){
                Vetor[i] = input.nextInt();
                soma = soma + Vetor[i];
            }
            
            double mediaA = Double.valueOf(soma) /Double.valueOf(n);
            
            System.out.printf("%.2f", mediaA);
            
            for(int a = 0; a < n; a++){
                if(Vetor[a] > mediaA){
                  System.out.printf("\n" + (Vetor[a]));
                 }
            }
            
        }
        
    }      
}
