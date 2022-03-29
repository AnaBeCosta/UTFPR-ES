#include <stdio.h>
#include <stdlib.h>


int main(int argc, char *argv[]) {
	int n;
	int i;
	
	printf("Qual e o tamanho do vator? \n");
	scanf("%d", &n);
	
	int v[n];
	
	v[n] = malloc(n * sizeof(int));	
	v[n] = lendoVetor(&v, n);
	
	printf("Imprimindo vetores ... \n");
	
	for(i = 0; i < n; i++){
		
		printf("Vetor %d : %d \n", i, v[i]);
	}
	
	
	free(v);
	
	return 0;
}

void lendoVetor(int *vetor, int n){
	int i;
	
	printf("Digite os valores do vetor: \n");
	
	for( i = 0; i < n; i++){
		scanf("%d", &vetor[i]);
	}
	
	return 0;
}
