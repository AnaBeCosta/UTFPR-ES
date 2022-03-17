package main;

import java.util.Scanner;
        
public class Exer03 {
    public static void main(String args[]){
        Scanner  entrada = new Scanner (System.in);
        
        int n = entrada.nextInt();
        
        int saida = n * n;
        
        System.out.print(saida);
    }
}