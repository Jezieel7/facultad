#include <stdio.h>
void imprimirInversoIterativo(char string[], int tamanio){
	for(int i=tamanio; i >= 0; i--)
		printf("%c", string[i]);
	printf("\n");
}

void imprimirInversoRecursivo(char string[], int posicion){
	if(posicion != 0){
		printf("%c", string[posicion]);
		posicion--;
		imprimirInversoRecursivo(string, posicion);
	}else{
		printf("%c", string[0]);
		printf("\n");
	}
}
int main(){
	char string[] = {"mundo"};
	imprimirInversoIterativo(string, (sizeof(string)-1));
	imprimirInversoRecursivo(string, (sizeof(string)-1));
	return 0;
}

