#include <stdio.h>
#include <stdlib.h>

void converter(int totalM, int *h, int *m){
	*h = totalM / 60;
	*m = totalM % 60;
	
	
	return 0;
}



int main() {
	int h, m, TotalMinutos;
	
	printf("Quantidade total de minutos : ");
	scanf("%d", &TotalMinutos);
	
	converter(TotalMinutos, &h, &m);
	printf("%dh %dm", h, m);
	
	return 0;
}

