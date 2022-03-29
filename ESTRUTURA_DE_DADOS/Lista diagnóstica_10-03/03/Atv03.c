#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main() {
	int x = 0, y = 0;
	int valor = 0;
	
	printf("Qual e a base do calculo ?\n");
	scanf("%d", &x);
	
	printf("\n\nQual e o expoente do calculo ?\n");
	scanf("%d", &y);
	
	valor = calcular(x, y);
	
	printf("Resultado e : %d", valor);
	
	return 0;
}


int calcular (int base , int expoente){
	int resultado;
	
	resultado  = pow(base, expoente);
	
	return resultado;	
}
