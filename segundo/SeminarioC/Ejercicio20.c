#include <stdio.h>
int cantidadPalabras(char string[], int tamanio){
	if(tamanio > 1){
		int palabras = 1;
		for(int i=0; i < tamanio; i++)
			if(string[i] == ' ')
				palabras++;
		return palabras;
	}else{
		return 0;
	}
}

int cantidadPalabrasDos(char string[]){
	int i = 0;
	while((string[i] == ' ') && (string[i] != '\0')){
		i++;
	}
	if(string[i] != '\0'){
		int palabras = 1;
		while(string[i] != '\0'){
			if(string[i] == ' '){
				palabras++;
				while(string[i] == ' ') 
					i++;
			}
			i++;
		}
		return palabras;
	}
	return 0;
}

int main(){
	char string[] = {"     Hola   mundo, que       tal?"};
	printf("La cantidad de palabras en el string: %d\n ", cantidadPalabrasDos(string));
	return 0;
}
