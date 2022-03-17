package main;

import java.util.Scanner;
        
public class Exer04{
    public static void main(String args[]){
        Scanner  entrada = new Scanner (System.in);
        
        int n = entrada.nextInt();
        int m = entrada.nextInt();
        
        int soma =  n + m;
        int sub = n - m;
        
        System.out.println("soma = "+ soma);
        System.out.println("subtracao = "+ sub);
    }
}