package main;

import java.util.Scanner;

public class Exer08 {
    public static void main(String args[]) {
    Scanner input = new Scanner(System.in);
    
    int a = 0;  //  [0,25]   = 2
    int b = 0;  //  [26,50]  = 1
    int c = 0;  //  [51,75]  = 0
    int d = 0;  //  [76,100] = 4
    int num = 0;
    
     do{
          num = input.nextInt(); 
          
          if(0 <= num && num <= 25 ){
            a++;
          }
          
          if(26 <= num && num <= 50 ){
            b++;
          }
          
          if(51 <= num && num <= 75 ){
            c++;
          }
          
          if(76 <= num && num <100 ){
            d++;
          }
         }while(num > 0);
	
    System.out.println("[0,25] = " + a);
    System.out.println("[26,50] = " + b);
    System.out.println("[51,75] = " + c);
    System.out.println("[76,100] = " + d);
    }
}
