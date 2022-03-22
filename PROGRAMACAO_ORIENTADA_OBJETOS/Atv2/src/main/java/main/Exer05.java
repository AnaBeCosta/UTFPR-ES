package main;

import java.util.Scanner;

public class Exer05{

	public static void main(String[] args) {
	Scanner input = new Scanner(System.in);
	    
		int num;
		int i;
                
        num = input.nextInt();
                
                
		for (i = num ; i > 0 ; i--) {
		    
			System.out.print(i+" ");
		}
	}
}