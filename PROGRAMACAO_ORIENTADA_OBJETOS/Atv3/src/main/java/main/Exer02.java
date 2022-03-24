package main;

import java.util.Scanner;
import java.util.Arrays;

public class Exer02 {
    public static void main(String args[]){
        
        Scanner input = new Scanner( System.in);
        
        int n = input.nextInt();
        int VetorA[] = new int[n]; //Conjunto 1
        int VetorB[] = new int[n]; //Conjunto 2
        
        
        if(n > 1){    //Entrada dos Vetores
            for(int i = 0; i < n; i++){
                VetorA[i] = input.nextInt();
            }
            
            for(int i = 0; i < n; i++){
                VetorB[i] = input.nextInt();
            } 
        }
        
        
        
        int VetorC[] = new int[VetorA.length + VetorB.length] ; //Criando um vetor com a interseção
        int c = 0; //Auxiliar
        
        for(int a = 0; a < VetorA.length; a++){ 
            for(int b = 0; b < VetorB.length; b++){      
             if(VetorA[a] == VetorB[b]){   //Verificando se os vetores são iguais
                    VetorC[c++] = VetorA[a]; //Usando o auxiliar para dar o tamanho do VetorC
                 }
            }
        }
        
        for(int d = 0; d < c; d++){  //Imprimindo VetorC usando o auxiliar
            System.out.println(VetorC[d]);
        }
        
        
        
     } 
}      
