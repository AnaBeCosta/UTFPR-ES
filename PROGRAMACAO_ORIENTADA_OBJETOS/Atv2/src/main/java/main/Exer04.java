package main;

import java.util.Scanner;

public class Exer04{

	public static void main(String[] args) {
	Scanner input = new Scanner(System.in);
	    
		int num;
		int i;
                
        num = input.nextInt();
                
                
		for (i = 1 ; i <= num ; i ++) {
		    
			System.out.print(i+" ");
		}
	}
}