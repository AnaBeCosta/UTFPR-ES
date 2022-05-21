package main;

import java.util.Scanner;


public class Exer03{

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        int tam = input.nextInt();
        int matriz[][] = new int[tam][tam];
        
        for(int i = 0; i < tam; i++){
            for(int j = 0; j < tam; j++){
                matriz [i][j] = input.nextInt();
            }
        }
        
         printDiagonalPrincipal(matriz);

    }
    
    public static void  printDiagonalPrincipal(int matriz[][]){

        int aux = 0;
        
        aux =  matriz.length ;
        
        
        for(int i = 0; i < aux; i++){
            for(int j = 0; j < aux; j++){
                    if(i == j){
                        System.out.print(matriz[i][j] +" ");      
                    }
                }
            }
        
      }
    
}
    
