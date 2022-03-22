package main;

import java.util.Scanner;

public class Exer03{

	public static void main(String[] args) {
		int num[] = new int[3];// declarando um vetor de 3 posicoes
		int i;
		int maior1 = 0;

		Scanner input = new Scanner(System.in);
		for (i = 0; i < 3; i++) {

			num[i] = input.nextInt();
			if (num[i] > maior1) {
				maior1 = num[i];

			}

		}
		System.out.println(maior1);
	}
}
