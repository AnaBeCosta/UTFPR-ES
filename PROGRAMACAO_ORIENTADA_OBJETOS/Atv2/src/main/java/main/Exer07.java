package main;

import java.util.Scanner;

public class Exer07 {
    public static void main(String args[]){
        Scanner input = new Scanner(System.in);
        
        int a = input.nextInt();
        
        switch (a){
            case 1: 
                System.out.print("1 - Caixa");
                break;
                
            case 2: 
                System.out.print("2 - Financiamento");
                break;
                
            case 3: 
                System.out.print("3 - Empréstimo");
                break;
                
            case 4: 
                System.out.print("4 - Produtor Rural");
                break;
                
            case 5: 
                System.out.print("5 - Abertura de Contas");
                break;
                
            case 6: 
                System.out.print("6 - Falar com o Gerente");
                break;
                
            default:
                System.out.print("X - Opção Inexistente");
        }
    }
}
