#include<stdio.h>
#include<stdbool.h>
#include<ctype.h>

bool vogais(char c){
	c  = tolower(c);
	bool ret;
	ret = (c == 'a' || c == 'e' || c == 'o' || c == 'i' || c == 'u');
	
	return ret;
}


int main(){
	
	int i = 0;
    char c;
    
    FILE *arquivo, *copiaArquivo;
    
	arquivo = fopen("C:\\Users\\anaco\\OneDrive\\Documentos\\UTFPR\\ESTRUTURA_DE_DADOS\\Lista diagnóstica_10-03\\02\\arquivo.txt", "r");
   	copiaArquivo = fopen("copiaArquivo.txt", "w");
   	
    if (arquivo == NULL){
    	printf("Ocorreu um erro !\n");
    	return 1;
	}
	else{
		printf("Arquivo lido com sucesso! \n");
	}
	
	
	char ch;
	int cont = 1;
	
	while(!feof(arquivo)){
			
		ch = fgetc(arquivo);
		printf("%c", ch);
				
		if(vogais(ch)){
		fprintf(copiaArquivo, "%c", '*');
		}
		
		else{
		fprintf(copiaArquivo, "%c", ch);
			if(ch == '\n'){
			cont++;
			}
		}
	}
		
    fclose(arquivo);
	fclose(copiaArquivo);
	printf("Quantidade de linhas: %d\n", cont);

    return 0;

}

