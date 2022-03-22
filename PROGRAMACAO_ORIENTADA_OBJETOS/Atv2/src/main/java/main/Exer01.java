package main;

import java.util.Scanner;

public class Exer01{
public static void main (String args[]){
    Scanner entrada = new Scanner(System.in);

    double nota1, nota2, nota3, nota4;

    nota1 = entrada.nextDouble();
    nota2 = entrada.nextDouble();
    nota3 = entrada.nextDouble();
    nota4 = entrada.nextDouble();

    double media = (nota1 + nota2 + nota3 + nota4)/4;

    System.out.println(media);
    
    }
}