#include <stdio.h>
#include <string.h>
#include <stdlib.h>
char *letras = {"0123456789ABCDEFGHIJKLMNOPQRSTUVWYZ"};

void invertir(char s[]){
	int i = 0; int j = strlen(s)-1; char tmp;
	for(; i < j; i++ ,j--){
		tmp = s[i];
		s[i] = s[j];
		s[j] = tmp;
	}
}

void convertir(int n, char s[], int base){
	int pos = 0;
	int negativo = n < 0;
	if(negativo){
		n = n * -1;
	}
	do{
		int resto = n % base;
		s[pos] = letras[resto];
		pos++;
		n = n / base;
	}while (n != 0);
	if(negativo){
		s[pos] = '-';
		pos++;
	}
	s[pos] = '\0';
	
	invertir(s);
}

int main(int argc, char *argv[]){
	char cadena[1024];
	int decimal = atoi(argv[1]);
	int base = atoi(argv[2]);
	convertir(decimal, cadena, base);
	printf("%s \n", cadena);
	return 0;
}
