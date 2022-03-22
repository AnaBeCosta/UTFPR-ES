package main;

import java.util.Scanner;

public class Exer06{
    public static void main(String args[]) {
    Scanner input = new Scanner(System.in);
    
    int a = 0;
    int total = 0;
    int num = 0;
    
     do{
          a++;
          num = input.nextInt(); 
          if(num > 0){
              total += num;
          }
         }while(num >= 0);
	
    System.out.print("Quantidade = " + a);
    System.out.print("\nSoma = " + total);
    
    input.close();
    }
}
