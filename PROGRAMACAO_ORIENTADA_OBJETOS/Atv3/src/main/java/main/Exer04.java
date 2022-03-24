package main;

import java.util.Scanner;

public class Exer04 {
    public static void main(String args[]){
        Scanner input = new Scanner(System.in);
        String frase = input.nextLine();
        int tamFrase = frase.length();
        
        System.out.print(new StringBuilder(frase).reverse().toString());
        System.out.print("\n" + tamFrase);
    }
}
