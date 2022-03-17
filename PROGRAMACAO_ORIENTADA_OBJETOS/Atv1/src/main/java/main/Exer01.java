package main;

import java.util.Scanner;
        
public class Exer01{
    public static void main(String args[]){
        Scanner  entrada = new Scanner (System.in);
        
        int one = entrada.nextInt();
        float two = entrada.nextFloat();
        String three = entrada.next();
        
        System.out.println(one);
        System.out.println(two);
        System.out.println(three);
    }
}