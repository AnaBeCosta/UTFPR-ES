package main;

import java.util.Scanner;

public class Atv21_03 {
    public static void main(String[] args){
    Scanner entrada = new Scanner(System.in);

    String nome = entrada.nextLine();
    nome = nome.trim();
    
    System.out.print(nome.charAt(0));
    
        for(int i = 0; i < nome.length(); i++){
            if (nome.charAt(i) == ' '){
                if(nome.charAt(i + 1) != ' '){
                    System.out.print(nome.charAt(i+1));
                }
            }
        }
    }
}