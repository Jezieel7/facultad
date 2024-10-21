#include <stdio.h>
#include <ctype.h>
#define TOP 10
#define FMAX 5
int main(){
	int x;
	int valoresAcumulados = 0;
	int cantMax = 0;
	double valorAcumulado = 0;
	double res = 0;
	int cantLineas = 0;
	while(((x = getchar()) != EOF) && (cantLineas < TOP)){
		while((x == '\n' || x == '\t' || x == ' ')){
			x = getchar();
		}
		if(isdigit(x)){
			if(( x - '0') > FMAX){
				cantMax++;
			}
			valorAcumulado += (double)(x - 48);
			valoresAcumulados++;
			while(x != '\n'){
				x = getchar();
			}
		}else{
			while(x != '\n'){
				x = getchar();
			}
		}
		cantLineas++;
	}
	res = (valorAcumulado/valoresAcumulados);
	printf("Promedio: %.2f , cantidad de numeros que son mayores que la macro: %d\n", res, cantMax);
	return 0;
}
