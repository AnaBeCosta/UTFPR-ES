package main;

import java.util.Scanner;


public class Exer03 {
    public static void main(String Args[]){
        Scanner input = new Scanner(System.in);
        String letras = "";
        int a = 0;
        int e = 0;
        int i = 0;
        int o = 0;
        int u = 0;
        
        do{
            letras = input.nextLine();
            
             for(int aux = 0;aux < letras.length(); aux++){
                
             
                if(letras.charAt(aux) == 'a' || letras.charAt(aux) == 'A'){
                    a++;
                }
                
                if(letras.charAt(aux) == 'e' || letras.charAt(aux) == 'E'){
                    e++;
                }
                
                if(letras.charAt(aux) == 'i' || letras.charAt(aux) == 'I'){
                    i = i + 1;
                }
                
                if(letras.charAt(aux) == 'o' || letras.charAt(aux) == 'O'){
                    o++;
                }
                
                if(letras.charAt(aux) == 'u' || letras.charAt(aux) == 'U'){
                    u++;
                }
                
            }
            
       }while(!letras.equals("FIM"));
        
    System.out.println("a=" + a);
    System.out.println("e=" + e);
    System.out.println("i=" + i);
    System.out.println("o=" + o);
    System.out.println("u=" + u);

    }
}
