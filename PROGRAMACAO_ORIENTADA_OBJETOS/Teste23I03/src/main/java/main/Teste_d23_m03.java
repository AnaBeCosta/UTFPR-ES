package main;

import java.util.Scanner;

public class Teste_d23_m03 {
    public static void main(String args[]){
        Scanner entrada = new Scanner(System.in);
        
        int a = entrada.nextInt();
        int b = entrada.nextInt();
        int matriz [][] =  new int [a][b];

        for (int i = 0; i < a; i++){
            for (int j = 0; j < b; j++){
                System.out.printf("(%d,%d)", i, j);
            }
            System.out.println();
        }

    }
}
