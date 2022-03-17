package main;

import java.util.Scanner;

public class Exer05{
    public static void main(String args[]){
    Scanner entrada = new Scanner(System.in);

    String nome = entrada.next();
    String sobrenome = entrada.next();
    
    System.out.print(nome+" "+sobrenome);
    }
}