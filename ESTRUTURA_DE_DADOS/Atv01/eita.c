#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#define tam 200



//.....Estrutura da Pilha.....
typedef struct{  

	int vetor[tam];  
	int topo;
		   	
}pilha;



//......Inicia a Pilha.......
void iniciaP(pilha *p){ 

	p->topo = -1;	
	
}

//....Boleano Pilha Vazia....
bool pilhaVazia(pilha *p){
	
	return(p->topo == -1);
	
}

//....Boleano Pilha Cheia....
bool pilhaCheia(pilha *p){ 

	return(p->topo == (tam - 1));
	
}

//......Tamanho Pilha.......
int tamanhoP(pilha *p){
	
	return(p->topo + 1);
	
}

//.....Empilha a Pilha.......
void empilhaP(pilha *p, int v){ 
	
	
	if(pilhaCheia(p)){
		
		printf("Ocorreu um erro, segue erro: \n PILHA LOTADA");
	
	}else{
		p->topo++;
		p->vetor[p->topo] = v;

	}
}

//....Desempilha a Pilha......
int desempilhaP(pilha *p, int *x){
	
	
	if(pilhaVazia(p) == false){
		
		x = p->vetor[p->topo];
		p->topo--;
		
	}else{
		
		printf("Ocorreu um erro, segue erro: \n PILHA VAZIA");
		
	}
	
	return(x);
}





//......Imprime Pilha.......
void imprimeP(pilha *p){
	int i;
	
	printf("Valores da Pilha : {");
	
	for(i = 0; i <= p->topo; i++){
		
		printf(" %d", p->vetor[i]);
		
	}
	
	printf(" }\n");
	
}


//......Converte Pilha.......
void converteP(pilha *p, int v){
	
	unsigned long long bin = 0, num = 0, resposta = 0, cont = 0;
	

	do{
		
		bin = (bin * 10) + (v % 2);
		v = v / 2;
		cont++;
		
	}while(v > 0);
	
	do{
		
		cont--;
		resposta = (resposta * 10) + (bin % 2);
		bin = (bin - (bin % 2)) / 10;

	}while(cont > 0);
	
	empilhaP(p, resposta);
	
}


//..........MAIN........
int main(int argc , const char *argv[]){
	
	pilha Principal;
	pilha Saida;
	int resultado;
	int valor;
	int tamP;
	int i;
	char c;
	
	 // usando o argc 
	printf("\nNumero de parametros fornecidos: %d\n", argc);
	  
	if(argc!= 3) {
		printf("\nQuantidade de parametros invalida\n");
	    return 0;
	}  
	
	int h = 0;
	for(h = 0; h < argc; h++) {
	    printf("argv[%d] = %s\n", h, argv[h]);
	}
	
	FILE *fileEntrada;
	FILE *fileAux;
	FILE *fileSaida;
	
	fileEntrada = fopen(argv[1],"r");
	fileAux     = fopen(argv[1],"r");
	fileSaida   = fopen(argv[2],"w");
	
	iniciaP(&Principal);
	
	if(fileEntrada == NULL || fileSaida == NULL){
		
		printf("Erro");
		
		return 0;
	}
	
	
	while(!feof(fileEntrada)){
				
		if(c = fgetc(fileAux) != '\n'){
				
			fscanf(fileEntrada,"%d", &valor);
			
			converteP(&Principal, valor);
			
		}
	}	
	
	printf("\nConversao realizada com sucesso :)\n\n");
	
	int tamanho = tamanhoP(&Principal);
						
	int remove;
			
	for(i = 0; i < tamanho; i++){
		
		resultado = desempilhaP(&Principal, &remove);
		
		fprintf(fileSaida, "%d", resultado);
		
		fprintf(fileSaida,"\n");
		
	}
			
	
	fclose(fileAux);
	fclose(fileEntrada);
	fclose(fileSaida);
	
	return 0;
}
