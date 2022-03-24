package main;

import java.util.Scanner;

public class Exer05 {
    public static void main(String args[]){
        Scanner input = new Scanner(System.in);
        String texto = input.nextLine();
        String pesquisa = input.nextLine();
        int num = 0;
        
        for(int i = 0; i < texto.length(); i++){
            if(texto.substring(i).startsWith(pesquisa)){
                num++;
            }
        }
        
        
        System.out.printf(pesquisa + "=" + num);
       
    }
}