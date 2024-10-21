#include <stdio.h>
#include <ctype.h>
#define TOP 10
int main(){
	int x;
	int valoresAcumulados = 0;
	double valorAcumulado = 0;
	int cantLineas = 0;
	while(((x = getchar()) != EOF) && (cantLineas < TOP)){
		while((x == '\n' || x == '\t' || x == ' ')){
			x = getchar();
		}
		if((isdigit(x))){
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
	printf("count: %d , sum: %.2f\n", valoresAcumulados, valorAcumulado);
	return 0;
}
