#include <stdio.h>
#include <stdlib.h>

typedef struct{
	
	char nomeBanda[100];
	char tipoMusica[100];
	int numIntegrantes;
	int posicaoRank;
	
}dadosBanda;

void leitor(dadosBanda *Banda){
	int i;
	
	for(i = 0; i< 2;){
		
		printf("Qual e o nome da banda? \n");
		scanf(" %[^\n]s", Banda[i].nomeBanda);
		
		printf("Qual e o tipo musical? \n");
		scanf(" %[^\n]s", Banda[i].tipoMusica);
		
		printf("Qual e o numero de integrantes? \n");
		scanf(" %i", &Banda[i].numIntegrantes);
		
		printf("Qual e o ranking da banda entre as suas 2 bandas favoritas? \n");
		scanf(" %i", &Banda[i].posicaoRank);
		
		printf("-------------------------------------------------------------------\n\n");
		i++;
	}	
}

void imprimir(dadosBanda *Banda){
	int i;
	
	for(i=0; i < 2; i++){
		printf("\nRanking das 5 musicas favoritas : %d\n", Banda[i].posicaoRank);
		printf("Nome Banda  : %s \n", Banda[i].nomeBanda);
		printf("Tipo Musical  : %s \n", Banda[i].tipoMusica);
		printf("Quantidade de Integrantes : %d\n", Banda[i].numIntegrantes);
		printf("-------------------------------------------------------------------\n\n");
	}
}

void selecionar (dadosBanda *Banda){
	int i , r , s;
	
	printf("Ranking da Banda ? ");
	scanf("%d", &r);
	
	for (i = 0; i < 2; i++){
		
		if ( Banda[i].posicaoRank == r){
			s = i;
			printf("\nNome Banda  : %s \n", Banda[s].nomeBanda);
			printf("Tipo Musical  : %s \n", Banda[s].tipoMusica);
			printf("Quantidade de Integrantes : %d\n", Banda[s].numIntegrantes);
			printf("-------------------------------------------------------------------\n\n");
			
		
		}
		
		
	}
}
	


int main(int argc, char *argv[]) {
	
	dadosBanda Banda;
	
	leitor(&Banda);
	imprimir(&Banda);
	selecionar(&Banda);
	
	return 0;
}
